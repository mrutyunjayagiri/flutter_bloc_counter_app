part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  SettingState({this.appNotifications, this.emailNotifications});

  SettingState copyWith({bool appNotifications, bool emailNotifications}) {
    return SettingState(
        appNotifications: appNotifications ?? this.appNotifications,
        emailNotifications: emailNotifications ?? this.emailNotifications);
  }

  @override
  String toString() {
    return 'SettingState{appNotifications: $appNotifications, emailNotifications: $emailNotifications}';
  }

  @override
  List<Object> get props => [appNotifications, emailNotifications];
}
