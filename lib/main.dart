import 'package:flutter/material.dart';
import 'app/app.dart';
import 'config/dependency/dependency_injection.dart';

void main(){
  DependencyInjection di = DependencyInjection();
  di.dependencies();

  runApp(App());
}