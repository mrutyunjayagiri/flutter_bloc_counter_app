import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/constants/enum.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/internet_cubit.dart';

class MyHomePage extends StatefulWidget {
  final Color color;
  MyHomePage({Key key, this.title, this.color}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext homeContext) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pushNamed("/settings"))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text(
                  'Mobile Connected',
                  style: textTheme.headline5.copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text(
                  'Wifi Connected',
                  style: textTheme.headline5.copyWith(color: Colors.green),
                );
              } else if (state is InternetDisconnected) {
                return Text(
                  'Internet Disconnected',
                  style: textTheme.headline5.copyWith(color: Colors.red),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
            BlocConsumer<CounterCubit, CounterState>(
                builder: (BuildContext context, state) => Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                listener: (context, state) {
                  if (state.wasIncremented)
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Incremented"),
                      duration: Duration(milliseconds: 200),
                    ));
                  else if (!state.wasIncremented)
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("Decremented")));
                }),
            Builder(builder: (BuildContext context) {
              /// Watch => Nearest Parent Widget Will Be Rebuild , Here Builder is Parent Widget Of Text As It Has New Diff BuildContext
              /// So It does not rebuild the whole ui. Builder Will Be Rebuild.
              final counterState = context.watch<CounterCubit>().state;
              final internetState = context.watch<InternetCubit>().state;
              if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Wifi) {
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet State: WIfi",
                  style: textTheme.headline6,
                );
              } else if (internetState is InternetConnected &&
                  internetState.connectionType == ConnectionType.Mobile) {
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet State: Mobile",
                  style: textTheme.headline6,
                );
              } else if (internetState is InternetDisconnected) {
                print("Internet Got Disconnected");
                return Text(
                  "Counter: " +
                      counterState.counterValue.toString() +
                      " Internet State: Disconnected",
                  style: textTheme.headline6,
                );
              }
              return Text(
                "Counter: " + "Internet State: ",
                style: textTheme.headline6,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                  heroTag: "Homej",
                ),
                // SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.bloc<CounterCubit>().increment();
                  },
                  heroTag: "Home",
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Builder(
              builder: (BuildContext builderContext) => MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () =>
                    Navigator.of(builderContext).pushNamed("/second"),
                child: Text("Go to Second Screen"),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.orange,
              onPressed: () => Navigator.of(homeContext).pushNamed("/third"),
              child: Text("Go to Third Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
