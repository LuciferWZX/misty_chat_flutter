import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:misty_chat/bindings/app.binding.dart';
import 'package:misty_chat/routes/index.dart';

class MyApp extends StatelessWidget {
  const   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.initialRoute,
      getPages: Routes.pages,
      initialBinding: AppControllerBinding(),
      builder: EasyLoading.init(),
    );
  }
}