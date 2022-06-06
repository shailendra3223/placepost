
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/controller/UpdateProfileController.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker _imagePicker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late File _image;
  UpdateProfileController _controller = Get.put(UpdateProfileController());

  _imgFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image as File;
    });
  }

  _imgFromGallery() async {
    XFile? image = await  _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      const Center(child: Text("Edit Profile")),
        backgroundColor: Color(0xff012132),),
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
                      const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                labelText: 'Name of Institute',
                hintText: 'Name of Institute',
              ),
            ),
          ),
                      const SizedBox(height: 10),
                      const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email ID',
                            hintText: 'Email ID',
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mobile No',
                            hintText: 'Mobile No',
                          ),
                        ),
                      ),
                      const  SizedBox(height: 5),
                      const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                            hintText: 'Address',
                          ),
                        ),
                      ),

                      const  SizedBox(height: 15),
                      Text("Change Password",
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 16),),
                      const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Change Password',
                            hintText: 'Change Password',
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
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                   ListTile(
                    leading:const  Icon(Icons.photo_camera),
                    title:const  Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
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


