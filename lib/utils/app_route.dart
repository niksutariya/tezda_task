import 'package:get/get.dart';
import 'package:tezda_task/module/login_screen/login_screen.dart';
import 'package:tezda_task/module/login_screen/register_login_screen.dart';
import 'package:tezda_task/module/product_listing_screen/favorite_item_screen.dart';
import 'package:tezda_task/module/product_listing_screen/product_listing_screen.dart';
import 'package:tezda_task/module/profile_screen/add_profile_screen.dart';
import 'package:tezda_task/module/profile_screen/profile_screen.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const downToUpTransition = Transition.downToUp;

  // get started
  static const String loginScreen = '/LoginScreen';
  static const String registerLoginScreen = '/RegisterLoginScreen';
  static const String productListingScreen = '/ProductListingScreen';
  static const String favoriteItemScreen = '/FavoriteItemScreen';
  static const String profileScreen = '/ProfileScreen';
  static const String addProfileScreen = '/AddProfileScreen';

  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: registerLoginScreen,
      page: () => RegisterLoginScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: productListingScreen,
      page: () => ProductListingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: favoriteItemScreen,
      page: () => FavoriteItemScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: profileScreen,
      page: () => ProfileScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: addProfileScreen,
      page: () => AddProfileScreen(),
      transition: defaultTransition,
    ),
  ];
}
