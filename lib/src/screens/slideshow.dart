import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/dynamic_slideshow.dart';

class Slideshow extends StatelessWidget {
  const Slideshow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: const [
          Expanded(child: CustomSlideshow()),
          Expanded(child: CustomSlideshow())
        ],
      )
    );
  }
}

class CustomSlideshow extends StatelessWidget {
  const CustomSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicSlideshow(
      primaryBullet: 15.0,
      secondaryBullet: 12.0,
      primaryColor: Colors.deepPurple,
      secondaryColor: Colors.white.withOpacity(0.4),
      upDots: false,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}