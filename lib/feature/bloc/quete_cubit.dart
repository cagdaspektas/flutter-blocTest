import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/core/quote_api_client.dart';
import 'package:testing_bloc/feature/model/quete_model.dart';

class QueteCubit extends Cubit<QueteState> {
  QueteCubit({required this.apiClient}) : super(QueteInit()) {
    init();
  }
  bool isLoad = false;

  final QuoteApiClient apiClient;
  Quote? datum;
  void init() {
    emit(QueteInit());
    fetchQuote();
  }

  void dwad() {
    emit(QueteDeneme());
  }

  Future<Quote?> fetchQuote() async {
    changeLoad();
    datum = await apiClient.fetchQuote();
    emit(QueteData(datum!));
    changeLoad();
  }

  void changeLoad() {
    isLoad = !isLoad;
  }
}

abstract class QueteState {}

class QueteInit extends QueteState {}

class QueteData extends QueteState {
  final Quote datum;

  QueteData(this.datum);
}

class QueteDeneme extends QueteState {}
