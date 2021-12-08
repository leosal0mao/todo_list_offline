import 'package:flutter/material.dart';

class TextfieldButtonWidget extends StatelessWidget {
  final TextEditingController controller;
  final Icon icon;
  final VoidCallback onPressed;
  final bool? enableInteractiveSelection;
  final String? hintText;
  const TextfieldButtonWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.onPressed,
    this.enableInteractiveSelection,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        hintText: hintText ?? 'Enter a message',
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
