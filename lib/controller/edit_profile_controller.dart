import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/controller/base_controller.dart';

import '../model/model.dart';

class EditProfileController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker imagePicker = ImagePicker();
  final pickedImage = Rxn<XFile>();
  RxBool isUpload = true.obs;
  RxString imageUrl = "".obs;
  QuerySnapshot? dataStream;
  final auth = FirebaseAuth.instance;
  get user => auth.currentUser;
  RxList<UserResponse> userData = <UserResponse>[].obs;
  RxString email = "".obs;
  RxString userId = "".obs;
  RxString country = ''.obs;
  RxString topic = ''.obs;
  RxString bio = ''.obs;
  RxString website = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    isEdit.value = Get.arguments['editProfile'];
  }

  Future<void> getData() async {
    loader.value = true;
    dataStream = await FirebaseFirestore.instance.collection('users').get();
    userData.clear();
     for (var data in dataStream!.docs) {

      if(auth.currentUser!.uid == data['uid']){
        userId.value = data['uid'];
        country.value = data['country'];
        emailController.text = data['email'].toString();
        userNameController.text = data['userName'].toString() ??'';
        fullNameController.text = data['fullName'].toString() ?? '';

        topic.value = data["topic"];
        bioController.text = data["bio"] ?? '';
        websiteController.text = data["website"] ?? '';
      }

    }
    loader.value = false;
  }

  Future selectImage() async {
    pickedImage.value =
        await imagePicker.pickImage(source: ImageSource.gallery);

    //if (pickedImage.value != null) {
    print('picked Image path: ${pickedImage.value!.path} ');
    imageUrl.value = pickedImage.value!.path;
    isUpload.value = false;
    //}
  }

  Future uploadImage() async {
    loader.value = true;
    print("loader value sd:  ${loader.value.toString()} ");
    print("user ID : ${userId.value}");
    final path = 'userImage/${user!.uid}';
    print(path);
    final file = File(pickedImage.value!.path);
    print("File $file");

    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file);

    imageUrl.value = await ref.getDownloadURL();
    print("download Url : $imageUrl.value");
    loader.value = false;
    isUpload.value = false;
  }

  Future updateProfile() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      loader.value = true;
      debugPrint("upload URlllll -=> ${imageUrl.value.toString()}");
      await uploadImage();
      FirebaseFirestore.instance.collection("users").doc(user!.uid).update(
          UserResponse(
              country: country.value,
              email: user!.email,
              profile: imageUrl.value.toString(),
              topic: topic.value.toString(),
              uid: userId.value,
            userName:userNameController.value.text,
            fullName: fullNameController.value.text,
            phone: phoneController.value.text,
            bio: bioController.value.text,
            website: websiteController.value.text
          )
              .toMap());
      Future.delayed(const Duration(seconds: 5), () {
        Get.back();
        loader.value = false;
      });
      print("Update data ");
    }
  }
}
