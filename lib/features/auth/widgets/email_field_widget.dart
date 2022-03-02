import 'package:app_openponic/common/validators/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextFieldWidget extends StatefulWidget {
  const EmailTextFieldWidget({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  _EmailTextFieldWidgetState createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  FocusNode? focusNode;
  static final _keyEmail = GlobalKey();

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
      focusNode: focusNode,
      key: _keyEmail,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        final validate = EmailValidator(value: value);
        return validate();
      },
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: 'Email',
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
