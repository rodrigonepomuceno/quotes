import 'package:programming_quotes/app/features/programming_quotes/data/models/programming_quote.dart';

abstract class ProgrammingQuoteLocalDatasource {
  Future<List<ProgrammingQuoteModel>> getLastProgrammingQuotes();
  Future<void> cachedProgrammingQuotes(
      List<ProgrammingQuoteModel> programmingQuotesToCache);
}
