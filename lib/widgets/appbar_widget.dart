import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final Widget body;

  const AppBarWidget({super.key, required this.title, required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'menu',
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: body,
    );
  }
}
