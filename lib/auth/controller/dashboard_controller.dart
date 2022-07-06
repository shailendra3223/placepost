
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashBoardController extends GetxController{
  List<dynamic> category = [];
  List<dynamic> name = [];
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getCategoryName();
    getCategories();
    getCategory();

  }
  void setLoader(bool loading){
    isLoading = loading;
    update();
  }
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  void getCategory() async {
    setLoader(true);
    var response =  await firebaseFirestore.collection("collection").get();
    for(var data in response.docs){
      for(var ds in data.data().values){
        setLoader(false);
        for(var d in ds){
          for(var n in name){
            if(data.data().keys.contains(n)){
    category.add(d);
    print("asddasasd " +n);
    }else{
              category.remove(d);
            }
          }


          // update();
        }
      }
      update();
    }
  }
  
  void getCategories() async {
    var response = await FirebaseFirestore.instance.collection("collection").doc().get();
    CollectionReference collectionReference = await FirebaseFirestore.instance.collection("collection").doc().collection(name.toString());

    print("response $response");
    print("collectionReference $collectionReference");
  }

  void getCategoryName() async {
    setLoader(true);
    var response =  await firebaseFirestore.collection("collection").get();
    for(var data in response.docs){
      for(var dv in data.data().keys){
      name.add(dv);
      update();
      }
      getCategory();
      update();
    }
  }

}