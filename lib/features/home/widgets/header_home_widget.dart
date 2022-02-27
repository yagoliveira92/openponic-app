import 'package:app_openponic/features/home/widgets/planting_bed_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: _size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
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
        Positioned(
          child: InkWell(
            onTap: () async => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  const PlantingBedDialogWidget(),
            ),
            child: Container(
              height: 60.0,
              width: _size.width,
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 15.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.transparent,
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  '< Canteiro Maria Opala >',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 50.0,
          right: 50.0,
          child: Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/openponic_logo.png',
                    height: 80.0,
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/image/weather_img.png',
                          height: 75.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '32º ',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Text(
                              '17º',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
