import 'package:programming_quotes/app/features/programming_quotes/domain/entities/programming_quote.dart';

class ProgrammingQuoteModel extends ProgrammingQuote {
  const ProgrammingQuoteModel({
    required String id,
    required String author,
    required String content,
    required List<String> tags,
    required String authorSlug,
    required int length,
    required String dateAdded,
    required String dateModified,
  }) : super(
          id: id,
          author: author,
          authorSlug: authorSlug,
          content: content,
          dateAdded: dateAdded,
          dateModified: dateModified,
          length: length,
          tags: tags,
        );

  factory ProgrammingQuoteModel.fromJson(Map<String, dynamic> json) {
    return ProgrammingQuoteModel(
      id: json['_id'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      tags: List<String>.from(
        (json['tags']).map<String>(
          (x) => (x as String),
        ),
      ),
      authorSlug: json['authorSlug'] as String,
      length: json['length'] as int,
      dateAdded: json['dateAdded'] as String,
      dateModified: json['dateModified'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'tags': tags,
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
    };
  }

  @override
  List<Object> get props => [
        id,
        author,
        content,
        tags,
        authorSlug,
        length,
        dateAdded,
        dateModified,
      ];
}
