import 'package:get/get_navigation/src/routes/get_route.dart';
import 'binding/binding.dart';
import 'screen/screen.dart';

final List<GetPage> appPage = [
  GetPage(
      name: SplashScreen.pageId,
      page: () => const SplashScreen(),
      binding: SplashBinding()),

  GetPage(
      name: OnBoardScreen.pageId,
      page: () => const OnBoardScreen(),
      binding: OnBoardBinding()),
  GetPage(
      name: LoginScreen.pageId,
      page: () => LoginScreen(),
      binding: LoginBinding()),

  GetPage(name: SignUpScreen.pageId,
      page: ()=>  SignUpScreen(),
  binding: SignUpBinding()),

  GetPage(
      name: CountryScreen.pageId,
      page: () => CountryScreen(),
      binding: CountryBinding()),
  GetPage(
      name: TopicScreen.pageId,
      page: () => TopicScreen(),
      binding: TopicBinding()),

  GetPage(
      name: HomeScreen.pageId,
      page: () => const HomeScreen(),
      binding: HomeBinding()),

  GetPage(
      name: NewsScreen.pageId,
      page: () =>  NewsScreen(),
      binding: NewsBinding()),
  GetPage(
      name: CongratulateScreen.pageId,
      page: () =>  CongratulateScreen(),
      binding: CongratulateBinding()),
  GetPage(
      name: DetailScreen.pageId,
      page: () =>  DetailScreen(),
      binding: DetailBinding()),
  GetPage(
      name: ExploreScreen.pageId,
      page: () =>  ExploreScreen(),
      binding: ExploreBinding()),
  GetPage(
      name: BookMarkScreen.pageId,
      page: () =>  BookMarkScreen(),
      binding: BookMarkBinding()),

];
