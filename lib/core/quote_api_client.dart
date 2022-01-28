import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:testing_bloc/feature/model/quete_model.dart';

class QuoteApiClient {
  final _baseUrl = 'https://quote-garden.herokuapp.com';

  Future<Quote?> fetchQuote() async {
    final url = '$_baseUrl/api/v3/quotes';
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Quote.fromJson(json);
  }
}
