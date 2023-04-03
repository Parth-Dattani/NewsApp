import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constant/constant.dart';
import 'package:news_app/controller/controller.dart';

import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class EditProfileScreen extends GetView<EditProfileController>{
  static const pageId = '/EditProfileScreen';

  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> CommonLoader(
        isLoad: controller.loader.value,
        body: Scaffold(
          appBar: CommonAppBar(
            leadingIcon: ImagePath.closeIcon,
            title: "edit_profile".tr,
            actionIcon: ImagePath.checkIcon,
            actionOnTap: (){
              controller.isEdit.value == true
                  ? controller.updateProfile()
                  : null;
            },
          ),
          body: SafeArea(child: SingleChildScrollView(
            child: Column(
                children: [
                  Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      width: Get.width * 0.30,
                                      height: Get.height * 0.19,
                                      decoration: const BoxDecoration(shape: BoxShape.circle,),
                                      child: CircleAvatar(
                                        child:
                                           ClipRRect(
                                              borderRadius:
                                              const BorderRadius.all(Radius.zero),
                                              child: controller.isEdit.value == true ?
                                                controller.pickedImage.value == null ?
                                                Image.asset(ImagePath.profileIcon, fit: BoxFit.fill, height: Get.height * 0.19, width: Get.width * 0.30) :
                                                Image.file(File(controller.pickedImage.value!.path), fit: BoxFit.fill,height: Get.height * 0.19, width: Get.width * 0.30)
                                        //     : controller.pickedImage.value != null
                                        // ? Image.file(File(controller.pickedImage.value!.path), fit: BoxFit.fill,)
                                            :  Image.asset(ImagePath.userImage, fit: BoxFit.fill,)))),
                                  Positioned(
                                      bottom: 15,top: 100, left: 70,
                                      child: Padding(
                                        padding: controller.isUpload.value == true &&
                                            controller.imageUrl.value.isEmpty
                                            ? const EdgeInsets.only(left: 0.0)
                                            : const EdgeInsets.only(left: 12.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            controller.selectImage();
                                          },
                                          child: Image.asset(ImagePath.cameraIcon, scale: 20,)

                                          ),
                                        ),
                                      )])),
                            const SizedBox(height: 15,),
                            CommonTextField(
                              controller: controller.userNameController,
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: ColorsConfig.colorBlack,
                              validator: Validator.isEmail,
                              hintText: 'username'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 20,),
                            CommonTextField(
                              controller: controller.fullNameController,
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: ColorsConfig.colorBlack,
                              validator: Validator.isFullName,
                              hintText: 'fullname'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 20,),
                            CommonTextField(
                              controller: controller.emailController,
                              prefixIcon: const Icon(Icons.email),
                              prefixIconColor: ColorsConfig.colorBlack,
                              validator: Validator.isEmail,
                              hintText: 'email_eddress'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 20,),
                            CommonTextField(
                              controller: controller.phoneController,
                              prefixIcon: const Icon(Icons.phone_android_outlined),
                              prefixIconColor: ColorsConfig.colorBlack,
                              validator: Validator.isPhone,
                              hintText: 'phone_number'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 20,),
                            CommonTextField(
                              controller: controller.bioController,
                              prefixIcon: const Icon(Icons.comment),
                              prefixIconColor: ColorsConfig.colorBlack,
                              hintText: 'bio'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 20,),
                            CommonTextField(
                              controller: controller.websiteController,
                              prefixIcon: const Icon(Icons.signal_cellular_connected_no_internet_4_bar_rounded),
                              prefixIconColor: ColorsConfig.colorBlack,
                              hintText: 'website'.tr,
                              borderRadius: 10,
                            ),
                            const SizedBox(height: 30,),

                            const SizedBox(height: 50,),
                          ],
                        ),
                      )),
                ],
              ),

          ),),
        ),
      ),
    );
  }


}