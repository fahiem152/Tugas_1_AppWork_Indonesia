// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class TextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String pleaceholder;

  TextInputWidget({
    Key? key,
    required this.controller,
    required this.pleaceholder,
  }) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.pleaceholder,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
            )),
      ),
    );
  }
}
