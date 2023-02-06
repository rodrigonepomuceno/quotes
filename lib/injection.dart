import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:programming_quotes/app/core/platform/network_info.dart';
import 'package:programming_quotes/app/features/programming_quotes/data/datasources/programming_quote_remote_datasource.dart';
import 'package:programming_quotes/app/features/programming_quotes/data/repositories/programming_quote_repository_impl.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/repositories/programming_quote_repository.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/usecases/get_programming_quotes.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/bloc/programming_quotes_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Core and External
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //Ddata Sources
  getIt.registerLazySingleton<ProgrammingQuoteDatasource>(
      () => ProgrammingQuoteDatasourceImpl());

  //Repositories
  getIt.registerLazySingleton<ProgrammingQuoteRepository>(() =>
      ProgrammingQuoteRepositoryImpl(
          networkInfo: getIt(), programmingQuoteDatasource: getIt()));

  //UseCases
  getIt.registerLazySingleton(() => GetProgrammingQuotes(repository: getIt()));

  //Bloc
  getIt.registerLazySingleton(() => ProgrammingQuotesBloc(getIt()));
}
