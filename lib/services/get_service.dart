import 'package:crud_flutter/models/categoria.dart';
import 'package:crud_flutter/models/productos.dart';
import 'package:crud_flutter/models/proveedor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUser = 'test';
const String apiPass = 'test2023';
const String baseUrl = '143.198.118.203:8050';
String basicAuth = 'Basic ${base64Encode(utf8.encode('$apiUser:$apiPass'))}';

Future<List<Proveedor>> getProveedores(String url) async {
  var urlFormat = Uri.http(baseUrl, url);
  final response =
      await http.get(urlFormat, headers: {'authorization': basicAuth});

  if (response.statusCode == 200) {
    final List body = json.decode(response.body)['Proveedores Listado'];
    return body.map((e) => Proveedor.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load the information');
  }
}

// -----------------------------------------------------------------------------------
Future<List<Categoria>> getCategorias(String url) async {
  var urlFormat = Uri.http(baseUrl, url);
  final response =
      await http.get(urlFormat, headers: {'authorization': basicAuth});

  if (response.statusCode == 200) {
    final List body = json.decode(response.body)['Listado Categorias'];
    return body.map((e) => Categoria.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load the information');
  }
}

// -----------------------------------------------------------------------------------
Future<List<Producto>> getProductos(String url) async {
  var urlFormat = Uri.http(baseUrl, url);
  final response =
      await http.get(urlFormat, headers: {'authorization': basicAuth});

  if (response.statusCode == 200) {
    final List body = json.decode(response.body)['Listado'];
    return body.map((e) => Producto.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load the information');
  }
}
