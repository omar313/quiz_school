class Word {
  int _id;
  String _lessonId;
  String _word;
  String _status;
  String _createdAt;
  String _updatedAt;
  String _allWord;

  Word(
      {int id,
      String lessonId,
      String word,
      String status,
      String createdAt,
      String updatedAt,
      String allWord}) {
    this._id = id;
    this._lessonId = lessonId;
    this._word = word;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._allWord = allWord;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get lessonId => _lessonId;
  set lessonId(String lessonId) => _lessonId = lessonId;
  String get word => _word;
  set word(String word) => _word = word;
  String get status => _status;
  set status(String status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  String get allWord => _allWord;
  set allWord(String allWord) => _allWord = allWord;

  Word.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonId = json['lesson_id'];
    _word = json['word'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _allWord = json['all_word'];
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
    return data;
  }
}

