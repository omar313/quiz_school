class LessonResponse {
  String _status;
  List<Lesson> _allLesson;

  LessonResponse({String status, List<Lesson> allLesson}) {
    this._status = status;
    this._allLesson = allLesson;
  }

  String get status => _status;
  set status(String status) => _status = status;
  List<Lesson> get allLesson => _allLesson;
  set allLesson(List<Lesson> allLesson) => _allLesson = allLesson;

  LessonResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['all_lesson'] != null) {
      _allLesson = <Lesson>[];
      json['all_lesson'].forEach((v) {
        _allLesson.add(new Lesson.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._allLesson != null) {
      data['all_lesson'] = this._allLesson.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesson {
  int _id;
  String _lessonName;
  String _lessonDiscription;
  String _videoUrl;
  String _wordTitle;
  String _quizTitle;
  String _status;
  String _createdAt;
  String _updatedAt;

  Lesson(
      {int id,
      String lessonName,
      String lessonDiscription,
      String videoUrl,
      String wordTitle,
      String quizTitle,
      String status,
      String createdAt,
      String updatedAt}) {
    this._id = id;
    this._lessonName = lessonName;
    this._lessonDiscription = lessonDiscription;
    this._videoUrl = videoUrl;
    this._wordTitle = wordTitle;
    this._quizTitle = quizTitle;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get lessonName => _lessonName;
  set lessonName(String lessonName) => _lessonName = lessonName;
  String get lessonDiscription => _lessonDiscription;
  set lessonDiscription(String lessonDiscription) =>
      _lessonDiscription = lessonDiscription;
  String get videoUrl => _videoUrl;
  set videoUrl(String videoUrl) => _videoUrl = videoUrl;
  String get wordTitle => _wordTitle;
  set wordTitle(String wordTitle) => _wordTitle = wordTitle;
  String get quizTitle => _quizTitle;
  set quizTitle(String quizTitle) => _quizTitle = quizTitle;
  String get status => _status;
  set status(String status) => _status = status;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  Lesson.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonName = json['lesson_name'];
    _lessonDiscription = json['lesson_discription'];
    _videoUrl = json['video_url'];
    _wordTitle = json['word_title'];
    _quizTitle = json['quiz_title'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['lesson_name'] = this._lessonName;
    data['lesson_discription'] = this._lessonDiscription;
    data['video_url'] = this._videoUrl;
    data['word_title'] = this._wordTitle;
    data['quiz_title'] = this._quizTitle;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

