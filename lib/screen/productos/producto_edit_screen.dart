import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:crud_flutter/widgets/productos_form_widget.dart';
import 'package:flutter/material.dart';

class ProductoEditScreen extends StatefulWidget {
  const ProductoEditScreen({super.key});

  @override
  State<ProductoEditScreen> createState() => _ProductoEditScreenState();
}

class _ProductoEditScreenState extends State<ProductoEditScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    TextEditingController controllerName =
        TextEditingController(text: arguments['product_name']);
    TextEditingController controllerPrice =
        TextEditingController(text: arguments['product_price'].toString());
    TextEditingController controllerUrlImage =
        TextEditingController(text: arguments['product_image']);

    return AppBarWidget(
      title: 'Editar producto',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            ProductosFormWidget(
              controllerName: controllerName,
              controllerPrice: controllerPrice,
              controllerUrlImage: controllerUrlImage,
              arguments: arguments,
              type: 'edit',
            )
          ],
        ),
      ),
    );
  }
}
