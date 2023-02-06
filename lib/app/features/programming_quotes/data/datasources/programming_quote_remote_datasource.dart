import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:programming_quotes/app/core/constant/endpoint.dart';
import 'package:programming_quotes/app/core/error/exception.dart';
import 'package:programming_quotes/app/features/programming_quotes/data/models/programming_quote.dart';

abstract class ProgrammingQuoteDatasource {
  Future<List<ProgrammingQuoteModel>> getProgrammingQuotes();
}

class ProgrammingQuoteDatasourceImpl implements ProgrammingQuoteDatasource {
  final _dio = Dio();
  @override
  Future<List<ProgrammingQuoteModel>> getProgrammingQuotes() async {
    try {
      final response =
          await _dio.get('$API_URL_BASE?tags=technology&limit=10&page=1');

      if (response.statusCode == 200) {
        var result = jsonDecode(jsonEncode(response.data['results']));
        var list = <ProgrammingQuoteModel>[];
        for (var e in result) {
          list.add(ProgrammingQuoteModel.fromJson(e));
        }
        return list;
      }
      throw ServerException(
          'Status code error ${response.statusCode.toString()}');
    } catch (e) {
      throw ServerException('Failed to load data ${e.toString()}');
    }
  }
}
