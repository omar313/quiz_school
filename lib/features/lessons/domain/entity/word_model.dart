class Word {
  int _id;
  int _lessonId;
  String _word;
  int _status;
  String _createdAt;
  String _updatedAt;
  String _allWord;
  String _yomikata;
  String _meaning;

  Word(
      {int id,
      int lessonId,
      String word,
      int status,
      String createdAt,
      String updatedAt,
      String allWord,
      String yomikata,
      String meaning}) {
    this._id = id;
    this._lessonId = lessonId;
    this._word = word;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._allWord = allWord;
    this._yomikata = yomikata;
    this._meaning = meaning;
  }

  String get yomikata => _yomikata;

  int get id => _id;

  set id(int id) => _id = id;

  int get lessonId => _lessonId;

  set lessonId(int lessonId) => _lessonId = lessonId;

  String get word => _word;

  set word(String word) => _word = word;

  int get status => _status;

  set status(int status) => _status = status;

  String get createdAt => _createdAt;

  set createdAt(String createdAt) => _createdAt = createdAt;

  String get updatedAt => _updatedAt;

  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  String get allWord => _allWord;

  set allWord(String allWord) => _allWord = allWord;

  set yomikata(String value) {
    _yomikata = value;
  }

  String get meaning => _meaning;

  set meaning(String value) {
    _meaning = value;
  }

  Word.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonId = json['lesson_id'];
    _word = json['word'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _allWord = json['all_word'];
    _yomikata = json['yomikata'] ?? 'N/A';
    _meaning = json['meaning'] ?? 'N/A';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['lesson_id'] = this._lessonId;
    data['word'] = this._word;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['all_word'] = this._allWord;
    data['yomikata'] = this._yomikata;
    data['meaning'] = this._meaning;
    return data;
  }
}
