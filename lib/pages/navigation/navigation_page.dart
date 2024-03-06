import 'package:flutter/material.dart';
import 'package:spotsound/pages/_home/home_page.dart';
import 'package:spotsound/pages/_home/search_page.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0Xff121212),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          'Good Morning',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff121212),
        selectedItemColor: const Color(0xff12CB00),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Iconify(
              MaterialSymbols.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Buscar',
            icon: Iconify(
              MaterialSymbols.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
