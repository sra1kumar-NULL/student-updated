import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/authentication/signin.dart';
import 'package:app/authentication/signup.dart';
import 'package:app/ui/starthome.dart';
import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:workmanager/workmanager.dart';

import 'authentication/signin.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // DateTime n = DateTime();
    //simpleTask will be emitted here.
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
  Workmanager().registerOneOffTask("1", "simpleTask");

  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: const Color(0xFF5db075).toMaterialColor(),
    ),
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splashTransition: SplashTransition.slideTransition,
      duration: 1500,
      backgroundColor: const Color(0xFF5db075),
      splash: 'assets/playstore.png',
      nextScreen: LoginScreen(),
    ),
  ));
}
