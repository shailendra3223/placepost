
import 'dart:io';

import 'package:digitalmaster/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/controller/UpdateProfileController.dart';

class ProfilePage extends GetView {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdateProfileController _controller = Get.put(UpdateProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      const Center(child: Text("Edit Profile")),
        actions: <Widget>[
          IconButton(onPressed: (){
            Get.to(()=>LogInPage());
          }, icon: Icon(Icons.logout_rounded)),
        ],
        backgroundColor:const Color(0xff012132),),
      body: GetBuilder<UpdateProfileController>(
        init: _controller,
        builder: (value){
          return  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Form(
                  key: _formKey,

                  child: Column(
                    children: [
                      InkWell(
                        onTap: ((){
                          _showPicker(context);
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child:const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                      ),
                      const  SizedBox(height: 50),
                        Padding(
                        padding:const  EdgeInsets.all(8.0),
                        child: TextField(
                          controller: value.nameController,
                      decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                labelText: 'Name of Institute',
                hintText: 'Name of Institute',
              ),
            ),
          ),
                      const SizedBox(height: 10),
                        Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  TextField(
                          controller:value.emailIdController,
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email ID',
                            hintText: 'Email ID',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                        Padding(
                        padding:const  EdgeInsets.all(8.0),
                        child: TextField(
                          controller: value.mobileNumberController,
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile No',
                            hintText: 'Mobile No',
                          ),
                        ),
                      ),
                      const  SizedBox(height: 5),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: value.addressController,
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                            hintText: 'Address',
                          ),
                        ),
                      ),

                      const  SizedBox(height: 15),
                      Text("Change Password",
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 16),),
                      const  SizedBox(height: 15),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: value.passwordcontroller,
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Change Password',
                            hintText: 'Change Password',
                          ),
                        ),
                      ),

                      const  SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: value.passwordcontroller,
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Repeat Password',
                            hintText: 'Repeat Password',
                          ),
                        ),
                      ),

                      const   SizedBox(height: 40,),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width*0.85,
                        height: 55,
                        color: Color(0xff012132),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {

                          print("Submit User Profile");
                         // _submit();


                        },
                        child:const Text("Submit",style:
                        TextStyle(color: Colors.white,fontFamily: "Montserrat",
                            letterSpacing: 1,fontSize: 18.0),),

                      )
                    ],
                  ),
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
              child:  Wrap(
                children: <Widget>[
                   ListTile(
                      leading:  const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _controller.imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                   ListTile(
                    leading:const  Icon(Icons.photo_camera),
                    title:const  Text('Camera'),
                    onTap: () {
                      _controller.imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}


