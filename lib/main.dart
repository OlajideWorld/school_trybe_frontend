import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/AuthPage/bindings/authbinding.dart';
import 'package:school_management/routes/routes.dart';
import 'package:school_management/utils/size-config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
      return GetMaterialApp(
        theme: ThemeData(),
        title: 'School_Management',
        debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        initialRoute: Pages.splashScreen,
        getPages: Pages.routes,
      );
    });
  }
}
