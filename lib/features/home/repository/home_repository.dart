import 'dart:async';
import 'dart:convert';

import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IHomeRepository {
  Stream<List<FlowerbadModel>> getAllFlowerbads();
}

class HomeRepository implements IHomeRepository {
  @override
  Stream<List<FlowerbadModel>> getAllFlowerbads() {
    DatabaseReference allPlat = FirebaseDatabase.instance.ref();
    final dataFinal = allPlat.onValue.map((event) {
      final stream = event.snapshot.value as List;
      final data = List<FlowerbadModel>.from(
        stream
            .map(
              (e) => FlowerbadModel.fromMap(
                jsonDecode(
                  jsonEncode(e),
                ),
              ),
            )
            .toList(),
      );

      return data;
    });
    return dataFinal;
  }
}

final homeRepositoryProvider = Provider<IHomeRepository>(
  (ref) => HomeRepository(),
);
