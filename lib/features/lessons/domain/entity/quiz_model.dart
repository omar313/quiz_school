class QuizResponse {
  String _status;
  List<Questions> _questions;

  QuizResponse({String status, List<Questions> questions}) {
    this._status = status;
    this._questions = questions;
  }

  String get status => _status;
  set status(String status) => _status = status;
  List<Questions> get questions => _questions;
  set questions(List<Questions> questions) => _questions = questions;

  QuizResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['questions'] != null) {
      _questions = new List<Questions>();
      json['questions'].forEach((v) {
        _questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._questions != null) {
      data['questions'] = this._questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int _id;
  String _lessonId;
  String _questionTitle;
  String _questionExplanation;
  String _status;
  Null _createdAt;
  Null _updatedAt;
  Null _allQuestion;
  List<QuestionAns> _questionAns;

  Questions(
      {int id,
      String lessonId,
      String questionTitle,
      String questionExplanation,
      String status,
      Null createdAt,
      Null updatedAt,
      Null allQuestion,
      List<QuestionAns> questionAns}) {
    this._id = id;
    this._lessonId = lessonId;
    this._questionTitle = questionTitle;
    this._questionExplanation = questionExplanation;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._allQuestion = allQuestion;
    this._questionAns = questionAns;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get lessonId => _lessonId;
  set lessonId(String lessonId) => _lessonId = lessonId;
  String get questionTitle => _questionTitle;
  set questionTitle(String questionTitle) => _questionTitle = questionTitle;
  String get questionExplanation => _questionExplanation;
  set questionExplanation(String questionExplanation) =>
      _questionExplanation = questionExplanation;
  String get status => _status;
  set status(String status) => _status = status;
  Null get createdAt => _createdAt;
  set createdAt(Null createdAt) => _createdAt = createdAt;
  Null get updatedAt => _updatedAt;
  set updatedAt(Null updatedAt) => _updatedAt = updatedAt;
  Null get allQuestion => _allQuestion;
  set allQuestion(Null allQuestion) => _allQuestion = allQuestion;
  List<QuestionAns> get questionAns => _questionAns;
  set questionAns(List<QuestionAns> questionAns) => _questionAns = questionAns;

  Questions.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _lessonId = json['lesson_id'];
    _questionTitle = json['question_title'];
    _questionExplanation = json['question_explanation'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _allQuestion = json['all_question'];
    if (json['question_ans'] != null) {
      _questionAns = new List<QuestionAns>();
      json['question_ans'].forEach((v) {
        _questionAns.add(new QuestionAns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['lesson_id'] = this._lessonId;
    data['question_title'] = this._questionTitle;
    data['question_explanation'] = this._questionExplanation;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['all_question'] = this._allQuestion;
    if (this._questionAns != null) {
      data['question_ans'] = this._questionAns.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionAns {
  int _id;
  String _questionId;
  String _answerText;
  String _answer;
  String _status;
  Null _createdAt;
  Null _updatedAt;

  QuestionAns(
      {int id,
      String questionId,
      String answerText,
      String answer,
      String status,
      Null createdAt,
      Null updatedAt}) {
    this._id = id;
    this._questionId = questionId;
    this._answerText = answerText;
    this._answer = answer;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get questionId => _questionId;
  set questionId(String questionId) => _questionId = questionId;
  String get answerText => _answerText;
  set answerText(String answerText) => _answerText = answerText;
  String get answer => _answer;
  set answer(String answer) => _answer = answer;
  String get status => _status;
  set status(String status) => _status = status;
  Null get createdAt => _createdAt;
  set createdAt(Null createdAt) => _createdAt = createdAt;
  Null get updatedAt => _updatedAt;
  set updatedAt(Null updatedAt) => _updatedAt = updatedAt;

  QuestionAns.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _questionId = json['question_id'];
    _answerText = json['answer_text'];
    _answer = json['answer'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['question_id'] = this._questionId;
    data['answer_text'] = this._answerText;
    data['answer'] = this._answer;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

