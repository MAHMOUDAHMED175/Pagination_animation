









import 'package:dio/dio.dart';

class DioHelper{


  static late Dio dio;

  static Init(){
    dio=Dio(
       BaseOptions(
         baseUrl: 'http://api.aladhan.com/v1',
         receiveDataWhenStatusError: true,
       )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang='ar',
  })async{
    return await dio.get(
      url,
      queryParameters: query,
    );
  }



}