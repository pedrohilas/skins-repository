
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:shop_app/ThemeManager.dart';

import 'package:shop_app/screens/myaccount/components/myaccount_form.dart';
import 'package:shop_app/screens/products/products_screen.dart';
import 'package:shop_app/screens/settings/settings_screen.dart';
import 'package:shop_app/user.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/myaccount/myaccout_screen.dart';

// We use name route
// All our routes will be available here

  String name = '';
  String email = '';
  String password = '';
  String lastname = '';
  String PhoneNumber = '';
  String address = '';





Map<String, WidgetBuilder> routes(ThemeManager themeManager) { // Adicione o parâmetro themeManager
  return {
   InitScreen.routeName: (context) => const InitScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(user:User),

  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(themeManager: themeManager,),



// No arquivo de rotas, onde você define os mapeamentos de rota
  UserProfileScreen.routeName :(context) => const UserProfileScreen(userEmail: "ola@gmail.com"),
  };
}