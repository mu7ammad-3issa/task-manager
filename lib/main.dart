import 'package:flutter/material.dart';
import 'package:task_manager/core/routing/app_router.dart';
import 'package:task_manager/core/di/dependency_injectiond.dart';
import 'package:task_manager/core/helpers/helper_methods/shared_pref_helper.dart';
import 'package:task_manager/core/constants/constants.dart';
import 'package:task_manager/task_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize API key
  await initializeApiKey();

  // Setup dependency injection
  await setupGetIt();

  runApp(MyApp(appRouter: AppRouter()));
}

Future<void> initializeApiKey() async {
  const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtieWJkdGFjb3F2Z2NpanJremt2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYwMzUwNjAsImV4cCI6MjA3MTYxMTA2MH0.SAF_9jupuaVLHq0l7Zbew7t6avUdg_UkdVGqLZmHTQE';
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.anonKey, anonKey);
}
