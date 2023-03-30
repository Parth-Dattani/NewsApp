import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/controller/base_controller.dart';

class EditProfileController extends BaseController{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker imagePicker = ImagePicker();
  final pickedImage = Rxn<XFile>();
  RxBool isUpload = true.obs;
  RxString imageUrl = "".obs;


  @override
  void onInit() {
    super.onInit();
    isEdit.value = Get.arguments['editProfile'];
  }

  Future selectImage() async {
    pickedImage.value = await imagePicker.pickImage(source: ImageSource.gallery);

    //if (pickedImage.value != null) {
    print('picked Image path: ${pickedImage.value!.path} ');
    imageUrl.value = pickedImage.value!.path;
    isUpload.value = false;
    //}
  }
}