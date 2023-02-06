import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/bloc/programming_quotes_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/widgets/build_card.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/widgets/error.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/widgets/loading.dart';
import 'package:programming_quotes/injection.dart';

class ProgrammingQuotesPage extends StatefulWidget {
  const ProgrammingQuotesPage({Key? key}) : super(key: key);

  @override
  State<ProgrammingQuotesPage> createState() => _ProgrammingQuotesPageState();
}

class _ProgrammingQuotesPageState extends State<ProgrammingQuotesPage> {
  final ProgrammingQuotesBloc _bloc = ProgrammingQuotesBloc(getIt());

  @override
  void initState() {
    _bloc.add(GetProgrammingQuotesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        title: Text(
          'List of Quotes',
          style: TextStyle(
            color: Colors.blue[700],
            fontSize: 30,
          ),
        ),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (_) => _bloc,
        lazy: true,
        child: BlocConsumer<ProgrammingQuotesBloc, ProgrammingQuotesState>(
          builder: (context, state) {
            if (state is ProgrammingQuotesInitial ||
                state is ProgrammingQuotesLoading) {
              return const Loading();
            } else if (state is ProgrammingQuotesLoaded) {
              return Center(
                child: BuildCard(
                  context: context,
                  list: state.list,
                ),
              );
            } else {
              return const ErrorLoading();
            }
          },
          listener: (context, state) {
            if (state is ProgrammingQuotesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
