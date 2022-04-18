import 'package:app_openponic/common/validators/empty_validator.dart';
import 'package:app_openponic/features/settings/models/parameters_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSettingsWidget extends StatelessWidget {
  const FormSettingsWidget(
      {required this.pHController,
      required this.conduController,
      required this.tempController,
      required this.umidController,
      required this.parametersValue,
      Key? key})
      : super(key: key);

  final TextEditingController pHController;
  final TextEditingController tempController;
  final TextEditingController conduController;
  final TextEditingController umidController;
  final List<ParameterModel> parametersValue;

  @override
  Widget build(BuildContext context) {
    FocusNode? focusNode;
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
            child: Text(
              'pH atual: ${_searchValue(parameter: 'ph')}',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          TextFormField(
            style: GoogleFonts.montserrat(),
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.none,
            controller: pHController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: 'Parâmetro para pH',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0),
            child: Text(
              'Temperatura atual:  ${_searchValue(parameter: 'temperatura')}',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          TextFormField(
            style: GoogleFonts.montserrat(),
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.none,
            controller: tempController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: 'Parâmetro para Temperatura',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0),
            child: Text(
              'Umidade atual:  ${_searchValue(parameter: 'umidade')}',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          TextFormField(
            style: GoogleFonts.montserrat(),
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.none,
            controller: umidController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: 'Parâmetro para Umidade',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8.0),
            child: Text(
              'Condutividade atual:  ${_searchValue(parameter: 'condutividade')}',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          TextFormField(
            style: GoogleFonts.montserrat(),
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.none,
            controller: conduController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelText: 'Parâmetro para Condutividade',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _searchValue({required String parameter}) {
    final search =
        parametersValue.firstWhere((element) => element.name == parameter);
    return search.value ?? 0.0;
  }
}
