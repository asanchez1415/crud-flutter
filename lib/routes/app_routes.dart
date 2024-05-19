import 'package:flutter/material.dart';
import 'package:crud_flutter/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'menu': (BuildContext context) => const MenuScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    //
    // Proveedores
    'proveedores': (BuildContext context) => const ProveedoresScreen(),
    'proveedores-opciones': (BuildContext context) =>
        const ProveedoresOpcionesScreen(),
    'proveedor-edit': (BuildContext context) => const ProveedorEditScreen(),
    'proveedor-create': (BuildContext context) => const ProveedorCreateScreen(),
    //
    // Categorias
    'categorias': (BuildContext context) => const CategoriasScreen(),
    'categorias-opciones': (BuildContext context) =>
        const CategoriasOpcionesScreen(),
    'categoria-edit': (BuildContext context) => const CategoriaEditScreen(),
    'categoria-create': (BuildContext context) =>
        const CategoriasCreateScreen(),
    //
    'productos': (BuildContext context) => const ProductosScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
