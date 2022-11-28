import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';

class ContactControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.put<ContactController>(ContactController());
  }
}