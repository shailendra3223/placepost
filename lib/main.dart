import 'package:digitalmaster/dashboard_page.dart';
import 'package:digitalmaster/spash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'auth/login_page.dart';

void main()   async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: box.read("isUserExists")==null||box.read("isUserExists")==""?SpashScreen(): DashBoardPage(),
    );
  }
}

