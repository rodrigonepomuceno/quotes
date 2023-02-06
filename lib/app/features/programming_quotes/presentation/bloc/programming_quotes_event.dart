part of 'programming_quotes_bloc.dart';

abstract class ProgrammingQuotesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProgrammingQuotesList extends ProgrammingQuotesEvent {}

class RemoveProgrammingQuote extends ProgrammingQuotesEvent {
  final ProgrammingQuote pq;
  RemoveProgrammingQuote(this.pq);
}

class UpdateProgrammingQuote extends ProgrammingQuotesEvent {
  final ProgrammingQuote pq;
  UpdateProgrammingQuote(this.pq);
}

class NetowrkErrorEvent extends Error {}
