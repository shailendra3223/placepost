
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/controller/dashboard_controller.dart';
import 'dashboard_details_page.dart';

class CategoryPage extends GetView {
  dynamic motivationasseturl;
  int i;
  DashBoardController _controller = Get.put(DashBoardController());
  CategoryPage({Key? key, this.motivationasseturl,required this.i}) : super(key: key);

  // List<dynamic> upcomingfestivalassets= [
  //   "assets/festival/festival1.png",
  //   "assets/festival/festival2.png",
  //   "assets/festival/festival3.png",
  //   "assets/festival/festival4.png",
  //   "assets/festival/festival5.png",
  //   "assets/festival/festival6.png",
  //   "assets/festival/festival7.png",
  //   "assets/festival/festival8.png",
  //   "assets/festival/festival9.png",
  //   "assets/festival/festival10.png",
  //   "assets/festival/festival11.png",
  //   "assets/festival/festival12.png",
  //   "assets/festival/festival13.png",
  //   "assets/festival/festival14.png",
  //   "assets/festival/festival15.png",
  //   "assets/festival/festival16.png",
  //   "assets/festival/festival17.png",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Festival Post",style:
        TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff022334),
      ),
      body:  GetBuilder<DashBoardController>(
        init: _controller,
        builder: (value){
          if(value.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }
            return Container(
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child:GridView.builder(
                    shrinkWrap: true,
                    //  physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.category_name[i].images.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                      print(value.category_name[i].images);
                      print("object "+value.category_name.length.toString());
                    // if(index>=6){
                    //   return SizedBox();
                    // }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: value.category_name[i].images[index].toString()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            value.category_name[i].images[index].toString(),
                          ),
                        ),
                      ),
                    );
                  })

              ),
            );

        },

      ),
    );
  }
}
