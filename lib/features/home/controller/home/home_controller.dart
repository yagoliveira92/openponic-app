import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStream = StreamProvider.autoDispose<FlowerbadModel>((ref) async* {
  final IHomeRepository homeRepository = ref.watch(homeRepositoryProvider);
  final data = homeRepository.getAllFlowerbads();
  await for (final value in data) {
    yield value;
  }
});
