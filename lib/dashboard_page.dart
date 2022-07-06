import 'dart:ffi';
import 'dart:ui';
import 'package:digitalmaster/preferance/PrefsConst.dart';
import 'package:digitalmaster/preferance/pref.dart';
import 'package:digitalmaster/screen/category_page.dart';
import 'package:digitalmaster/screen/dashboard_details_page.dart';
import 'package:digitalmaster/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import 'auth/controller/dashboard_controller.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardController _controller = Get.put(DashBoardController());
/*  List<dynamic> motivalassets= [
    "assets/motivational/motivational1.png",
    "assets/motivational/motivational2.png",
    "assets/motivational/motivational3.png",
    "assets/motivational/motivational4.png",
    "assets/motivational/motivational5.png",
    "assets/motivational/motivational6.png",
  ];
  List<dynamic> guess_name_pic= [
    "assets/guess_name/guess_name1.png",
    "assets/guess_name/guess_name2.png",
    "assets/guess_name/guess_name3.png",
    "assets/guess_name/guess_name4.png",
    "assets/guess_name/guess_name5.png",
    "assets/guess_name/guess_name6.png",
  ];
  List<dynamic> word_name= [
    "assets/word/word1.png",
    "assets/word/word2.png",
    "assets/word/word3.png",
    "assets/word/word4.png",
    "assets/word/word5.png",
    "assets/word/word6.png",
  ];
  List<dynamic> solveMathProblem= [
    "assets/solve_math/solve_math1.png",
    "assets/solve_math/solve_math2.png",
    "assets/solve_math/solve_math3.png",
    "assets/solve_math/solve_math4.png",
    "assets/solve_math/solve_math5.png",
    "assets/solve_math/solve_math6.png",
  ];
  List<dynamic> upcomingfestivalassets= [
    "assets/festival/festival1.png",
    "assets/festival/festival2.png",
    "assets/festival/festival3.png",
    "assets/festival/festival4.png",
    "assets/festival/festival5.png",
    "assets/festival/festival6.png",
  ];
  List<dynamic> find_one_value= [
    "assets/find_odd_one_out/find_one1.png",
    "assets/find_odd_one_out/find_one2.png",
    "assets/find_odd_one_out/find_one3.png",
    "assets/find_odd_one_out/find_one4.png",
    "assets/find_odd_one_out/find_one5.png",
    "assets/find_odd_one_out/find_one6.png",
  ];
  List<dynamic> guess_me_image= [
    "assets/guess_me/guess_me1.png",
    "assets/guess_me/guess_me2.png",
    "assets/guess_me/guess_me3.png",
    "assets/guess_me/guess_me4.png",
    "assets/guess_me/guess_me5.png",
    "assets/guess_me/guess_me6.png",
  ];
  List<dynamic> guess_me_picture= [
    "assets/guess_picture/guess_the_picture1.png",
    "assets/guess_picture/guess_the_picture2.png",
    "assets/guess_picture/guess_the_picture3.png",
    "assets/guess_picture/guess_the_picture4.png",
    "assets/guess_picture/guess_the_picture5.png",
    "assets/guess_picture/guess_the_picture6.png",
  ];
  List<dynamic> shape_pazzel= [
    "assets/shape_puzzle/shape_puzzle1.png",
    "assets/shape_puzzle/shape_puzzle2.png",
    "assets/shape_puzzle/shape_puzzle3.png",
    "assets/shape_puzzle/shape_puzzle4.png",
    "assets/shape_puzzle/shape_puzzle5.png",
    "assets/shape_puzzle/shape_puzzle6.png",
  ];*/
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
          if(value.isLoading){
            return Center(child: CircularProgressIndicator(),);
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
                 Column(children: List.generate(value.name.length, (index) {
                                return categoryList(value, index);
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
 Widget categoryList(DashBoardController value,int index) {
   return Column(
          children: [
            Row(
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    value.name[index].toString(),
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
                      Get.to((){
                        CategoryPage();
                      });
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
                      itemCount: value.category.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                        print(value.category.length);
                    if(index>=6){
                      return const SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: value.category[index].toString()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            value.category[index].toString(),
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

}
