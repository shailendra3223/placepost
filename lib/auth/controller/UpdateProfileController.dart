
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController{
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailIdController = TextEditingController();
  final passwordcontroller = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();
  late File _image;
  late String username,changepassword,email,mobileNumber,address;
  @override
  void onInit() {
    // TODO: implement onInit
    setData();
    super.onInit();
  }

  void setData()async{
    nameController.text= username;
    passwordcontroller.text= changepassword;
    emailIdController.text= email;
    addressController.text = address;
    mobileNumberController.text= mobileNumber;
    update();
  }
  void imgFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );
      _image = image as File;
      update();

  }

  void imgFromGallery() async {
    XFile? image = await  _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
      _image = image as File;
      update();

  }

}