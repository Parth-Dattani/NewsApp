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
      page: () => const LoginScreen(),
      binding: LoginBinding()),

  GetPage(name: SignUpScreen.pageId,
      page: ()=>  const SignUpScreen(),
  binding: SignUpBinding()),

  GetPage(
      name: CountryScreen.pageId,
      page: () => const CountryScreen(),
      binding: CountryBinding()),
  GetPage(
      name: TopicScreen.pageId,
      page: () => const TopicScreen(),
      binding: TopicBinding()),

  GetPage(
      name: HomeScreen.pageId,
      page: () => const HomeScreen(),
      binding: HomeBinding()),

  GetPage(
      name: NewsScreen.pageId,
      page: () =>  const NewsScreen(),
      binding: NewsBinding()),
  GetPage(
      name: CongratulateScreen.pageId,
      page: () =>  const CongratulateScreen(),
      binding: CongratulateBinding()),
  GetPage(
      name: DetailScreen.pageId,
      page: () =>  const DetailScreen(),
      binding: DetailBinding()),
  GetPage(
      name: ExploreScreen.pageId,
      page: () =>  const ExploreScreen(),
      binding: ExploreBinding()),
  GetPage(
      name: BookMarkScreen.pageId,
      page: () =>   const BookMarkScreen(),
      binding: BookMarkBinding()),

  GetPage(
      name: ProfileScreen.pageId,
      page: () =>  const ProfileScreen(),
      binding: ProfileBinding()),
  GetPage(
      name: BookDetailScreen.pageId,
      page: () =>  const BookDetailScreen(),
      binding: BookDetailBinding()),
  GetPage(
      name: EditProfileScreen.pageId,
      page: () =>  const EditProfileScreen(),
      binding: EditProfileBinding()),
];
