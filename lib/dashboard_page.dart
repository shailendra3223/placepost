import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DashBoardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text("Dashboard",style:
          TextStyle(color: Colors.black),)),
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
              margin: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return  Image.network(
                      "http://114.143.114.142:1002/uploads/SubCategory/Advanced.png",
                      fit: BoxFit.fill,
                    );
                  },
            /*      itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                     "http://114.143.114.142:1002/uploads/SubCategory/Advanced.png",
                      fit: BoxFit.fill,
                      width:
                      MediaQuery.of(context).size.width * 0.8,
                    );
                  },*/
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
                  padding:  EdgeInsets.all(8.0),
                  child:Text("Upcoming Festivals",style: TextStyle(
                      color:Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold
                  ),),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color:const Color(0xff012132),
                    onPressed: () {  },
                    child:const Text("View All",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
           const Divider(color: Colors.red,),
            Container(
              height: 200,
              child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: GridView(
                     children: [
                       InkWell(
                         onTap:(){
                           // Get.to(()=>StartQuizPage());
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           // Get.to(()=>const StartGamePage());
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           //  Get.to(()=>OddOneOutGamePage());
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           //  Get.to(()=>DragableGame());
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),

                       InkWell(
                         onTap: (){
                           //Get.to(()=>OrderPointer());
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           // Get.to(()=> GamePoint(dateTime: DateTime.now(),));
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.grey,
                           ),
                           child:const Center(child:  Text("",style:
                           TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                         ),
                       ),
                     ],
                     gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10)
                 ),
               ),
            ),

            Row(
              children: [
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:Text("Motivational Posts",style: TextStyle(
                      color:Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold
                  ),),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color:const Color(0xff012132),
                    onPressed: () {  },
                    child:const Text("View All",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                    children: [
                      InkWell(
                        onTap:(){
                          // Get.to(()=>StartQuizPage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Get.to(()=>const StartGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          //  Get.to(()=>OddOneOutGamePage());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          //  Get.to(()=>DragableGame());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          //Get.to(()=>OrderPointer());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          // Get.to(()=> GamePoint(dateTime: DateTime.now(),));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  Colors.grey,
                          ),
                          child:const Center(child:  Text("",style:
                          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                        ),
                      ),
                    ],
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10)
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
