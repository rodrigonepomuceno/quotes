// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProgrammingQuote extends Equatable {
  final String id;
  final String author;
  final String content;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  const ProgrammingQuote({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

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

  ProgrammingQuote copyWith({
    String? id,
    String? author,
    String? content,
    List<String>? tags,
    String? authorSlug,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) {
    return ProgrammingQuote(
      id: id ?? this.id,
      author: author ?? this.author,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      authorSlug: authorSlug ?? this.authorSlug,
      length: length ?? this.length,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
