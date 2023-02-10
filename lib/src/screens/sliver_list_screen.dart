import 'package:flutter/material.dart';

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          const Positioned(
            bottom: -10,
            right: 0,
            child: _Button()
          )
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all<Color>(const Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.1,
          child: const Center(
            child: Text(
              'Create',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              )
            )
          )
        ),
      )
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _Item(
      title: 'Orange', 
      color: Color(0xffF08F66) ),
    const _Item(
      title: 'Family', 
      color: Color(0xffF2A38A) ),
    const _Item(
      title: 'Subscriptions', 
      color: Color(0xffF7CDD5) ),
    const _Item(
      title: 'Books', 
      color: Color(0xffFCEBAF) ),
    const _Item(
      title: 'Orange', 
      color: Color(0xffF08F66) ),
    const _Item(
      title: 'Family', 
      color: Color(0xffF2A38A) ),
    const _Item(
      title: 'Subscriptions', 
      color: Color(0xffF7CDD5) ),
    const _Item(
      title: 'Books', 
      color: Color(0xffFCEBAF) ),
  ];

  _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            170,
            200,
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Title(),
            )
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate 
extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
    this.minHeight, 
    this.maxHeight, 
    this.child
  );

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight 
    || minHeight != oldDelegate.minHeight 
    || child != oldDelegate.child;
  }

}

class _List extends StatelessWidget {
  final items = [
    const _Item(
      title: 'Orange', 
      color: Color(0xffF08F66) ),
    const _Item(
      title: 'Family', 
      color: Color(0xffF2A38A) ),
    const _Item(
      title: 'Subscriptions', 
      color: Color(0xffF7CDD5) ),
    const _Item(
      title: 'Books', 
      color: Color(0xffFCEBAF) ),
    const _Item(
      title: 'Orange', 
      color: Color(0xffF08F66) ),
    const _Item(
      title: 'Family', 
      color: Color(0xffF2A38A) ),
    const _Item(
      title: 'Subscriptions', 
      color: Color(0xffF7CDD5) ),
    const _Item(
      title: 'Books', 
      color: Color(0xffFCEBAF) ),
  ];
  
  _List({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index]
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final Color color;

  const _Item({
    Key? key, 
    required this.title, 
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'New', 
            style: TextStyle(color: Color(0xff532128), 
            fontSize: 50)
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 110),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xffF7CDD5),
                ),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                  color: Color(0xffD93A30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}