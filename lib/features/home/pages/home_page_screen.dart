import 'package:app_openponic/features/home/widgets/grid_cards_home_widget.dart';
import 'package:app_openponic/features/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: _size.height * 0.35,
            child: const HeaderHomeWidget(),
          ),
          const GridCardsHomeWidget(),
        ],
      ),
    );
  }
}
