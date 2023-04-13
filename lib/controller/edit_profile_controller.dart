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

  final GlobalKey<FormState> editProfileformKey = GlobalKey<FormState>();

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
  Future<void> onInit() async {
    super.onInit();
    await getData();
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
        imageUrl.value = data['profile'].toString() ?? '';
        emailController.text = data['email'].toString();
        userNameController.text = data['userName'].toString() ?? '';
        fullNameController.text = data['fullName'].toString() ?? '';
        phoneController.text =  data['phone'].toString() ?? '';
        topic.value = data["topic"];
        bioController.text = data["bio"] ?? '';
        websiteController.text = data["website"] ?? '';
      }
    }
    loader.value = false;
  }

  Future selectImage() async {
    pickedImage.value = await imagePicker.pickImage(source: ImageSource.gallery);

    imageUrl.value = pickedImage.value!.path;
    isUpload.value = false;
  }

  Future uploadImage() async {
    loader.value = true;
    final path = 'userImage/${user!.uid}';
    final file = File(pickedImage.value!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file);

    imageUrl.value = await ref.getDownloadURL();
    loader.value = false;
    isUpload.value = false;
  }

  Future updateProfile() async {
    editProfileformKey.currentState!.save();
    if (editProfileformKey.currentState!.validate()) {
      loader.value = true;
      debugPrint("upload URll -=> ${imageUrl.value.toString()}");
      await uploadImage();
      FirebaseFirestore.instance.collection("users").doc(user!.uid).update(
          UserResponse(
              country: country.value,
              email: user!.email,
              profile: imageUrl.value,
              topic: topic.value.toString(),
              uid: userId.value,
            userName:userNameController.value.text,
            fullName: fullNameController.value.text,
            phone: int.parse(phoneController.value.text),
            bio: bioController.value.text,
            website: websiteController.value.text
          ).toMap());
                Get.back();

      loader.value = false;
    }
  }
}
