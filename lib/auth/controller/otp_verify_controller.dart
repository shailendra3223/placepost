import 'package:digitalmaster/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../otp_page.dart';

class OtpVerifyController extends GetxController {
   TextEditingController fieldOne = TextEditingController();
   TextEditingController fieldTwo = TextEditingController();
   TextEditingController fieldThree = TextEditingController();
   TextEditingController fieldFour = TextEditingController();
   TextEditingController fieldFive = TextEditingController();
   TextEditingController fieldSix = TextEditingController();
   final box = GetStorage();
   String? otp;
   bool isLoading = false;
   bool isOtpVerifying = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  String verficationid = "";

  void addotp(){
    otp = fieldOne.text+fieldTwo.text+fieldThree.text+fieldFour.text+fieldFive.text+fieldSix.text;
    print(otp);
    isOtpVerifying = true;
    update();

  }
  void verifyphonenumber(var number) async {
    isLoading = true;
    update();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91"+number,
      verificationCompleted: (PhoneAuthCredential credtails) async {
         isLoading = false;
      },
      verificationFailed: (FirebaseAuthException exc) async {
        print(exc.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        verficationid = verificationId;
        isLoading = false;
        update();
           if(verficationid!=null||verificationId!=""){
             Get.to(()=>OtpPage());

           }

        // Create a PhoneAuthCredential with the code

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
    );
  }

  void verifyotp(){
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verficationid, smsCode: otp!);
    auth.signInWithCredential(credential).then((value){
      box.write("isUserExists", value.user?.phoneNumber);
      isOtpVerifying = false;
      update();
      // Get.offAll(()=>showAlertDialogForEvaluation());
       Get.offAll(()=>  DashBoardPage());
    });

  } 

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
