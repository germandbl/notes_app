import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.alignLabelWithHint,
    required this.labelText,
    required this.maxLength,
    required this.maxLines,
    required this.textInputType,
    required this.inputController,
    required this.inputFocusNode,
  });

  final bool alignLabelWithHint;
  final String labelText;
  final int maxLength;
  final int maxLines;
  final TextInputType textInputType;
  final TextEditingController inputController;
  final FocusNode inputFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: textInputType,
      onTapOutside: (event) {
        inputFocusNode.unfocus();
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Por favor ingresa un titulo";
        }
        return null;
      },
      focusNode: inputFocusNode,
      controller: inputController,
      decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: alignLabelWithHint,
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
