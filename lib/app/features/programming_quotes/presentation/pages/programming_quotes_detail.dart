import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart';
import 'package:programming_quotes/app/features/programming_quotes/presentation/bloc/programming_quotes_bloc.dart';

class ProgrammingQuotesDetail extends StatefulWidget {
  final ProgrammingQuote pq;
  final BuildContext blocContext;
  const ProgrammingQuotesDetail({
    Key? key,
    required this.pq,
    required this.blocContext,
  }) : super(key: key);

  static MaterialPageRoute<void> route(
          BuildContext context, ProgrammingQuote pq) =>
      MaterialPageRoute(
        builder: (_) => ProgrammingQuotesDetail(
          blocContext: context,
          pq: pq,
        ),
      );

  @override
  State<ProgrammingQuotesDetail> createState() =>
      _ProgrammingQuotesDetailState();
}

class _ProgrammingQuotesDetailState extends State<ProgrammingQuotesDetail> {
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.pq.content;
  }

  @override
  void dispose() {
    textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProgrammingQuotesBloc>(widget.blocContext);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.blue[700],
          ),
          backgroundColor: Colors.grey.shade100,
          title: Text(
            'Edit Quote',
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 30,
            ),
          ),
        ),
        bottomNavigationBar: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _button(
              context,
              onTap: () => showAlertDialog(
                context,
                title: 'Delete Quote',
                message:
                    'Do you want to delete the quote by author ${widget.pq.author}?',
                onPressed: () => bloc.add(
                  RemoveProgrammingQuote(widget.pq),
                ),
              ),
              title: 'Delete',
            ),
            _button(
              context,
              onTap: () => showAlertDialog(
                context,
                title: 'Update Quote',
                message:
                    'Do you want to update the quote by author ${widget.pq.author}?',
                onPressed: () {
                  var newPq = ProgrammingQuote(
                    id: widget.pq.id,
                    author: widget.pq.author,
                    content: textController.text,
                    tags: widget.pq.tags,
                    authorSlug: widget.pq.authorSlug,
                    length: widget.pq.length,
                    dateAdded: widget.pq.dateAdded,
                    dateModified: widget.pq.dateModified,
                  );
                  bloc.add(
                    UpdateProgrammingQuote(newPq),
                  );
                },
              ),
              title: 'Update',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                enabled: true,
                controller: textController,
                minLines: 1,
                maxLines: 10,
                textInputAction: TextInputAction.done,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Author: ${widget.pq.author}',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(
    BuildContext context, {
    required String title,
    required String message,
    required Function() onPressed,
  }) {
    Widget cancelButton = TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('Cancel'),
    );
    Widget continueButton = TextButton(
      onPressed: () {
        onPressed();
        Navigator.pop(context);
        Navigator.pop(context);
      },
      child: const Text('Continue'),
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Expanded _button(BuildContext context,
      {required Function() onTap, required String title}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: onTap,
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
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
