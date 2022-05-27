import 'package:digitalmaster/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInPage extends GetWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:Column(
        children: [
           MaterialButton(
             onPressed: () {
               Get.to(()=>
                   DashBoardPage()
               );

             },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
