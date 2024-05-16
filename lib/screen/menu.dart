import 'package:flutter/material.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Módulos'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: 200,
                child: FilledButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'proveedores');
                  },
                  icon: const Icon(Icons.person_sharp),
                  label: const Text(
                    'Proveedores',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: 200,
                child: FilledButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.person_sharp),
                  label: const Text(
                    'Categorías',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                width: 200,
                child: FilledButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.person_sharp),
                  label: const Text(
                    'Productos',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
