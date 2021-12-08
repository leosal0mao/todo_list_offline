import 'package:flutter/material.dart';

class BottomButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const BottomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Material(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
