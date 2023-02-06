import 'package:dartz/dartz.dart';
import 'package:programming_quotes/app/core/error/exception.dart';
import 'package:programming_quotes/app/core/error/failure.dart';
import 'package:programming_quotes/app/core/platform/network_info.dart';
import 'package:programming_quotes/app/features/programming_quotes/data/datasources/programming_quote_remote_datasource.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart'
    as entitie;
import 'package:programming_quotes/app/features/programming_quotes/domain/repositories/programming_quote_repository.dart';

class ProgrammingQuoteRepositoryImpl implements ProgrammingQuoteRepository {
  final ProgrammingQuoteDatasource programmingQuoteDatasource;
  final NetworkInfo networkInfo;

  ProgrammingQuoteRepositoryImpl({
    required this.programmingQuoteDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<entitie.ProgrammingQuote>>>
      getProgrammingQuotes() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await programmingQuoteDatasource.getProgrammingQuotes());
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(NetworkFailure());
  }
}
