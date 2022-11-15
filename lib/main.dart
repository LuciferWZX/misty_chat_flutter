import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:misty_chat/pages/app.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

