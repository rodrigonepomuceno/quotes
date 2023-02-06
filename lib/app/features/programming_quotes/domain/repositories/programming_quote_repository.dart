import 'package:dartz/dartz.dart';
import 'package:programming_quotes/app/core/error/failure.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart';

abstract class ProgrammingQuoteRepository {
  Future<Either<Failure, List<ProgrammingQuote>>> getProgrammingQuotes();
}
