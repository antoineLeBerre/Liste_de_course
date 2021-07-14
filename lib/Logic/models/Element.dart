class Element {
  int _id;
  String _titre;
  bool _isCoche;

  Element(this._id, this._titre, this._isCoche);

  bool get isCoche => _isCoche;

  set isCoche(bool value) {
    _isCoche = value;
  }

  String get titre => _titre;

  set titre(String value) {
    _titre = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
