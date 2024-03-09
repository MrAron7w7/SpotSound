import 'package:flutter/material.dart';
import 'package:spotsound/pages/navigation/navigation_page.dart';
import 'package:spotsound/themes/app_color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpotSound',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.negro,
        ),
        scaffoldBackgroundColor: AppColor.negro,
      ),
      home: const NavigationPage(),
    );
  }
}
