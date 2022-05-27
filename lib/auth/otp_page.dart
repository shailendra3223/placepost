import 'package:digitalmaster/auth/widget/otp_input_filed.dart';
import 'package:digitalmaster/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpPage extends StatefulWidget {
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _fieldOne = TextEditingController();

  final TextEditingController _fieldTwo = TextEditingController();

  final TextEditingController _fieldThree = TextEditingController();

  final TextEditingController _fieldFour = TextEditingController();
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff022334),
      appBar: AppBar(
        backgroundColor: const Color(0xff022334),
        elevation: 0.5,
        title: Text("Verify OTP",style: GoogleFonts.fredokaOne(fontSize: 16,color: Colors.white),),
      ),
      body: Column(
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
              OtpInput(_fieldOne, true),
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(()=>DashBoardPage());
                // setState(() {
                //   _otp = _fieldOne.text +
                //       _fieldTwo.text +
                //       _fieldThree.text +
                //       _fieldFour.text;
                // });
              },
              child:  Text('Submit',style: GoogleFonts.fredokaOne(color: Colors.white),)),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
          Text(
            _otp ?? 'Please enter OTP',
            style: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
          )
        ],
      ),
    );
  }
}
