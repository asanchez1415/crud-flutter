import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:crud_flutter/widgets/proveedores_form_widget.dart';
import 'package:flutter/material.dart';

class ProveedorEditScreen extends StatefulWidget {
  const ProveedorEditScreen({super.key});

  @override
  State<ProveedorEditScreen> createState() => _ProveedorEditScreenState();
}

class _ProveedorEditScreenState extends State<ProveedorEditScreen> {
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
      title: 'Editar proveedor',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            ProveedoresFormWidget(
              controllerName: controllerName,
              controllerLastName: controllerLastName,
              controllerMail: controllerMail,
              arguments: arguments,
              type: 'edit',
            )
          ],
        ),
      ),
    );
  }
}
