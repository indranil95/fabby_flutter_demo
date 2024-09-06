import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

class EditableTextWithToggle extends StatefulWidget {
  final TextEditingController controller;
  final double fontSize;
  final FontWeight fontWeight;
  final Color borderColor; // Color for the outer border
  final Color textColor; // Color for the text when typing
  final Color hintColor;
  final TextAlign textAlign;
  final int maxLines;
  final String? fontFamily;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;

  const EditableTextWithToggle({
    required this.controller,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    required this.borderColor, // Required for border color
    required this.textColor, // Required for text color
    this.hintColor = Colors.grey,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.fontFamily,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.contentPadding,
    this.onChanged,
  });

  @override
  _EditableTextWithToggleState createState() => _EditableTextWithToggleState();
}

class _EditableTextWithToggleState extends State<EditableTextWithToggle> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    if (widget.onChanged != null) {
      widget.controller.addListener(() {
        widget.onChanged!(widget.controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.textColor, // Apply black color for typing
        fontFamily: widget.fontFamily,
      ),
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      obscureText: _obscureText, // Controls whether text is obscured or not
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontFamily: widget.fontFamily,
        ),
        contentPadding: widget.contentPadding,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor), // Outer border color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor), // Outer border color when enabled
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility, // Reflect the current state
            color: widget.borderColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle password visibility
            });
          },
        ),
      ),
    );
  }
}
