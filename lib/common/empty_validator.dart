class EmptyValueValidator {
  EmptyValueValidator({
    required this.value,
  });

  final String? value;

  String? call() {
    if (value!.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }
}
