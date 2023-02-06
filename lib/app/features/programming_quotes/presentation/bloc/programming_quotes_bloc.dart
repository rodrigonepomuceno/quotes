import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/data/models/programming_quote.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/usecases/get_programming_quotes.dart';

part 'programming_quotes_event.dart';
part 'programming_quotes_state.dart';

class ProgrammingQuotesBloc
    extends Bloc<ProgrammingQuotesEvent, ProgrammingQuotesState> {
  final GetProgrammingQuotes _getProgrammingQuotesUseCase;

  ProgrammingQuotesBloc(this._getProgrammingQuotesUseCase)
      : super(ProgrammingQuotesInitial()) {
    on<GetProgrammingQuotesList>(_getProgrammingQuotes);
    on<RemoveProgrammingQuote>(_removeProgrammingQuote);
    on<UpdateProgrammingQuote>(_updateProgrammingQuote);
  }

  void _getProgrammingQuotes(
    GetProgrammingQuotesList event,
    Emitter<ProgrammingQuotesState> emit,
  ) async {
    emit(ProgrammingQuotesLoading());
    final result = await _getProgrammingQuotesUseCase();
    result.fold(
      (l) => emit(ProgrammingQuotesError(l.toString())),
      (r) => emit(ProgrammingQuotesLoaded(r)),
    );
  }

  void _removeProgrammingQuote(
    RemoveProgrammingQuote event,
    Emitter<ProgrammingQuotesState> emit,
  ) async {
    state.list.removeWhere((element) => element.id == event.pq.id);
    emit(ProgrammingQuotesRemove(state.list));
    emit(ProgrammingQuotesLoaded(state.list));
  }

  void _updateProgrammingQuote(
    UpdateProgrammingQuote event,
    Emitter<ProgrammingQuotesState> emit,
  ) async {
    var index = state.list.indexWhere((element) => element.id == event.pq.id);

    state.list[index] = ProgrammingQuoteModel(
      id: event.pq.id,
      author: event.pq.author,
      content: event.pq.content,
      tags: event.pq.tags,
      authorSlug: event.pq.authorSlug,
      length: event.pq.length,
      dateAdded: event.pq.dateAdded,
      dateModified: event.pq.dateModified,
    );
    emit(ProgrammingQuotesUpdate(state.list));
    emit(ProgrammingQuotesLoaded(state.list));
  }
}
