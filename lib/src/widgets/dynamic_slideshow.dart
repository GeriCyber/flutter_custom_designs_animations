import 'package:flutter/material.dart';  
import 'package:provider/provider.dart';

class DynamicSlideshow extends StatelessWidget {
  final bool upDots;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  final List<Widget> slides;

  const DynamicSlideshow({
    super.key, 
    this.upDots = false,
    this.primaryColor = Colors.deepPurple, 
    this.secondaryColor = Colors.grey, 
    this.primaryBullet = 12.0, 
    this.secondaryBullet = 12.0, 
    required this.slides, 
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideshowModel>(context).primaryColor = primaryColor;
              Provider.of<_SlideshowModel>(context).secondaryColor = secondaryColor;
              Provider.of<_SlideshowModel>(context).primaryBullet = primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet = secondaryBullet;
              return _SlideshowBody(upDots: upDots, slides: slides);
            },
          )
        ),
      ),
    );
  }
}

class _SlideshowBody extends StatelessWidget {
  const _SlideshowBody({
    Key? key,
    required this.upDots,
    required this.slides,
  }) : super(key: key);

  final bool upDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(upDots) _Dots(
          slidesLength: slides.length
        ),
        Expanded(
          child: _Slides(slides: slides)
        ),
        if(!upDots) _Dots(
          slidesLength: slides.length
        ),
      ],
    );
  }
}


class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({
    required this.slides
  });

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false)
      .currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: 
          widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({
    Key? key, 
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(10),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesLength;

  const _Dots({
    required this.slidesLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          slidesLength, 
          (index) => _Dot(
            index: index
          )
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  
  const _Dot({
    Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double bulletSize;
    Color bulletColor;

    if(slideshowModel.currentPage >= index - 0.5 
        && slideshowModel.currentPage < index + 0.5) {
      bulletSize = slideshowModel.primaryBullet;
      bulletColor = slideshowModel.primaryColor;
    } else {
      bulletSize = slideshowModel.secondaryBullet;
      bulletColor = slideshowModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: bulletSize,
      height: bulletSize,
      decoration: BoxDecoration(
        color: bulletColor,
        shape: BoxShape.circle
      ), 
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.deepPurple;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color) {
    _secondaryColor = color;
  }

  double get primaryBullet => _primaryBullet;

  set primaryBullet(double bullet) {
    _primaryBullet = bullet;
  }

  double get secondaryBullet => _secondaryBullet;

  set secondaryBullet(double bullet) {
    _secondaryBullet = bullet;
  }

}