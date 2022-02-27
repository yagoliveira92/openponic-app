import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    required this.changeIndex,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  final Function(int index) changeIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 22.0,
      iconSize: 32.0,
      selectedItemColor: Colors.green,
      onTap: changeIndex,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.green,
          icon: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.ac_unit_outlined,
            ),
          ),
          label: 'Previsão',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.home,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'Menu',
        ),
      ],
    );
  }
}
