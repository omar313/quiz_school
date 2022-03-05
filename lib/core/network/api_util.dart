import 'package:dio/dio.dart';

class ApiUtil{
  final dio = Dio();

  ApiUtil(){
    // String proxy = 'https://cors-anywhere.herokuapp.com/';
    dio.options.baseUrl = 'http://quizapp.ishou.tokyo/api/';
    dio.options.responseType = ResponseType.plain;
    
  }
  

}