import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppBarWidget(
      title: 'Productos',
      body: Center(
        child: Text('ProductosScreen'),
      ),
    );
  }
}
