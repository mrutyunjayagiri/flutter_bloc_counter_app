import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/setting_cubit.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/presentation/router/app_router.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/utility/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver(); // To Observe Bloc/Cubit State

  /// Here Instantiating The Least Dependency Contstructor as AppRouter & Connectivity are Two Which are Not Dependent Two AnyOne;
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({Key key, this.appRouter, this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(),
          lazy: false, // false => Forcing To Create SettingCubit Instance
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
