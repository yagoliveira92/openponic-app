import 'package:app_openponic/features/home/widgets/grid_cards_home_widget.dart';
import 'package:app_openponic/features/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: _size.height * 0.37,
            child: const HeaderHomeWidget(),
          ),
          const GridCardsHomeWidget(),
        ],
      ),
    );
  }
}
