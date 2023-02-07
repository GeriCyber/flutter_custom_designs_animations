import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed, 
    required this.icon
  });
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    super.key, 
    this.showMenu = true, 
    this.activeColor = Colors.deepPurple, 
    this.inactiveColor = Colors.grey, 
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: showMenu ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {  
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
            return _MenuBackground(
              child: _MenuItems(items: items)
            );
          }
        ),
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  const _MenuBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            spreadRadius: -5,
            blurRadius: 10
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length, 
        (index) => _ItemMenu(
          index: index, 
          item: items[index]
        )
      )
    );
  }
}

class _ItemMenu extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _ItemMenu({
    required this.index, 
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<_MenuModel>(context).selectedItem;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (selectedIndex == index) ? 35 : 25,
          color: (selectedIndex == index) 
          ? activeColor
          : inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;
  Color activeColor = Colors.deepPurple;
  Color inactiveColor = Colors.grey;

  int get selectedItem => _selectedIndex;

  set selectedItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}