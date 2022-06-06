import 'package:flutter/material.dart';

class DashBoardDetailsPage extends StatefulWidget {
  dynamic motivationasseturl;

  DashBoardDetailsPage({this.motivationasseturl});

  @override
  State<DashBoardDetailsPage> createState() => _DashBoardDetailsPageState();
}

class _DashBoardDetailsPageState extends State<DashBoardDetailsPage> {
  Color selectedColor = Colors.white;
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("Details Page",
          style: TextStyle(color: Colors.white),
        )),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.download)),
        ],
          backgroundColor: const Color(0xff022334),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.motivationasseturl)),
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            child:Image.network(
                                "https://www.freeiconspng.com/uploads/nike-logo-png-shoes-brand-17.png")
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10,left: 5),

                          child: Container(
                            width: 315,
                            child: Card(
                              color: selectedColor,
                              elevation: 0.8,
                              semanticContainer: true,
                              shadowColor: Colors.transparent,
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10,top: 0),
                                    child: Text("XYZ Coaching Classes",style:
                                    TextStyle(color: selectedColor==Colors.black?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 16.0),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10,top: 0),
                                    child: Text("Appa Pada Malad East",style:
                                    TextStyle(color:  selectedColor==Colors.black?Colors.white:Colors.black,fontSize: 14.0),),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10,top: 0),
                                    child: Text("Mumbai Maharashtra",style:
                                    TextStyle(color:  selectedColor==Colors.black?Colors.white:Colors.black,fontSize: 14.0),),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: Card(
                      color: selectedColor,
                      elevation: 15,
                      semanticContainer: true,
                      shadowColor: Colors.grey,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child:  Text("Contact Number : 9769859062 / 9769859062 ",
                            style:  TextStyle(color:  selectedColor==Colors.black?Colors.white:Colors.black,fontSize: 16),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Row(
            children:const [
               Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Text("Variation",
                    style: TextStyle(color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ),
                ),
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
                        setState(() {
                          selectedColor = Colors.black;
                        });
                        // Get.to(()=>StartQuizPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade400,
                        ),
                        child: Center(child:  Container(
                          color: Colors.black ,
                          child: const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text("Try this",style:
                            TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
                          ),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          selectedColor = Colors.white;
                        });
                        // Get.to(()=>const StartGamePage());
                      },
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade400,
                        ),
                        child:Center(child:  Container(
                          color: Colors.white ,
                          child:const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text("Try this",style:
                            TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),),
                          ),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        //  Get.to(()=>OddOneOutGamePage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade400,
                        ),
                        child:const Center(child:  Text("Try this",style:
                        TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),)),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        //  Get.to(()=>DragableGame());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade400,
                        ),
                        child:const Center(child:  Text("Try this",style:
                        TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),)),
                      ),
                    ),

                  ],
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
