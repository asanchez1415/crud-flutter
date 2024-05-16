import 'package:crud_flutter/models/proveedor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Proveedor>> getData(String url) async {
  const String apiUser = 'test';
  const String apiPass = 'test2023';
  const String baseUrl = '143.198.118.203:8050';

  var urlFormat = Uri.http(baseUrl, url);
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$apiUser:$apiPass'))}';

  final response =
      await http.get(urlFormat, headers: {'authorization': basicAuth});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final List body = json.decode(response.body)['Proveedores Listado'];
    return body.map((e) => Proveedor.fromJson(e)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the information');
  }
}
