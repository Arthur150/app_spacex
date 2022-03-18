import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
  }

  Future<Response<List<dynamic>>> getAllUpcomingLaunches() async =>
      await dio.get<List<dynamic>>("/launches/upcoming");

  Future<Response<List<dynamic>>> getAllPastLaunches() async =>
      await dio.get<List<dynamic>>("/launches/past");

  Future<Response<Map<String, dynamic>>> getCompanyInfo() async =>
      await dio.get<Map<String, dynamic>>("/company");

  Future<Response<Map<String, dynamic>>> getLaunchpad(String id) async =>
      await dio.get<Map<String, dynamic>>("/launchpads/$id");
}
