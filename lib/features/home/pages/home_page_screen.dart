import 'package:app_openponic/features/home/controller/home/home_controller.dart';
import 'package:app_openponic/features/home/controller/home/home_controller_state.dart';
import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/widgets/grid_cards_home_widget.dart';
import 'package:app_openponic/features/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    AsyncValue<List<FlowerbadModel>> data = ref.watch(homeStream);
    return data.when(
      data: (flowerbed) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => ref.read(homeController.notifier).initHome(list: flowerbed),
        );
        final state = ref.watch(homeController);
        if (state is HomeControllerReady) {
          return Builder(
            builder: (
              BuildContext context,
            ) {
              Size _size = MediaQuery.of(context).size;
              return SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: _size.height * 0.37,
                      child: HeaderHomeWidget(
                        changeFlowerbad:
                            ref.read(homeController.notifier).setFlowerbad,
                        flowebadName: state.allFlowerbad,
                        selectedFlowerbad: state.flowerbedSelected.nome,
                      ),
                    ),
                    GridCardsHomeWidget(
                      sensors: state.flowerbedSelected.sensors,
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: SizedBox.square(
            dimension: 50.0,
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (err, stack) => const SizedBox.shrink(),
      loading: () => const Center(
        child: SizedBox.square(
          dimension: 50.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
