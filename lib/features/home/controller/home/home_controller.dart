import 'package:app_openponic/features/home/controller/home/home_controller_state.dart';
import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/models/sensor_model.dart';
import 'package:app_openponic/features/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeControllerState> {
  HomeController() : super(const HomeControllerInit());

  List<FlowerbadModel> listFlowerbad = [];
  String flowerbadName = '';
  List<SensorModel> listSensors = [];
  List<String> allFlowerbadNames = [];
  bool isChangeBed = false;

  void initHome({required List<FlowerbadModel> list}) {
    if (!isChangeBed) {
      allFlowerbadNames = [];
      listFlowerbad = list;
      flowerbadName = list[0].nome;
      for (var element in list) {
        allFlowerbadNames.add(element.nome);
      }
      var newState = HomeControllerReady(
        allFlowerbad: allFlowerbadNames,
        flowerbedSelected: listFlowerbad[0],
      );
      if (state != newState) {
        state = newState;
      }
    }
    isChangeBed = false;
  }

  void setFlowerbad({required String name}) {
    flowerbadName = name;
    isChangeBed = true;
    FlowerbadModel newSelected =
        listFlowerbad.firstWhere((element) => element.nome == name);
    state = HomeControllerReady(
      allFlowerbad: allFlowerbadNames,
      flowerbedSelected: newSelected,
    );
  }
}

final homeStream =
    StreamProvider.autoDispose<List<FlowerbadModel>>((ref) async* {
  final IHomeRepository homeRepository = ref.watch(homeRepositoryProvider);
  final data = homeRepository.getAllFlowerbads();
  await for (final value in data) {
    yield value;
  }
});

final homeController =
    StateNotifierProvider<HomeController, HomeControllerState>(
  (ref) => HomeController(),
);
