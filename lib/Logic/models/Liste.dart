class Liste {
  int _id = 0;
  String _title;

  // List<Element> _elements;

  // Liste(this._id, this._title, this._elements);
  Liste(this._id, this._title);

  Liste.withoutId(this._title);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'titre': this._title,
    };
  }
}
