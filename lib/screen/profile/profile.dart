import 'dart:io';

import 'package:digitalmaster/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/controller/UpdateProfileController.dart';

class ProfilePage extends GetView {
   UpdateProfileController _controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Edit Profile")),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Get.to(() => LogInPage());
              },
              icon: Icon(Icons.logout_rounded)),
        ],
        backgroundColor: const Color(0xff012132),
      ),
      body: GetBuilder<UpdateProfileController>(
        init: _controller,
        builder: (value) {
          return SingleChildScrollView(
            child: Form(
              key: value.profileFormKey,

              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (() {
                        _showPicker(context);
                      }),
                      child:value.image==null? Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ):SizedBox(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                          backgroundImage: FileImage(value.image!,

                          ),
                          ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          return _controller.validateName(value!);
                        },
                        controller: value.nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name of Institute',
                          hintText: 'Name of Institute',
                            errorStyle: TextStyle(
                                color: Colors.red
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextFormField(

                        validator: (value) {
                          return _controller.validateOwnerName(value!);
                        },
                        controller: value.ownerNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Name of Classowner",
                        ),
                        keyboardType: TextInputType.name,
                        //obscureText: true,

                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(

                        validator: (value) {
                          return _controller.validateEmail(value!);
                        },
                        controller: value.emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email ID',
                          hintText: 'Email ID',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(

                        validator: (value) {
                          return _controller.validateMobile(value!);
                        },
                          controller: value.mobileController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile No',
                          hintText: 'Mobile No',
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextFormField(
                    //     //
                    //     // validator: (value) {
                    //     //   return _controller.validateMobile(value!);
                    //     // },
                    //     // controller: value.mobileController,
                    //     decoration: const InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Alternate Mobile No',
                    //       hintText: 'Alternate Mobile No',
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        validator: (value) {
                          return _controller.validateAddress(value!);
                        },
                        controller: value.addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'Address',
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.85,
                      height: 55,
                      color: Color(0xff012132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        value.checkLogin();
                        // _submit();
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Montserrat",
                            letterSpacing: 1,
                            fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _controller.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      _controller.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
