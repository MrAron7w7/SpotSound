import 'package:flutter/material.dart';
import 'package:spotsound/pages/_home/home_page.dart';
import 'package:spotsound/pages/_home/search_page.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      extendBody: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavigationItem(
            icon: Iconify(
              MaterialSymbols.home,
              size: 30,
              color: _currentIndex == 0 ? AppColor.white : AppColor.grisOscuro,
            ),
            label: 'Home',
            index: 0,
          ),
          _buildNavigationItem(
            icon: Iconify(
              MaterialSymbols.search,
              size: 30,
              color: _currentIndex == 1 ? AppColor.white : AppColor.grisOscuro,
            ),
            label: 'Search',
            index: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required String label,
    required int index,
    required Iconify icon,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: _currentIndex == index ? AppColor.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
