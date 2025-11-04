import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tecnic_test_bloc_open_api/services/configuration/envs/main.dart';

class ApiMethod {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<bool> removeContentType() async {
    headers.remove('Content-Type');
    return true;
  }

  Future<http.Response> apiPost(
      {required Map<String, String>? body, required String request}) async {
    http.Response response = await http.post(
        Uri.https(APIconfig.conection, "${APIconfig.segment}$request"),
        headers: headers,
        body: body,
        encoding: Encoding.getByName("UTF-8"));
    return response;
  }

  Future<http.Response> apiPut(
      {required Map<String, dynamic> body, required String request}) async {
    http.Response response = await http.put(
        Uri.https(APIconfig.conection, "${APIconfig.segment}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    return response;
  }

  Future<http.Response> apiPatch(
      {required Map<String, dynamic> body, required String request}) async {
    http.Response response = await http.patch(
        Uri.https(APIconfig.conection, "${APIconfig.segment}$request"),
        headers: headers,
        body: jsonEncode(body),
        encoding: Encoding.getByName("UTF-8"));
    return response;
  }

  Future<http.Response> apiGet(
      {Map<String, String>? queryParams, required String request}) async {
    http.Response response = await http.get(
      Uri.https(
          APIconfig.conection, "${APIconfig.segment}$request", queryParams),
      headers: headers,
    );
    return response;
  }
}
