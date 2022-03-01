import 'package:app_openponic/common/empty_validator.dart';
import 'package:app_openponic/common/openponic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  FocusNode? focusNode;
  static final _keyPassword = GlobalKey();
  bool _showPassword = true;

  void changeShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(),
      obscureText: _showPassword,
      focusNode: focusNode,
      key: _keyPassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        final validate = EmptyValueValidator(value: value);
        return validate();
      },
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
          onPressed: changeShowPassword,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusColor: OpenponicColor.green,
        labelText: 'Senha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }
}
