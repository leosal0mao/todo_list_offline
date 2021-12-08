import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController textController;
  final int? maxLines;
  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    this.hintText,
    required this.textController,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      maxLines: maxLines ?? 5,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        hintText: hintText ?? '',
      ),
    );
  }
}
