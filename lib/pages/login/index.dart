import 'dart:math';

import 'package:flutter/material.dart';
import 'package:misty_chat/pages/login/pinput.dart';

import '../../widgets/animated_wave/animated_background.dart';
import '../../widgets/animated_wave/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  int step = 1;

  @override
  void dispose(){
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: AnimatedBackground()),
          onBottom(const AnimatedWave(
            height: 180,
            speed: 1.0,
          )),
          onBottom(const AnimatedWave(
            height: 120,
            speed: 0.9,
            offset: pi,
          )),
          onBottom(const AnimatedWave(
            height: 220,
            speed: 1.2,
            offset: pi / 2,
          )),
          Positioned.fill(
              child:Center(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    buildTitle(),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10,right:10 ),
                      child: buildForm(),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
  onBottom(Widget child) => Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  );
  Widget buildTitle(){
    Widget baseTitle = Container(
      alignment: Alignment.center,
      child: const Text("??????",style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w500
      ),),
    );
    if(step == 1){
      return baseTitle;
    }
    return Column(
      children: [
        baseTitle,
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          child: const Text("??????PIN???",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500
          ),),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Flex(direction: Axis.horizontal,
              children: [
                TextButton(
            onPressed: (){
              setState(() {
                step = 1;
              });
            },
            child: Text(_phoneController.text,)
        )
              ],
            )
        )
      ],
    );
  }
  Widget buildForm(){
    return Form(
      key:_formKey,
        child: Column(
          children: [
            step == 1?TextFormField(
              autofocus: false,
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: "????????????",
                  hintText: "????????????????????????"
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
                if(!regExp.hasMatch(value!)){
                  return "?????????????????????";
                }
                return null;
              },
            ):VerifyPinput(phoneNumber: _phoneController.text,),
            buildAsk(),
            step == 1 ? buildSubmitButton():Container()
          ],
        )
    );
  }
  Widget buildAsk(){
    return(
      Container(
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(step == 1?"??????????????????":"???????????????PIN??????"),
            TextButton(
                onPressed: (){
                  if(step == 1){
                    print("??????????????????");
                  }else{
                    print("???????????????PIN???");
                  }

                },
                child: Text(step==1?"?????????":"??????PIN???")
            )
          ],
        ),
      )
    );
  }
  Widget buildSubmitButton(){
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: (){
                // ??????_formKey.currentState ??????FormState??????
                // ??????validate()????????????????????????????????????????????????
                // ???????????????????????????
                if((_formKey.currentState as FormState).validate()){
                  //????????????????????????
                  setState(() {
                    step = 2;
                  });
                }
              },
              child: const Text("??????"))
      )
      ],
    );
  }
}
