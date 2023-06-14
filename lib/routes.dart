import 'package:brain_school/password.dart';
import 'package:brain_school/screens/home_screen/application.dart';
import 'package:brain_school/screens/home_screen/ask.dart';
import 'package:brain_school/screens/home_screen/mappage.dart';
import 'package:brain_school/screens/home_screen/timetable.dart';
import 'package:brain_school/screens/login_screen/login_screen.dart';
import 'package:brain_school/screens/splash_screen/splash_screen.dart';
import 'package:brain_school/set_photo_screen.dart';
import 'package:brain_school/widgets/holiday.dart';
import 'package:brain_school/widgets/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'screens/assignment_screen/assignment_screen.dart';
import 'screens/datesheet_screen/datesheet_screen.dart';
import 'screens/fee_screen/fee_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/my_profile/my_profile.dart';
import 'screens/take_quiz.dart';

Map<String, WidgetBuilder> routes = {
  //all screens will be registered here like manifest in android
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  FeeScreen.routeName: (context) => FeeScreen(),
  AssignmentScreen.routeName: (context) => AssignmentScreen(),
  DateSheetScreen.routeName: (context) => DateSheetScreen(),
  TakequizScreen.routeName: (context) => TakequizScreen(),
  SetPhotoScreen.routeName: (context) => SetPhotoScreen(),
  MyHomePage.routeName: (context) => MyHomePage(),
  Holiday.routeName: (context) => Holiday(),
  Timetable.routeName: (context) => Timetable(),
  Googlemap.routeName: (context) => Googlemap(),
  Ask.routeName: (context) => Ask(),
  Application.routeName: (context) => Application(),
  GoogleSignIn.routeName: (context) => GoogleSignIn(),
};
