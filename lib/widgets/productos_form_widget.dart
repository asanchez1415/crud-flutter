import 'package:crud_flutter/services/post_service.dart';
import 'package:flutter/material.dart';

class ProductosFormWidget extends StatelessWidget {
  final TextEditingController controllerName,
      controllerPrice,
      controllerUrlImage;
  final arguments;
  final String type;

  const ProductosFormWidget(
      {super.key,
      required this.arguments,
      required this.controllerName,
      required this.controllerPrice,
      required this.controllerUrlImage,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllerName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ingrese un nombre",
          ),
          onChanged: (val) {
            controllerName.text = val;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: controllerPrice,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ingrese un precio",
          ),
          onChanged: (val) {
            controllerPrice.text = val;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: controllerUrlImage,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ingrese una url para la imagen",
          ),
          onChanged: (val) {
            controllerUrlImage.text = val;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: 100,
          child: FilledButton(
            onPressed: () {
              if (type == 'create') {
                Object data = {
                  "product_name": controllerName.text,
                  "product_price": int.parse(controllerPrice.text),
                  "product_image": controllerUrlImage.text,
                };
                postService(
                    'ejemplos/product_add_rest/', data, context, 'productos');
              } else if (type == 'edit') {
                Object data = {
                  "product_id": arguments['product_id'],
                  "product_name": controllerName.text,
                  "product_price": int.parse(controllerPrice.text),
                  "product_image": controllerUrlImage.text,
                  "product_state": arguments['product_state'],
                };
                postService(
                    'ejemplos/product_edit_rest/', data, context, 'productos');
              }
            },
            child: Text(type == 'create' ? 'Crear' : 'Editar'),
          ),
        ),
      ],
    );
  }
}
