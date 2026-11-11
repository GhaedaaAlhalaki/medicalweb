// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:medical_web/constants.dart';

class CustomTextF extends StatefulWidget {
  const CustomTextF({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });
  final TextEditingController? controller;
  final String label;
  final String hint;

  @override
  State<CustomTextF> createState() => _CustomTextFState();
}

class _CustomTextFState extends State<CustomTextF> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            labelText: widget.label,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
