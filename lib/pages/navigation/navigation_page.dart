import 'package:flutter/material.dart';
import 'package:spotsound/pages/_home/home_page.dart';
import 'package:spotsound/pages/_music/music_page.dart';
import 'package:spotsound/pages/_search/search_page.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:spotsound/themes/app_color.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final _pages = [
    const HomePage(),
    const SearchPage(),
    const MusicPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      //extendBody: true,
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: Color(0xff85B0EF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: AppColor.negro,
          indicatorColor: const Color(0xff343A4A),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          elevation: 0.0,
          destinations: [
            NavigationDestination(
              icon: Iconify(
                MaterialSymbols.home,
                size: 25,
                color: _currentIndex == 0
                    ? const Color(0xff85B0EF)
                    : AppColor.grisOscuro,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Iconify(
                MaterialSymbols.search,
                size: 25,
                color: _currentIndex == 1
                    ? const Color(0xff85B0EF)
                    : AppColor.grisOscuro,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Iconify(
                MaterialSymbols.music_note,
                size: 25,
                color: _currentIndex == 2
                    ? const Color(0xff95B9F3)
                    : AppColor.grisOscuro,
              ),
              label: 'Music',
            ),
          ],
        ),
      ),
    );
  }
}
