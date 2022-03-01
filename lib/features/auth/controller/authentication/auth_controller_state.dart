abstract class AuthControllerState {
  const AuthControllerState();
}

class AuthControllerInit extends AuthControllerState {
  const AuthControllerInit();
}

class AuthControllerNoAuth extends AuthControllerState {
  const AuthControllerNoAuth();
}

class AuthControllerReady extends AuthControllerState {
  const AuthControllerReady();
}
