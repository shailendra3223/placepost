import 'dart:ui';

import 'package:digitalmaster/screen/dashboard_details_page.dart';
import 'package:digitalmaster/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        )),
        automaticallyImplyLeading: false,
        leading: IconButton(
          color:const Color(0xff012132),
            onPressed: () {
            Get.to(()=>
            ProfilePage());
            },
            icon:const Icon(Icons.logo_dev,size: 50,)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 15,
              semanticContainer: true,
              shadowColor: Colors.black12,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shadowColor: Colors.white,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: Image.network(
                        "http://114.143.114.142:1002/uploads/SubCategory/Advanced.png",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: 10,
                  viewportFraction: 0.8,
                  scale: 0.9,
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
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => DashBoardDetailsPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival1.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(()=>const StartGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival2.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(()=>OddOneOutGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival3.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(()=>DragableGame());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival4.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(()=>OrderPointer());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival5.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(()=> GamePoint(dateTime: DateTime.now(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/festival6.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10)),
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
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.to(()=>StartQuizPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational1.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(()=>const StartGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational2.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(()=>OddOneOutGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational3.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  Get.to(()=>DragableGame());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational4.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(()=>OrderPointer());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational5.png",
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(()=> GamePoint(dateTime: DateTime.now(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "assets/motivational/motivational6.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
