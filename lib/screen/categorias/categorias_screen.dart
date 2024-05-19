import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppBarWidget(
      title: 'Categorias',
      body: Center(
        child: Text('CategoriasScreen'),
      ),
    );
  }
}
