import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/bloc/programming_quotes_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/pages/programming_quotes_detail.dart';

class BuildCard extends StatelessWidget {
  final BuildContext context;
  final List<ProgrammingQuote> list;
  const BuildCard({
    super.key,
    required this.context,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? _emptyList()
        : ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var pq = list[index];
              return _card(context, pq);
            },
          );
  }

  Center _emptyList() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.list_alt_rounded,
            size: 100,
            color: Colors.blue[700],
          ),
          const SizedBox(height: 20),
          Text(
            'The list is empty.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {
              var bloc = BlocProvider.of<ProgrammingQuotesBloc>(context);
              bloc.add(GetProgrammingQuotesList());
            },
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue[700]!,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              height: 50,
              width: 300,
              child: Center(
                child: Text(
                  'Refresh List',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _card(BuildContext context, ProgrammingQuote pq) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[50],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(ProgrammingQuotesDetail.route(context, pq));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue[900],
                ),
              ),
            ),
            Text(
              pq.content,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Author: ${pq.author}',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var tag in pq.tags)
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue //grey.shade400,
                          ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
