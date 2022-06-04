import 'package:digitalmaster/auth/otp_page.dart';
import 'package:digitalmaster/dashboard_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends GetWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022334),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff022334),
      ),
      body:Column(
        children:  [
          SizedBox(height: 20,),
           Expanded(flex: 1, child: SizedBox(
             child: Column(
               children: [
                 Text("DIGITAL",style: GoogleFonts.ultra(fontSize: 40,color: Colors.white)),
                 Text("MASTER",style: GoogleFonts.ultra(fontSize: 40,color: Colors.white),),

               ],
             ),
           ),),
          Expanded(flex: 2,
            child: Card(
            shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Center(child: Text("Log In",style: GoogleFonts.fredokaOne(fontSize: 35,color: Colors.black),)),
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
                        decoration:const InputDecoration(
                          hintText: "+91 8999928828",
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      color: Color(0xff022334), onPressed: () {
                        Get.to(()=>OtpPage());
                    },
                      child: Text("Send Otp",style: GoogleFonts.fredokaOne(fontSize: 18,color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          ),)

           
        ],
      ),
    );
  }
}
