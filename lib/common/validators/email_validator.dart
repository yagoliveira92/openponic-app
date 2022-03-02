class EmailValidator {
  EmailValidator({required this.value});

  final String? value;
  String? call() {
    if (value!.isEmpty) {
      return 'Este campo é obrigatório';
    }
    final regex = RegExp(
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
    if (!regex.hasMatch(value!)) {
      return 'Informe um email válido';
    }
    return null;
  }
}
