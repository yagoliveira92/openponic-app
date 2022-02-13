import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.55),
                  BlendMode.modulate,
                ),
                image: const AssetImage(
                  'assets/image/background_home.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.0, 0.6),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              height: 500,
            ),
          ),
          Positioned(
            top: 180,
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                width: 300.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/openponic_logo.png',
                      height: 110.0,
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/image/weather_img.png',
                            height: 130.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                '32º ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Roboto',
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '17º',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Roboto',
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
