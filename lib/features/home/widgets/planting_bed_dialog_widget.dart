import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantingBedDialogWidget extends StatelessWidget {
  const PlantingBedDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 23.0,
      ),
      title: const Text(
        'Selecione seu canteiro:',
      ),
      contentPadding: const EdgeInsets.all(5.0),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Canteiro 001',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Canteiro 002',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Canteiro 003',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
