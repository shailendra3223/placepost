import 'package:digitalmaster/auth/controller/otp_verify_controller.dart';
import 'package:digitalmaster/auth/otp_page.dart';
import 'package:digitalmaster/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends GetView<OtpVerifyController> {
  final TextEditingController textEditingController = TextEditingController();

  final OtpVerifyController _controller = Get.put(OtpVerifyController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff022334),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff022334),
      ),
      body:GetBuilder<OtpVerifyController>(
        builder: (value){
          return  Column(
            children:  [
              SizedBox(
                height: 180,
                width: 250,
                child:Image.asset("assets/img/Logo.png"),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Center(child: Text("Log In",style: GoogleFonts.poppins(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("Enter your Phone Number",style: GoogleFonts.roboto(color: Colors.black,fontSize: 16),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              controller: textEditingController,
                              decoration:const InputDecoration(
                                  hintText: "+91 8999928828",
                                  border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                          child: !value.isLoading?MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            color:const Color(0xff022334), onPressed: () {
                            if(textEditingController.text.isNotEmpty){
                              _controller.verifyphonenumber(textEditingController.text);
                            }else{
                              Get.snackbar("Error", "Phone Number is Mandatory",backgroundColor: Colors.white,colorText: Colors.black);
                            }
                          },
                            child: Text("Send Otp",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                          ):const Center(child:  CircularProgressIndicator(color: Colors.black,),),
                        )
                      ],
                    ),
                  ),
                ),)
            ],
          );
        },
      ),
    );
  }
}
