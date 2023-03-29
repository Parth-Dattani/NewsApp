import 'package:get/get.dart';
import 'package:news_app/controller/controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    //Get.put<HomeController>(HomeController(), permanent: false);
    //Get.find()<ExploreController>(ExploreController(), permanent: false);
    //Get.find()<BookMarkController>(BookMarkController(), permanent: false);
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<BookMarkController>(() => BookMarkController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}