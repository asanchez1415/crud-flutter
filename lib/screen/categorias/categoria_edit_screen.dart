import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:crud_flutter/widgets/categorias_form_widget.dart';
import 'package:flutter/material.dart';

class CategoriaEditScreen extends StatefulWidget {
  const CategoriaEditScreen({super.key});

  @override
  State<CategoriaEditScreen> createState() => _CategoriaEditScreenState();
}

class _CategoriaEditScreenState extends State<CategoriaEditScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    TextEditingController controllerName =
        TextEditingController(text: arguments['category_name']);

    return AppBarWidget(
      title: 'Editar categoría',
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            CategoriasFormWidget(
              controllerName: controllerName,
              arguments: arguments,
              type: 'edit',
            )
          ],
        ),
      ),
    );
  }
}
