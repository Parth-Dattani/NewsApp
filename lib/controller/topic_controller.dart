import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../model/model.dart';

class TopicController extends BaseController{

  final TextEditingController searchController = TextEditingController();
  RxBool isSelected = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedTopic = 'National'.obs;
  final auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  RxString country = ''.obs;
  RxList<String> searchList = <String>[].obs;
  QuerySnapshot? dataStream;
  RxList<UserResponse> userData = <UserResponse>[].obs;
  RxList<String> topicList = <String>[
    "national".tr,
    "international".tr,
    "sport".tr,
    "lifestyle".tr,
    "business".tr,
    "health".tr,
    "fashion".tr,
    "technology".tr,
    "science".tr,
    "art".tr,
    "politics".tr,
  ].obs;

  @override
  onInit() {
    super.onInit();
   getData();
  }

  List<String> searchTopic(key) {
    debugPrint("Check Search Key $key");

    if (key.toString().isNotEmpty) {
      topicList.value = topicList
          .where((p0) => p0.toLowerCase().contains(key.toLowerCase()))
          .toList();

      topicList.map((element) => debugPrint("search $element")).toList();
    } else {
      topicList.addAll(searchList);
    }
    return topicList;
  }

  Future<void> getData() async {
    dataStream = await FirebaseFirestore.instance.collection('users').get();
    userData.clear();
    for (var data in dataStream!.docs) {
      userData.add(UserResponse(
        email: data["email"],
        country: data["country"],
        topic: data["topic"],
        uid: data["uid"],
      ));
      country.value = userData[0].country!;
    }
    loader.value = false;
  }

  sendDataFirestore(String topic) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserResponse userResponse = UserResponse();
    userResponse.email = user!.email;
    userResponse.uid = user.uid;
    userResponse.country = country.value;
    userResponse.topic = selectedTopic.value;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userResponse.toMap());
  }
}