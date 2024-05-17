import 'package:crud_flutter/widgets/proveedores/proveedores_form_widget.dart';
import 'package:flutter/material.dart';

class ProveedorDetailEditScreen extends StatefulWidget {
  const ProveedorDetailEditScreen({super.key});

  @override
  State<ProveedorDetailEditScreen> createState() =>
      _ProveedorDetailEditScreenState();
}

class _ProveedorDetailEditScreenState extends State<ProveedorDetailEditScreen> {
  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print
    print("initState Called");
  }

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del proveedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            ProveedoresFormWidget(
              controllerName: controllerName,
              controllerLastName: controllerLastName,
              controllerMail: controllerMail,
            )
          ],
        ),
      ),
    );
  }
}
