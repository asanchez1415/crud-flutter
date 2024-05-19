import 'package:crud_flutter/services/post_service.dart';
import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProductosOpcionesScreen extends StatelessWidget {
  const ProductosOpcionesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return AppBarWidget(
      title: 'Opciones productos',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    child: Image.network(arguments['product_image']),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nombre',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Flexible(
                    child: Text(
                  arguments['product_name'],
                  style: const TextStyle(fontSize: 20),
                ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Precio',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  '\$ ${arguments['product_price'].toString()}',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      Object data = {
                        'product_id': arguments['product_id'],
                      };
                      postService('ejemplos/product_del_rest/', data, context,
                          'productos');
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text(
                      'Eliminar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: FilledButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'producto-edit',
                          arguments: arguments);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text(
                      'Editar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
