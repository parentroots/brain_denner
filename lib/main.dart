import 'package:brain_denner/storage/storage_services.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'config/dependency/dependency_injection.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await LocalStorage.getAllPrefData();
  DependencyInjection di = DependencyInjection();


  di.dependencies();

  runApp(App());
}

