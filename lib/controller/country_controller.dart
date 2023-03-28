import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/support/code_countries_en.dart';
import 'package:country_list_pick/support/code_countrys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/base_controller.dart';
import '../model/model.dart';

class CountryController extends BaseController {
  final TextEditingController searchController = TextEditingController();
  RxBool isSelected = false.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedCountry = ''.obs;

  List<Map> jsonList = <Map>[];
  RxList<CountryCode> countryList = <CountryCode>[].obs;
  RxList<CountryCode> searchList = <CountryCode>[].obs;
  Rx<String> query = "".obs;
  final auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  QuerySnapshot? dataStream;
  RxList<UserResponse> userData = <UserResponse>[].obs;
  RxString country = ''.obs;

  @override
  onInit() {
    super.onInit();
    getData();
    fetchCountry(CountryTheme(
      isShowFlag: true,
      isShowTitle: true,
      isShowCode: true,
      showEnglishName: false,
      labelColor: Colors.blueAccent,
    ));
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
      selectedCountry.value = userData[0].country!;
      debugPrint("selected countru : ${selectedCountry.value}");

    }
    loader.value = false;
  }

  Future<void> fetchCountry(theme) async {
    jsonList = theme?.showEnglishName ?? true ? countriesEnglish : codes;

    countryList.clear();
    searchList.clear();
    jsonList
        .map((e) => countryList.add(CountryCode(
              name: e['name'],
              code: e['code'],
              dialCode: e['dial_code'],
              flagUri: e['flagUri'],
            )))
        .toList();
    searchList.addAll(countryList);
  }

  List<CountryCode> searchCountry(key) {
    debugPrint("Check Search Key $key");

    if (key.toString().isNotEmpty) {
      countryList.value = countryList
          .where((p0) => p0.name!.toLowerCase().contains(key.toLowerCase()))
          .toList();

      countryList.map((element) => debugPrint("search : ${element.name}")).toList();
    } else {
      countryList.addAll(searchList);
    }
    return countryList;
  }

  sendDataFirestore(String country) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserResponse userData = UserResponse();
    userData.email = user!.email;
    userData.uid = user.uid;
    userData.country = selectedCountry.value;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userData.toMap());
  }

}
