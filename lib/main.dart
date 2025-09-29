import 'package:fitform_ai/App/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'App/modules/Onboarding/onboarding_screen.dart';

void main(){
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,home: SplashScreen(),));
}