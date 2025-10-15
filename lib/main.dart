import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/modules/splash/splash_screen.dart';

void main(){
  runApp(const GetMaterialApp(debugShowCheckedModeBanner: false,home: SplashScreen(),));
}