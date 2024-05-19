import 'package:crud_flutter/services/post_service.dart';
import 'package:flutter/material.dart';

class ProveedoresFormWidget extends StatelessWidget {
  final TextEditingController controllerName,
      controllerLastName,
      controllerMail;
  final arguments;
  final String type;

  const ProveedoresFormWidget(
      {super.key,
      required this.arguments,
      required this.controllerLastName,
      required this.controllerName,
      required this.controllerMail,
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
        TextFormField(
          controller: controllerLastName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ingrese un apellido",
          ),
          onChanged: (val) {
            controllerLastName.text = val;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: controllerMail,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Ingrese un email",
          ),
          onChanged: (val) {
            controllerMail.text = val;
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
                  "provider_name": controllerName.text,
                  "provider_last_name": controllerLastName.text,
                  "provider_mail": controllerMail.text,
                  "provider_state": 'Activo',
                };
                postService('ejemplos/provider_add_rest/', data, context,
                    'proveedores');
              } else if (type == 'edit') {
                Object data = {
                  "provider_id": arguments['providerid'],
                  "provider_name": controllerName.text,
                  "provider_last_name": controllerLastName.text,
                  "provider_mail": controllerMail.text,
                  "provider_state": arguments['provider_state'],
                };
                postService('ejemplos/provider_edit_rest/', data, context,
                    'proveedores');
              }
            },
            child: Text(type == 'create' ? 'Crear' : 'Editar'),
          ),
        ),
      ],
    );
  }
}
