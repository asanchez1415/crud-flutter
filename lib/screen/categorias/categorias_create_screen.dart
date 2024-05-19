import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:crud_flutter/widgets/categorias_form_widget.dart';
import 'package:flutter/material.dart';

class CategoriasCreateScreen extends StatefulWidget {
  const CategoriasCreateScreen({super.key});

  @override
  State<CategoriasCreateScreen> createState() => _CategoriasCreateScreenState();
}

class _CategoriasCreateScreenState extends State<CategoriasCreateScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    TextEditingController controllerName =
        TextEditingController(text: arguments['provider_name']);

    return AppBarWidget(
      title: 'Crear categoría',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            CategoriasFormWidget(
                controllerName: controllerName,
                arguments: arguments,
                type: 'create')
          ],
        ),
      ),
    );
  }
}
