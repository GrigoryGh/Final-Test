import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'page_list.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
              options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                enableInfiniteScroll: false,
                pauseAutoPlayInFiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayAnimationDuration: const Duration(microseconds: 10),
                autoPlay: true,
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
              ),
              items: myList);
        },
      ),
    );
  }
}
