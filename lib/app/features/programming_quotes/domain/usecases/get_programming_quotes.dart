import 'package:dartz/dartz.dart';
import 'package:programming_quotes/app/core/error/failure.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart'
    as entitie;
import 'package:programming_quotes/app/features/programming_quotes/domain/repositories/programming_quote_repository.dart';

class GetProgrammingQuotes {
  final ProgrammingQuoteRepository repository;

  GetProgrammingQuotes({required this.repository});

  Future<Either<Failure, List<entitie.ProgrammingQuote>>> call() async {
    return await repository.getProgrammingQuotes();
  }
}
