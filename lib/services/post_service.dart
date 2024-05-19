import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> postService(
    String url, Object data, context, String redirect) async {
  const String apiUser = 'test';
  const String apiPass = 'test2023';
  const String baseUrl = '143.198.118.203:8050';

  var urlFormat = Uri.http(baseUrl, url);
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$apiUser:$apiPass'))}';

  final response = await http.post(
    urlFormat,
    headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    String message = jsonDecode(response.body)['MSJ'];
    final snackBar = SnackBar(content: Text(message.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pushNamed(context, redirect);
  } else {
    const snackBar = SnackBar(content: Text('Ha ocurrido un error'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
