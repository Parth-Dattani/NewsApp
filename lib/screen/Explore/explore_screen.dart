import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';
import 'package:news_app/widgets/common_appbar.dart';

class ExploreScreen extends GetView<ExploreController>{
  static const pageId ="/ExploreScreen";

  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "explore".tr,
      ),
    );
  }

}