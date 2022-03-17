import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IHomeRepository {
  FlowerbadModel getAllFlowerbads();
}

class HomeRepository implements IHomeRepository {
  @override
  FlowerbadModel getAllFlowerbads() {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference allPlat = database.ref('openponic-mvp-default-rtdb');
    allPlat.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
    });
    return FlowerbadModel(nome: "aa", sensors: []);
  }
}

final homeRepositoryProvider = Provider<IHomeRepository>(
  (ref) => HomeRepository(),
);
