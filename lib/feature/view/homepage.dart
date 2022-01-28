import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_bloc/core/quote_api_client.dart';
import 'package:http/http.dart' as http;

import 'package:testing_bloc/feature/bloc/quete_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  http.Client? httpClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QueteCubit>(
      create: (context) => QueteCubit(apiClient: QuoteApiClient()),
      child: BlocConsumer<QueteCubit, QueteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: context.read<QueteCubit>().isLoad
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: context.read<QueteCubit>().datum?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text(
                          '${context.read<QueteCubit>().datum?.data?[index].id}',
                        ),
                        title: Text(context.read<QueteCubit>().datum?.data?[index].quoteAuthor ?? ''),
                        isThreeLine: true,
                        subtitle: Text(context.read<QueteCubit>().datum?.data?[index].quoteGenre ?? ''),
                        dense: true,
                      );
                    },
                  ),
          );
        },
      ),
    );
  }

  /* 
   @override

 Widget build(BuildContext context) {

    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteEmpty) {
          BlocProvider.of<QuoteBloc>(context).fetch();
        }
        if (state is QuoteError) {
          return const Center(
            child: Text('failed to fetch quote'),
          );
        }
        if (state is QuoteLoaded) {
          return ListView.builder(
            itemCount: state.quote?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  '${state.quote?.data?[index].id}',
                ),
                title: Text(state.quote?.data?[index].quoteText ?? ''),
                isThreeLine: true,
                subtitle: Text(state.quote?.data?[index].quoteAuthor ?? ''),
                dense: true,
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  } */
}
