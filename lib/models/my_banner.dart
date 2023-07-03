class MyBanner {
  int _id;
  String _image;

  MyBanner(this._id, this._image);

  factory MyBanner.fromMapJson(Map<String, dynamic> jsonObject) {
    return MyBanner(
      jsonObject['id'],
      jsonObject['image'],
    );
  }

  int get id => _id;
  String get image => _image;
}
