import 'package:flutter/material.dart';

class BottomSheetPlayer extends StatefulWidget {
  const BottomSheetPlayer({super.key});

  @override
  State<BottomSheetPlayer> createState() => _BottomSheetPlayerState();
}

class _BottomSheetPlayerState extends State<BottomSheetPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reproduciendo'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
    );
  }
}
