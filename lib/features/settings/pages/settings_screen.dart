import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              height: 150,
              decoration: const BoxDecoration(
                color: OpenponicColor.blueLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Configurações',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        minRadius: 40,
                        backgroundImage:
                            AssetImage('assets/image/profile_image.png'),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Produtor',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            'Perfil',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Mudar parâmetros',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Atual: 10',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          // focusNode: focusNode,
                          // key: _keyEmail,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          // validator: (value) {
                          //   final validate = EmailValidator(value: value);
                          //   return validate();
                          // },
                          //controller: widget.controller,
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Atual: 10',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          // focusNode: focusNode,
                          // key: _keyEmail,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          // validator: (value) {
                          //   final validate = EmailValidator(value: value);
                          //   return validate();
                          // },
                          //controller: widget.controller,
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Atual: 10',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          // focusNode: focusNode,
                          // key: _keyEmail,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          // validator: (value) {
                          //   final validate = EmailValidator(value: value);
                          //   return validate();
                          // },
                          //controller: widget.controller,
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Atual: 10',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: GoogleFonts.montserrat(),
                          // focusNode: focusNode,
                          // key: _keyEmail,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          // validator: (value) {
                          //   final validate = EmailValidator(value: value);
                          //   return validate();
                          // },
                          //controller: widget.controller,
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
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: OpenponicColor.green,
                    ),
                    child: const Text(
                      'Salvar parâmetros',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
