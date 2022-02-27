abstract class HomeControllerState {
  const HomeControllerState();
}

class HomeControllerInit extends HomeControllerState {
  const HomeControllerInit();
}

class HomeControllerLoading extends HomeControllerState {
  const HomeControllerLoading();
}

class HomeControllerReady extends HomeControllerState {
  const HomeControllerReady();
}

class HomeControllerError extends HomeControllerState {
  const HomeControllerError();
}
