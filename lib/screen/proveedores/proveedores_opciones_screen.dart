import 'package:crud_flutter/services/post_service.dart';
import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProveedoresOpcionesScreen extends StatelessWidget {
  const ProveedoresOpcionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return AppBarWidget(
      title: 'Opciones proveedor',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nombre',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  arguments['provider_name'],
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Apellido',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  arguments['provider_last_name'],
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  arguments['provider_mail'],
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                        'provider_id': arguments['providerid'],
                      };
                      postService('ejemplos/provider_del_rest/', data, context);
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
                      // Object proveedor = proveedores[index].toJson();
                      Navigator.pushNamed(context, 'proveedor-edit',
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
