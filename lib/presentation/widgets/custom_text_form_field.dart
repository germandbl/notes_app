import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.alignLabelWithHint,
    required this.inputController,
    required this.inputFocusNode,
    required this.labelText,
    required this.maxLength,
    required this.maxLines,
    required this.textInputType,
    required this.validator,
    this.onChanged,
  });

  final bool alignLabelWithHint;
  final TextEditingController inputController;
  final FocusNode inputFocusNode;
  final String labelText;
  final int maxLength;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      keyboardType: textInputType,
      onTapOutside: (event) {
        inputFocusNode.unfocus();
      },
      validator: validator,
      onChanged: onChanged,
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
