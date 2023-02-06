// ignore_for_file: must_be_immutable

part of 'programming_quotes_bloc.dart';

abstract class ProgrammingQuotesState extends Equatable {
  final List<ProgrammingQuote> list;
  const ProgrammingQuotesState(this.list);

  @override
  List<Object> get props => [];
}

class ProgrammingQuotesInitial extends ProgrammingQuotesState {
  ProgrammingQuotesInitial() : super([]);
}

class ProgrammingQuotesLoading extends ProgrammingQuotesState {
  ProgrammingQuotesLoading() : super([]);
}

class ProgrammingQuotesLoaded extends ProgrammingQuotesState {
  const ProgrammingQuotesLoaded(list) : super(list);
}

class ProgrammingQuotesRemove extends ProgrammingQuotesState {
  const ProgrammingQuotesRemove(list) : super(list);
  @override
  List<Object> get props => list;
}

class ProgrammingQuotesUpdate extends ProgrammingQuotesState {
  final List<ProgrammingQuote> updateList;
  const ProgrammingQuotesUpdate(this.updateList) : super(updateList);
  @override
  List<Object> get props => updateList;
}

class ProgrammingQuotesError extends ProgrammingQuotesState {
  final String message;
  ProgrammingQuotesError(this.message) : super([]);
}
