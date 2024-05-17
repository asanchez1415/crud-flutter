import 'dart:convert';

import 'package:crud_flutter/models/proveedor.dart';
import 'package:crud_flutter/services/get_service.dart';
import 'package:flutter/material.dart';

class ProveedoresScreen extends StatefulWidget {
  const ProveedoresScreen({super.key});

  @override
  State<ProveedoresScreen> createState() => _ProveedoresScreenState();
}

class _ProveedoresScreenState extends State<ProveedoresScreen> {
  late Future<List<Proveedor>> futureProveedores;

  @override
  void initState() {
    super.initState();
    futureProveedores = getData('ejemplos/provider_list_rest/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
      ),
      body: Center(
        child: FutureBuilder<List<Proveedor>>(
          future: futureProveedores,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final List<Proveedor> proveedores = snapshot.data!;

              return ListView.separated(
                itemCount: proveedores.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(proveedores[index].providerName),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Object proveedor = proveedores[index].toJson();
                    Navigator.pushNamed(context, 'proveedor-detail-edit',
                        arguments: proveedor);
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
    );
  }
}
