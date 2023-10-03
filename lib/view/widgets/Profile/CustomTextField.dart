import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController nameController, required this.title,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(labelText: title),
      ),
    );
  }
}