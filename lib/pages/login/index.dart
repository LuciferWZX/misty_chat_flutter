import 'package:flutter/material.dart';
import 'package:misty_chat/pages/login/pinput.dart';

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
      body: Center(
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
      ),
    );
  }

  Widget buildTitle(){
    Widget baseTitle = Container(
      alignment: Alignment.center,
      child: const Text("登录",style: TextStyle(
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
          child: const Text("输入PIN码",style: TextStyle(
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
                  labelText: "电话号码",
                  hintText: "输入你的电话号码"
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
                if(!regExp.hasMatch(value!)){
                  return "电话号码不合法";
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
            Text(step == 1?"还没有账号？":"记不得你的PIN码？"),
            TextButton(
                onPressed: (){
                  if(step == 1){
                    print("点击了去注册");
                  }else{
                    print("点击了重置PIN码");
                  }

                },
                child: Text(step==1?"去注册":"重置PIN码")
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
                // 通过_formKey.currentState 获取FormState后，
                // 调用validate()方法校验用户名密码是否合法，校验
                // 通过后再提交数据。
                if((_formKey.currentState as FormState).validate()){
                  //验证通过提交数据
                  setState(() {
                    step = 2;
                  });
                }
              },
              child: const Text("登录"))
      )
      ],
    );
  }
}
