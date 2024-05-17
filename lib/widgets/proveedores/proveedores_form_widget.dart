import 'package:flutter/material.dart';

class ProveedoresFormWidget extends StatelessWidget {
  TextEditingController controllerName, controllerLastName, controllerMail;

  ProveedoresFormWidget(
      {super.key,
      required this.controllerLastName,
      required this.controllerName,
      required this.controllerMail});

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
        FilledButton(
          onPressed: () {
            // print(controllerName.text);
          },
          child: Text('Editar'),
        ),
      ],
    );
  }
}
