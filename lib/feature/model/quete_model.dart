import 'package:equatable/equatable.dart';

class Quote {
  Quote({
    this.data,
  });

  List<Datum>? data;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class Datum extends Equatable {
  Datum({
    this.id,
    this.quoteText,
    this.quoteAuthor,
    this.quoteGenre,
    this.v,
  });

  String? id;
  String? quoteText;
  String? quoteAuthor;
  String? quoteGenre;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        quoteText: json["quoteText"],
        quoteAuthor: json["quoteAuthor"],
        quoteGenre: json["quoteGenre"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "quoteText": quoteText,
        "quoteAuthor": quoteAuthor,
        "quoteGenre": quoteGenre,
        "__v": v,
      };

  @override
  // TODO: implement props
  String toString() => 'Quote { id: $id }';

  @override
  // TODO: implement props
  List<Object?> get props => [id, quoteText, quoteAuthor];
}
