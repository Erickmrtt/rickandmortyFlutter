import 'package:flutter/material.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: const Center(
        child: Text('Locations'),
      ),
    );
  }
}