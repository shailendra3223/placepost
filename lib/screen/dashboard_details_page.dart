import 'package:flutter/material.dart';

class DashBoardDetailsPage extends StatelessWidget {
  const DashBoardDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("Details Page",
          style: TextStyle(color: Colors.white),
        )),
        actions: <Widget>[
          MaterialButton(
            height: 10,
            color: const Color(0xff022334),
            textColor:Colors.white,
            onPressed: () {},
            child:const Text("Download",style: TextStyle(fontSize: 18),),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
          backgroundColor: const Color(0xff022334),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 280,
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: 80,
                          width: 120,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            child: Wrap(
                              children:const [
                                Text(
                                  'Classes Logo',
                                  style: TextStyle(fontSize: 12, color: Colors.black),
                                ),
                              ],

                            ), //Text
                          ),
                        ),
                      ),
                     const Spacer(),
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Card(
                            elevation: 15,
                            semanticContainer: true,
                            shadowColor: Colors.grey,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),

                            child: Column(
                              children:const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("XYZ Coaching Classes",style:
                                  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Appa Pada Malad East",style:
                                TextStyle(color: Colors.black,fontSize: 14.0),),
                                SizedBox(height: 5,),
                                Text("Mumbai Maharashtra",style:
                                TextStyle(color: Colors.black,fontSize: 14.0),),

                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 150,),
                  Expanded(
                      child: Card(
                        elevation: 15,
                        semanticContainer: true,
                        shadowColor: Colors.grey,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child:const Center(
                          child:  Text("Contact NUmber : 9769859062 / 9769859062 ",
                            style:  TextStyle(color: Colors.black,fontSize: 16),),
                        ),
                      ),

                  ),
                ],
              ),
            ),
          ),
          
          Row(
            children: [
              const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Text("Try Other",
                    style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ),
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
            height: 300,
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
                          borderRadius: BorderRadius.circular(8),
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
                          borderRadius: BorderRadius.circular(8),
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
                          borderRadius: BorderRadius.circular(8),
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
                          borderRadius: BorderRadius.circular(8),
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
                          borderRadius: BorderRadius.circular(8),
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
                          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
