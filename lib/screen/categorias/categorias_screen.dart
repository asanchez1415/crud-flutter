import 'package:crud_flutter/models/categoria.dart';
import 'package:crud_flutter/services/get_service.dart';
import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({super.key});

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  late Future<List<Categoria>> futureCategorias;

  @override
  void initState() {
    super.initState();
    futureCategorias = getCategorias('ejemplos/category_list_rest/');
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: 'Categorías',
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            width: 300,
            child: FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'categoria-create');
              },
              icon: const Icon(Icons.add),
              label: const Text(
                'Crear categoria',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: FutureBuilder<List<Categoria>>(
              future: futureCategorias,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final List<Categoria> categorias = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: categorias.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(categorias[index].categoryName),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Object categoria = categorias[index].toJson();
                        Navigator.pushNamed(context, 'categorias-opciones',
                            arguments: categoria);
                      },
                    ),
                    separatorBuilder: (_, __) => const Divider(),
                  );
                } else {
                  return const Text("No data available");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
