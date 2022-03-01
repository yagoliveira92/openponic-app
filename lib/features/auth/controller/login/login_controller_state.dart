abstract class LoginControllerState {
  const LoginControllerState();
}

class LoginControllerInit extends LoginControllerState {
  const LoginControllerInit();
}

class LoginControllerLoading extends LoginControllerState {
  const LoginControllerLoading();
}

class LoginControllerSuccess extends LoginControllerState {
  const LoginControllerSuccess();
}

class LoginControllerError extends LoginControllerState {
  const LoginControllerError({required this.errorMessage});

  final String errorMessage;
}
