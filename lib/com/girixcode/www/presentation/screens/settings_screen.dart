import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/setting_cubit.dart';

class SettingScreen extends StatelessWidget {
  final Color color;

  final String title;

  const SettingScreen({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      // ignore: missing_required_param
      body: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, settingState) {
          return Column(
            children: [
              SwitchListTile(
                value: settingState.appNotifications,
                onChanged: (value) =>
                    context.read<SettingCubit>().appNotificationToggle(value),
                title: Text("App Notifications"),
                subtitle: Text("Turn on/off app notification"),
              ),
              SwitchListTile(
                value: settingState.emailNotifications,
                onChanged: (value) =>
                    context.read<SettingCubit>().emailNotificationToggle(value),
                title: Text("Email Notifications"),
                subtitle: Text("Turn on/off email notification"),
              )
            ],
          );
        },
      ),
    );
  }
}
