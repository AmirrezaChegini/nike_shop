class ProductComment {
  int _id;
  String _title;
  String _content;
  String _date;
  String _author;

  ProductComment(
    this._id,
    this._title,
    this._content,
    this._date,
    this._author,
  );

  factory ProductComment.fromMapJson(Map<String, dynamic> jsonOject) {
    return ProductComment(
      jsonOject['id'],
      jsonOject['title'],
      jsonOject['content'],
      jsonOject['date'],
      jsonOject['author']['email'],
    );
  }

  int get id => _id;
  String get title => _title;
  String get content => _content;
  String get date => _date;
  String get author => _author;
}
