import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:crud_flutter/widgets/proveedores/proveedores_form_widget.dart';
import 'package:flutter/material.dart';

class ProveedorCreateScreen extends StatefulWidget {
  const ProveedorCreateScreen({super.key});

  @override
  State<ProveedorCreateScreen> createState() => _ProveedorCreateScreenState();
}

class _ProveedorCreateScreenState extends State<ProveedorCreateScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    TextEditingController controllerName =
        TextEditingController(text: arguments['provider_name']);
    TextEditingController controllerLastName =
        TextEditingController(text: arguments['provider_last_name']);
    TextEditingController controllerMail =
        TextEditingController(text: arguments['provider_mail']);

    return AppBarWidget(
      title: 'Crear proveedor',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            ProveedoresFormWidget(
                controllerName: controllerName,
                controllerLastName: controllerLastName,
                controllerMail: controllerMail,
                arguments: arguments,
                type: 'create')
          ],
        ),
      ),
    );
  }
}
