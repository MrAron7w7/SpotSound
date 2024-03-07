import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:spotsound/themes/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final images = [
    'https://www.eluniverso.com/resizer/bkcImPcpjFZ8ieJ9eLCNGvkIqxU=/893x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/IJCIO37F45GWLHCY6XKRV3LDKE.jpg',
    'https://i.scdn.co/image/ab67706c0000da84cf4599e4d4bf377a0aef5ab8',
    'https://www.expreso.com.pe/wp-content/uploads/2022/05/Morat.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Good Morning',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            const Text(
              '  Reproducido reciente...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.grisClaro,
              ),
            ),
            const Gap(20),
            // Carousel de imagenes
            CarouselSlider(
              items: images.map((image) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                //autoPlay: true,
                //enlargeCenterPage: true,
                enlargeFactor: 1.0,
                aspectRatio: 2,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
