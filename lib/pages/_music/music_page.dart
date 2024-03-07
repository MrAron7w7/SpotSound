import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spotsound/themes/app_color.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, right: 12, left: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  //color: const Color(0xFF30314D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: NetworkImage(
                            'https://www.lahiguera.net/musicalia/artistas/morat/disco/13257/tema/29722/morat_feo-portada.jpg',
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Feo (Video Oficial)',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          'Morat',
                          style: TextStyle(
                            color: AppColor.grisClaro.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
