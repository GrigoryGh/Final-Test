import 'package:final_test/pages/pageview/pageview.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget col() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: const SwapEffect(),
            onDotClicked: ((index) {
              controller.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            }),
          ),
        ),
      )
    ],
  );
}