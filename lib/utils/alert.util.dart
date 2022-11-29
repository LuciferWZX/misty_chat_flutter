import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:misty_chat/utils/global.util.dart';


class AlertUtil {
  static void showSuccessAlert({
    required String title,
    required String content
  }){
    BuildContext? context = Global.navigatorKey.currentState!.context;
    final materialBanner = MaterialBanner(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message:content,
        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
        // to configure for material banner
        inMaterialBanner: true,
      ),
      actions: const [SizedBox.shrink()],
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);
  }
  static void showErrorToast({
    required String text,
  }){
    BuildContext? context = Global.navigatorKey.currentState!.context;
    context.showErrorBar(
        content: Text(text));

  }
}