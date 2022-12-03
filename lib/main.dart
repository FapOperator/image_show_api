import 'package:flutter/material.dart';
import 'package:image_show_api/myApp.dart';
import 'package:image_show_api/di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await get_it.init();
  runApp(const MyApp());
}
