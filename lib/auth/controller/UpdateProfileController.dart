import 'dart:io';

import 'package:digitalmaster/dashboard_page.dart';
import 'package:digitalmaster/preferance/PrefsConst.dart';
import 'package:digitalmaster/preferance/pref.dart';
import 'package:digitalmaster/screen/dashboard_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();


  final ImagePicker imagePicker = ImagePicker();
  File? image;

  @override
  void onInit() {

    super.onInit();
    setProfileData();
  }

  void setProfileData() async {
    nameController.text =  Prefs.getString(PrefsConst.NAME)??"";
    ownerNameController.text = Prefs.getString(PrefsConst.OwnerName)??"";
    emailController.text = Prefs.getString(PrefsConst.Email)??"";
    mobileController.text = Prefs.getString(PrefsConst.MOBILE)??"";
    addressController.text =Prefs.getString(PrefsConst.ADDRESS)??"";
    if(Prefs.getString(PrefsConst.PROFILEPATH)!=null){
      image = File(Prefs.getString(PrefsConst.PROFILEPATH)!);
    }

    update();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Provide valid Name";
    }
    return null;
  }

  String? validateOwnerName(String value) {
    if (value.isEmpty) {
      return "Provide valid Owner Name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email id";
    }
    return null;
  }

  String? validateMobile(String value) {
    if (value.length < 10) {
      return "Provide valid Mobile number";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Provide valid Address";
    }
    return null;
  }
  //
  // String? validatePassword(String value) {
  //   if (value.length < 6) {
  //     return "Provide valid Password";
  //   }
  //   return null;
  // }

  void checkLogin() {
    final isValid = profileFormKey.currentState!.validate();
    if (isValid) {
      Prefs.setString(PrefsConst.NAME, nameController.text);
      Prefs.setString(PrefsConst.OwnerName, ownerNameController.text);
      Prefs.setString(PrefsConst.Email, emailController.text);
      Prefs.setString(PrefsConst.MOBILE, mobileController.text);
      Prefs.setString(PrefsConst.ADDRESS, addressController.text);
      if(image!=null){
        Prefs.setString(PrefsConst.PROFILEPATH, image!.path);
      }


      Get.to(()=>
          DashBoardPage()
      );


    }
   // profileFormKey.currentState!.save();
  }

  void imgFromCamera() async {
     XFile? img = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    image = File(img!.path);
    update();
  }

  void imgFromGallery() async {
    XFile? img = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    image = File(img!.path);
    update();
  }
}
