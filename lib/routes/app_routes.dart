import 'package:flutter/material.dart';
import 'package:crud_flutter/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    // Proveedores
    'proveedores': (BuildContext context) => const ProveedoresScreen(),
    'proveedor-detail-edit': (BuildContext context) =>
        const ProveedorDetailEditScreen(),
    //
    'categorias': (BuildContext context) => const CategoriasScreen(),
    //
    'productos': (BuildContext context) => const ProductosScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
