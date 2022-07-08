import 'dart:ffi';
import 'dart:ui';
import 'package:digitalmaster/model/category_model.dart';
import 'package:digitalmaster/preferance/PrefsConst.dart';
import 'package:digitalmaster/preferance/pref.dart';
import 'package:digitalmaster/screen/category_page.dart';
import 'package:digitalmaster/screen/dashboard_details_page.dart';
import 'package:digitalmaster/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'auth/controller/dashboard_controller.dart';

class DashBoardPage extends StatelessWidget {

  DashBoardController _controller = Get.put(DashBoardController());
  TextEditingController purchase_code = TextEditingController();

  List<dynamic> bannerImage= [
    "assets/img/banner1.png",
    "assets/img/banner2.png",
    "assets/img/banner3.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Prefs.getString(PrefsConst.NAME)??"Welcome Back",maxLines: 1,
          style:const TextStyle(color: Colors.black),
        ),

        leading: IconButton(
          color:const Color(0xff012132),
            onPressed: () {
            Get.to(()=>
            ProfilePage());
            },
            icon:const Icon(Icons.account_circle_rounded,size: 40,)),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<DashBoardController>(
        init:  _controller,

        builder: (value){
          // if(!value.puchase==true){
          //     return showAlertDialogForEvaluation(context);
          // }
          if(value.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius:const BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                        bannerImage[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      autoplay: true,
                      itemCount: bannerImage.length,
                      viewportFraction: 0.92,
                      scale: 0.95,
                    ),
                  ),
                ),
                 Column(children: List.generate(value.category_name.length, (index) {
                                return categoryList(value.category_name[index],index);
                          } ).toList()),
          //       Container(
          //         height: 400,
          //         child: ListView.builder(
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          // itemCount: value.name.length,
          // itemBuilder: (BuildContext context,int index){
          //           return categoryList(value,index);
          // },
          //       )
          //       )
              ],
            ),
          );
        },

      )

    );
  }
 Widget categoryList(CategoryName category,int index) {
   return Column(
          children: [
            Row(
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    category.name.toString(),
                    style:const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: const Color(0xff012132),
                    onPressed: () {
                   Get.to(()=>   CategoryPage(motivationasseturl:  category.images,i: index,)
                   );
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: category.images.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                        //print(value.category.length);
                    if(index>=6){
                      return const SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl:category.images[index].toString()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            category.images[index].toString(),
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),
          ],
        );

  }
   showAlertDialogForEvaluation(BuildContext context) {
    Widget continueButton = Center(child: Padding(
      padding: const EdgeInsets.only(left: 158.0),
      child: MaterialButton(
        color:const Color(0xff022334) ,
        minWidth: MediaQuery.of(context).size.width*0.20,
        height: 35,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child:const Text("Submit",style: TextStyle(color: Colors.white),),
        onPressed:  () {
          Navigator.of(context).pop();
          _controller.puchase= true;
        },
      ),
    ));
    AlertDialog alert = AlertDialog(
      title:const Text("Enter Purchase Code"),
      content: TextFormField(
        controller: purchase_code,
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Purchase'),
        validator: Validators.compose(
            [Validators.required('Purchase Code is required')]),
      ),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    Get.dialog(alert,useSafeArea: true);
  }
}
