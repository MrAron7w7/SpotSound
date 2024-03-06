import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff121212),
      body: Center(
        child: Text(
          'Search Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
