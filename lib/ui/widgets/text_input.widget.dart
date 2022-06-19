import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(this.label, this.controller, {Key? key}) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            fontSize: 22,
          )),
    );
  }
}
