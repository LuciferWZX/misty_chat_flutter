import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/services/api.service.dart';
import 'package:misty_chat/utils/loading.util.dart';
import 'package:misty_chat/utils/router.util.dart';
import 'package:misty_chat/utils/store.util.dart';
import 'package:misty_chat/utils/store_key.dart';
import 'package:pinput/pinput.dart';

class VerifyPinput extends StatefulWidget {
  final String phoneNumber;
  const VerifyPinput({Key? key,required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyPinput> createState() => _VerifyPinputState();
}

class _VerifyPinputState extends State<VerifyPinput> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();


  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }
  @override
  void dispose(){
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Container(
      child: Pinput(
        controller: pinController,
        focusNode: focusNode,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin)async {
          var response= await Get.find<APIService>().getAppController();
          response.loginByPhone(phone: widget.phoneNumber,pin: pin);
          // debugPrint('onCompleted: $pin');
          // await LoadingUtil.showLoading(title: "登录中...");
          // await StoreUtil.save(StoreKey.token,"this is token");
          // await Future.delayed(Duration(seconds: 2));
          // await  LoadingUtil.closeLoading();
          // await RouterUtil.redirectPath(path: RoutePath.home);
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: focusedBorderColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
