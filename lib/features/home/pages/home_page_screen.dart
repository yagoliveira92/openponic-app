import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:app_openponic/features/home/controller/home/home_controller.dart';
import 'package:app_openponic/features/home/controller/home/home_controller_state.dart';
import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/widgets/header_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 80,
                        right: 80,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const Text(
                                'Tensão (V)',
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/image/voltage.jpg',
                                    height: 110.0,
                                  ),
                                  Text(
                                    '${state.flowerbedSelected.sensors[1].value}',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
      error: (err, stack) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ops! Algo deu errado...',
              style: GoogleFonts.montserrat(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                primary: OpenponicColor.green,
              ),
              child: const Text(
                'Tentar novamente',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Image.asset(
              'assets/image/error_ilustration.png',
              height: 300.0,
            ),
          ],
        );
      },
      loading: () => const Center(
        child: SizedBox.square(
          dimension: 50.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
