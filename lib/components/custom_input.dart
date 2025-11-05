import 'package:flutter/material.dart';
import 'package:tecnic_test_bloc_open_api/services/configuration/styles/text_styles.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final bool readOnly;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomInputField({
    super.key,
    required this.label,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStylesCustom.normalText(fontWeightC: FontWeight.bold),
        border: const OutlineInputBorder(),
      ),
      style: TextStylesCustom.normalText(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'El campo "$label" no puede estar vacío';
        }
        return null;
      },
    );
  }
}
