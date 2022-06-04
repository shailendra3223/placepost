import 'package:digitalmaster/auth/controller/otp_verify_controller.dart';
import 'package:digitalmaster/auth/widget/otp_input_filed.dart';
import 'package:digitalmaster/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpPage extends GetView<OtpVerifyController> {
OtpVerifyController controller = Get.put((OtpVerifyController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff022334),
      appBar: AppBar(
        backgroundColor: const Color(0xff022334),
        elevation: 0.5,
        title: Text("Verify OTP",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: GetBuilder<OtpVerifyController>(
        builder: (value){
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Phone Number Verification',style: GoogleFonts.roboto(fontSize: 16,color: Colors.white),),
              const SizedBox(
                height: 30,
              ),
              // Implement 4 input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(value.fieldOne, true),
                  OtpInput(value.fieldTwo, false),
                  OtpInput(value.fieldThree, false),
                  OtpInput(value.fieldFour, false),
                  OtpInput(value.fieldFive, false),
                  OtpInput(value.fieldSix, false),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              !value.isOtpVerifying?MaterialButton(
                color: Colors.white,
                  onPressed: () {
                    if(value.fieldOne.text.isNotEmpty&&value.fieldTwo.text.isNotEmpty&&value.fieldThree.text.isNotEmpty&&value.fieldFour.text.isNotEmpty&&value.fieldFive.text.isNotEmpty&&value.fieldSix.text.isNotEmpty){
                        value.addotp();
                        if(value.otp!=""||value.otp!=null){
                          Get.to(()=>DashBoardPage());
                          FocusManager.instance.primaryFocus?.unfocus();

                          // value.verifyotp();
                        }
                    }
                   else{
                      Get.snackbar("Error","Please Enter Otp Sent to Your Phone" ,backgroundColor: Colors.white,colorText: Colors.black);
                    }
                  },
                  child:  Text('Submit',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold),)):Center(child: CircularProgressIndicator(color: Colors.black,),),
              const SizedBox(
                height: 30,
              ),
              // Display the entered OTP code

            ],
          );
        },

      ),
    );
  }
}


