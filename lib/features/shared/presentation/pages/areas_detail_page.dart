import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AreasDetailsPage extends StatelessWidget {
  const AreasDetailsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.cloud_download))
        ],
      ),
      body: const Center(child: Text('Hola Mundo')),
    );
  }
}
