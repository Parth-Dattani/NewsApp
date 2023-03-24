import 'package:get/get.dart';
import 'package:news_app/controller/country_controller.dart';

class CountryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CountryController>(CountryController(), permanent: false);
  }

}