import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:misty_chat/bindings/app.binding.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/global.util.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Global.navigatorKey,
      initialRoute: Routes.initialRoute,
      getPages: Routes.pages,
      initialBinding: AppControllerBinding(),
      builder: (context,_){
        final theme = Theme.of(context);
        final isThemeDark = theme.brightness == Brightness.dark;
        var child = _!;
        child = FlutterEasyLoading(
          child: child,
        );
        child = FlashTheme(
          flashBarTheme: isThemeDark
              ? const FlashBarThemeData.dark()
              : const FlashBarThemeData.light(),
          flashDialogTheme: const FlashDialogThemeData(),
          child: child,
        );
        return child;
      },
    );
  }
}