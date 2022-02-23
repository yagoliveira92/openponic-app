import 'package:app_openponic/core/providers/providers.dart';
import 'package:app_openponic/features/home/controller/home_controller_state.dart';
import 'package:app_openponic/features/home/widgets/bottom_bar_widget.dart';
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
    return Scaffold(
      bottomNavigationBar: const BottomBarWidget(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.modulate,
                    ),
                    image: AssetImage(
                      'assets/image/background_home.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(homeControllerNotifierProvider);
                if (state is HomeControllerLoading) {
                  return Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Aguarde'),
                    ],
                  );
                }
                if (state is HomeControllerReady) {
                  return Column(
                    children: const [
                      Text('FUNFOU'),
                    ],
                  );
                }
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => ref
                          .read(homeControllerNotifierProvider.notifier)
                          .clickButton(),
                      child: const Text('Aperte aqui'),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
      //
      // Stack(
      //   clipBehavior: Clip.none,
      //   alignment: AlignmentDirectional.topCenter,
      //   children: [
      //     Container(
      //       height: 300,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           colorFilter: ColorFilter.mode(
      //             Colors.white.withOpacity(0.55),
      //             BlendMode.modulate,
      //           ),
      //           image: const AssetImage(
      //             'assets/image/background_home.png',
      //           ),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: const Alignment(0.0, 0.6),
      //       child: Container(
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(35),
      //             topRight: Radius.circular(35),
      //           ),
      //         ),
      //         height: 500,
      //         child:
      //       ),
      //     ),
      //     Positioned(
      //       top: 145,
      //       child: Card(
      //         elevation: 15,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(20.0),
      //         ),
      //         child: Container(
      //           padding: const EdgeInsets.all(10.0),
      //           width: 250.0,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Image.asset(
      //                 'assets/image/openponic_logo.png',
      //                 height: 90.0,
      //               ),
      //               SizedBox(
      //                 child: Column(
      //                   children: [
      //                     Image.asset(
      //                       'assets/image/weather_img.png',
      //                       height: 90.0,
      //                     ),
      //                     Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       children: const [
      //                         Text(
      //                           '32º ',
      //                           style: TextStyle(
      //                             fontSize: 30,
      //                             fontFamily: 'Roboto',
      //                             color: Colors.red,
      //                           ),
      //                         ),
      //                         Text(
      //                           '17º',
      //                           style: TextStyle(
      //                             fontSize: 25,
      //                             fontFamily: 'Roboto',
      //                             color: Colors.blue,
      //                           ),
      //                         ),
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
