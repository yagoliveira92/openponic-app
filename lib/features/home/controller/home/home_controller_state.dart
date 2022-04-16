import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeControllerState extends Equatable {
  const HomeControllerState();
}

class HomeControllerInit extends HomeControllerState {
  const HomeControllerInit();

  @override
  List<Object?> get props => [];
}

class HomeControllerLoading extends HomeControllerState {
  const HomeControllerLoading();

  @override
  List<Object?> get props => [];
}

class HomeControllerReady extends HomeControllerState {
  const HomeControllerReady({
    required this.flowerbedSelected,
    required this.allFlowerbad,
  });
  final FlowerbadModel flowerbedSelected;
  final List<String> allFlowerbad;

  @override
  List<Object?> get props => [
        flowerbedSelected,
        allFlowerbad,
      ];
}

class HomeControllerError extends HomeControllerState {
  const HomeControllerError();

  @override
  List<Object?> get props => [];
}
