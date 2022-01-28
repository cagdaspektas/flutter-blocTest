import 'dart:collection';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/src/provider.dart';
import 'package:testing_bloc/core/quote_api_client.dart';
import 'package:testing_bloc/feature/bloc/quete_cubit.dart';
import 'package:testing_bloc/feature/model/quete_model.dart';

void main() {
  group('Cubit test', () {
    QueteCubit? queteCubit;

    setUp(() {
      queteCubit = QueteCubit(apiClient: QuoteApiClient());
    });
    blocTest<QueteCubit, QueteState>(
      'emits [MyState] when MyEvent is added.',
      build: () => QueteCubit(apiClient: QuoteApiClient()),
      act: (bloc) => bloc.fetchQuote(),
      expect: () => [isA<QueteData>()],
    );

    tearDown(() {
      queteCubit?.close();
    });
  });
}
