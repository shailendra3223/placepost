import 'dart:ui';
import 'package:digitalmaster/preferance/PrefsConst.dart';
import 'package:digitalmaster/preferance/pref.dart';
import 'package:digitalmaster/screen/category_page.dart';
import 'package:digitalmaster/screen/dashboard_details_page.dart';
import 'package:digitalmaster/screen/profile/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {

  List<dynamic> motivalassets= [
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
  List<dynamic> solve_math_problem= [
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
  ];
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
          style: TextStyle(color: Colors.black),
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.25,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Upcoming Festivals",
                    style: TextStyle(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage()

                          ),

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
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: upcomingfestivalassets.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
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

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Motivational Posts",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: const Color(0xff012132),
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child:GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: motivalassets.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10), itemBuilder: (context,index){
                      if(index>=6){
                        return SizedBox();
                      }
                return  InkWell(
                    onTap: () {
                      Get.to(() => DashBoardDetailsPage(motivationasseturl: motivalassets[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          motivalassets[index],
                        ),
                      ),
                    ),
                  );
                })
              ),
            ),

            /* TODO-------------  Guess Me  ------------ TODO*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "What am I",
                    style: TextStyle(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage()

                        ),

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
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: guess_me_image.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: guess_me_image[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            guess_me_image[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),
/* TODO-------------  Guess the Picture  ------------ TODO*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Guess the Picture",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: const Color(0xff012132),
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: guess_me_picture.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: guess_me_picture[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            guess_me_picture[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),
            /*TODO Guess the Name*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Guess the Name",
                    style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,left: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: guess_name_pic.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: guess_name_pic[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            guess_name_pic[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),
            /*TODO Guess the Word*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Guess the Word",
                    style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,left: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: word_name.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: word_name[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            word_name[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),

            /*TODO Solve This Moth*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Solve This Math",
                    style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,left: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: solve_math_problem.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: solve_math_problem[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            solve_math_problem[index],
                          ),
                        ),
                      ),
                    );
                  })
              ),
            ),
            /*TODO SHape Puzzle TODO*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Shape Puzzle",
                    style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shape_pazzel.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: shape_pazzel[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            shape_pazzel[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),

            /*TODO Find One TODO*/
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Find the odd one out",
                    style: TextStyle(
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
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 250,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child:GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: find_one_value.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10), itemBuilder: (context,index){
                    if(index>=6){
                      return SizedBox();
                    }
                    return  InkWell(
                      onTap: () {
                        Get.to(() => DashBoardDetailsPage(motivationasseturl: find_one_value[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey,
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            find_one_value[index],
                          ),
                        ),
                      ),
                    );
                  })

              ),
            ),
          ],
        ),
      ),
    );
  }
}
