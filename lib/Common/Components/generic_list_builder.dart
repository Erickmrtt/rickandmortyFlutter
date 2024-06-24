import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericListBuilder<T> extends StatelessWidget {
  final List<T> data;
  final Widget Function(BuildContext, T) itemBuilder;
  const GenericListBuilder(
      {super.key, required this.data, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return itemBuilder(context, data[index]);
          },
        );
      },
    );
  }
}

class ExampleCallListGeneric extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> myStringList = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Generic List Builder Example Call'),
        ),
        body: GenericListBuilder<String>(
          //  Use the GenericListBuilder
          data: myStringList,
          itemBuilder: (context, item) {
            // Define how each item should be built
            return ListTile(
              title: Text(item),
            );
          },
        ),
      ),
    );
  }
}
