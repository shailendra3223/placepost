
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_details_page.dart';

class CategoryPage extends GetView {
  dynamic motivationasseturl;

  CategoryPage({Key? key, this.motivationasseturl}) : super(key: key);

  List<dynamic> upcomingfestivalassets= [
    "assets/festival/festival1.png",
    "assets/festival/festival2.png",
    "assets/festival/festival3.png",
    "assets/festival/festival4.png",
    "assets/festival/festival5.png",
    "assets/festival/festival6.png",
    "assets/festival/festival7.png",
    "assets/festival/festival8.png",
    "assets/festival/festival9.png",
    "assets/festival/festival10.png",
    "assets/festival/festival11.png",
    "assets/festival/festival12.png",
    "assets/festival/festival13.png",
    "assets/festival/festival14.png",
    "assets/festival/festival15.png",
    "assets/festival/festival16.png",
    "assets/festival/festival17.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Festival Post",style:
        TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff022334),
      ),
      body:  Container(
        child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child:GridView.builder(
              //  physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingfestivalassets.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10), itemBuilder: (context,index){
              // if(index>=6){
              //   return SizedBox();
              // }
              return  InkWell(
                onTap: () {
                  Get.to(() => DashBoardDetailsPage(motivationasseturl: upcomingfestivalassets[index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      upcomingfestivalassets[index],
                    ),
                  ),
                ),
              );
            })

        ),
      ),
    );
  }
}
