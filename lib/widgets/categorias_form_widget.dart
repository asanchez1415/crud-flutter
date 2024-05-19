import 'package:crud_flutter/services/post_service.dart';
import 'package:flutter/material.dart';

class CategoriasFormWidget extends StatelessWidget {
  final TextEditingController controllerName;
  final arguments;
  final String type;

  const CategoriasFormWidget(
      {super.key,
      required this.arguments,
      required this.controllerName,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // readOnly: true,
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
                  "category_name": controllerName.text,
                };
                postService(
                    'ejemplos/category_add_rest/', data, context, 'categorias');
              } else if (type == 'edit') {
                Object data = {
                  "category_id": arguments['category_id'],
                  "category_name": controllerName.text,
                  "category_state": arguments['category_state'],
                };
                postService('ejemplos/category_edit_rest/', data, context,
                    'categorias');
              }
            },
            child: Text(type == 'create' ? 'Crear' : 'Editar'),
          ),
        ),
      ],
    );
  }
}
