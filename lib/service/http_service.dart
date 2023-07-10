// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart';
import 'model/emp_response.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  /* Http Apis*/
  static String API_LIST = "/api/v1/employees";
  static String API_GET = "/api/v1/employee/";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  /* Http Requests*/
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 202) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

/* Http Response*/
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(EmpResponse tost) {
    Map<String, String> params = {};
    params.addAll({
      'status': tost.status ?? "",
      'body': tost.data.toString(),
      'userId': tost.message.toString(),
    });
    return params;
  }

  static Map<String, dynamic> paramsUpdate(EmpResponse tost) {
    Map<String, dynamic> params = {};
    params.addAll({
      'status': tost.status ?? "",
      'body': tost.data ?? [],
      'userId': tost.message.toString(),
    });
    return params;
  }

/* Http Parsing*/
  static EmpResponse parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = EmpResponse.fromJson(json);
    return data;
  }
}
