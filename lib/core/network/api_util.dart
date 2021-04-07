import 'package:dio/dio.dart';

class ApiUtil{
  final dio = Dio();

  ApiUtil(){
    // String proxy = 'https://cors-anywhere.herokuapp.com/';
    dio.options.baseUrl = 'https://api.dentistaa.com/api/';
    dio.options.responseType = ResponseType.plain;
    
  }
  

}