import 'package:crud_flutter/models/productos.dart';
import 'package:crud_flutter/services/get_service.dart';
import 'package:crud_flutter/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  late Future<List<Producto>> futureProductos;

  @override
  void initState() {
    super.initState();
    futureProductos = getProductos('ejemplos/product_list_rest/');
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: 'Productos',
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
                Navigator.pushNamed(context, 'producto-create');
              },
              icon: const Icon(Icons.add),
              label: const Text(
                'Crear producto',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: FutureBuilder<List<Producto>>(
              future: futureProductos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final List<Producto> productos = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: productos.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text(productos[index].productName),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Object producto = productos[index].toJson();
                        Navigator.pushNamed(context, 'productos-opciones',
                            arguments: producto);
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
