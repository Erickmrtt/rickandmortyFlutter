import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GenericTextfield<T> extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final T? store;
  const GenericTextfield({
    super.key,
    this.labelText,
    this.errorText,
    this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return TextField(
          onChanged: (value) => store,
          decoration: InputDecoration(
            labelText: labelText ?? 'Enter your username',
            errorText: errorText ?? 'Error on input text',
          ),
        );
      },
    );
  }
}
