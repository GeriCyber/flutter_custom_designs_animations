import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../widgets/pinterest_menu.dart';

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuAnimation(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const _Grid(),
            _MenuPosition(),
          ],
        ),
      ),
    );
  }
}

class _MenuPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final showMenu = Provider.of<_MenuAnimation>(context).showMenu;

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthSize,
        child: Align(
          child: PinterestMenu(
            showMenu: showMenu,
            inactiveColor: Colors.deepPurple.shade300,
            items: [
              PinterestButton(
                onPressed: () => print('Icon pie_chart'), 
                icon: Icons.pie_chart
              ),
              PinterestButton(
                onPressed: () => print('Icon search_rounded'), 
                icon: Icons.search_rounded
              ),
              PinterestButton(
                onPressed: () => print('Icon notifications_active_rounded'), 
                icon: Icons.notifications_active_rounded
              ),
              PinterestButton(
                onPressed: () => print('Icon supervised_user_circle_rounded'), 
                icon: Icons.supervised_user_circle_rounded
              ),
            ]
          ),
        ),
      ),
    );
  }
} 

class _Grid extends StatefulWidget {
  const _Grid({super.key});

  @override
  State<_Grid> createState() => _GridState();
}

class _GridState extends State<_Grid> {
  ScrollController controller = ScrollController();
  double previousScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if(controller.offset > previousScroll && controller.offset > 10) {
        Provider.of<_MenuAnimation>(context, listen: false).showMenu = false;
      } else {
        Provider.of<_MenuAnimation>(context, listen: false).showMenu = true;
      }
      previousScroll = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: MasonryGridView.count(
      controller: controller,
      crossAxisCount: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      itemBuilder: (context, index) {
        return _Tile(
          index: index,
          extent: (index % 5 + 1) * 100,
        );
      },
    )
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.index,
    required this.extent,
  });
  final int index;
  final double extent;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: extent,
      decoration: BoxDecoration(
          color: Colors.deepPurple.shade300, 
          borderRadius: const BorderRadius.all(
            Radius.circular(20)
      )),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            '$index', 
            style: const TextStyle(color: Colors.deepPurple),),
        ),
      ),
    );
  }
}

class _MenuAnimation with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => _showMenu;

  set showMenu(bool show) {
    _showMenu = show;
    notifyListeners();
  }
}