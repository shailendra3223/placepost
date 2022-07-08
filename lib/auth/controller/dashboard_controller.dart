

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../model/category_model.dart';

class DashBoardController extends GetxController {
  List<dynamic> category = [];
  List<dynamic> name = [];
  List<CategoryName> category_name = [];
  bool isLoading = true;
  bool puchase = false;

  @override
  void onInit() {
    super.onInit();
    getCategoryName();
  }

  void setLoader(bool loading) {
    isLoading = loading;
    update();
  }



  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void getCategory() async {
    setLoader(true);
    var response =  await firebaseFirestore.collection("collection").get();
    for(var data in response.docs){
      final mainData = data.data();
     mainData.forEach((key,value) {
      final images = value as List;
       CategoryName name = CategoryName(name:key , images: images.map((e) => e.toString()).toList());
       category_name.add(name);
     });
      setLoader(false);
     update();

    }
  }

  void getCategoryName() async {
    setLoader(true);
    var response = await firebaseFirestore.collection("collection").get();
    for (var data in response.docs) {
      for (var dv in data.data().keys) {
        name.add(dv);
        update();
      }
      getCategory();
      update();
    }
  }
}
