import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:spotsound/themes/app_color.dart';
import 'package:spotsound/pages/_music/widget/neubox_widget.dart';

class BottomSheetPlayer extends StatefulWidget {
  const BottomSheetPlayer({super.key});

  @override
  State<BottomSheetPlayer> createState() => _BottomSheetPlayerState();
}

class _BottomSheetPlayerState extends State<BottomSheetPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Reproduciendo',
          style: TextStyle(
            letterSpacing: 2.5,
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff95B9F3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            NeuBoxWidget(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      image: NetworkImage(
                        'https://www.lahiguera.net/musicalia/artistas/morat/disco/13257/tema/29722/morat_feo-portada.jpg',
                      ),
                    ),
                  ),

                  // Nombre del artista y el artista
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Feo Oficial',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Morat'),
                          ],
                        ),
                        // Icono de me gusta

                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const Gap(25),
            // Controles de reproducciones
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Start time
                      Text(
                        '0:00',
                        style: TextStyle(color: AppColor.white),
                      ),

                      // Shuffle
                      Icon(
                        Icons.shuffle,
                        color: AppColor.white,
                      ),

                      // Repeat icon
                      Icon(
                        Icons.repeat,
                        color: AppColor.white,
                      ),

                      // End Time
                      Text(
                        '0:00',
                        style: TextStyle(color: AppColor.white),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  ),
                  child: Slider(
                    min: 0,
                    max: 100,
                    value: 50,
                    activeColor: const Color(0xff95B9F3),
                    onChanged: (value) {},
                  ),
                ),
                const Gap(25),

                // Controles play
                Row(
                  children: [
                    // skip previous

                    Expanded(
                      child: GestureDetector(
                        child: const NeuBoxWidget(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const Gap(20),
                    // Icono play
                    Expanded(
                      child: GestureDetector(
                        child: const NeuBoxWidget(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),

                    const Gap(20),
                    // skip next
                    Expanded(
                      child: GestureDetector(
                        child: const NeuBoxWidget(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
