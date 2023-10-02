import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AreasDetailsPage extends StatelessWidget {
  const AreasDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Hola Mundo')),
    );
  }
}
