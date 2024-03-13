import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:android_alarm_manager/android_alarm_manager.dart';

void backgroundFetchHeadlessTask(String taskId) async {
  // Your background task logic goes here
  print("[BackgroundFetch] Headless event received: $taskId");
  // ...
}

Future<void> startAlarm() async {
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(const Duration(minutes: 2), 0, backgroundFetchHeadlessTask);
}

void bootReceiver() {
  // Start your app or initiate any necessary background tasks here
  startAlarm();
}
