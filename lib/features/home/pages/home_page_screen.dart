import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/widgets/grid_cards_home_widget.dart';
import 'package:app_openponic/features/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/home/home_controller.dart';

class HomePageScreen extends ConsumerWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size _size = MediaQuery.of(context).size;
    AsyncValue<FlowerbadModel> data = ref.watch(homeStream);
    return data.when(
      data: (flowerbed) {
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
      },
      error: (err, stack) => const SizedBox.shrink(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
