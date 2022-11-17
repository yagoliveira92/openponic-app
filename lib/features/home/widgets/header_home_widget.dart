import 'package:app_openponic/features/home/widgets/planting_bed_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({
    required this.flowebadName,
    required this.selectedFlowerbad,
    required this.changeFlowerbad,
    Key? key,
  }) : super(key: key);
  final List<String> flowebadName;
  final String selectedFlowerbad;
  final Function({required String name}) changeFlowerbad;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: _size.height * 0.28,
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
            onTap: () async {
              return showModalBottomSheet<void>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return PlantingBedDialogWidget(
                    actualName: selectedFlowerbad,
                    changeFlowerbad: changeFlowerbad,
                    listName: flowebadName,
                  );
                },
              );
            },
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
              child: Center(
                child: Text(
                  selectedFlowerbad,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 40.0,
          right: 40.0,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/openponic_logo.jpg',
                    height: 95.0,
                  ),
                  const SizedBox(
                    height: 65.0,
                    child: VerticalDivider(
                      width: 10.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          minRadius: 40,
                          backgroundImage:
                              AssetImage('assets/image/profile_image.png'),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Usuário',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
