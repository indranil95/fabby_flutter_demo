import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

class NonEditableDropdownTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> items; // Dropdown items
  final String? hintText; // Optional hint text
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color hintColor;
  final String? fontFamily;
  final TextAlign textAlign;
  final Color? backgroundColor;
  final double borderWidth; // Border width
  final EdgeInsetsGeometry? contentPadding; // Padding for the text field
  final void Function(String)? onChanged; // Callback for text changes
  final Color borderColor; // New parameter for border color

  const NonEditableDropdownTextField({
    super.key,
    required this.controller,
    required this.items,
    this.hintText,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.normal,
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.fontFamily,
    this.textAlign = TextAlign.start,
    this.backgroundColor,
    this.borderWidth = 1.0,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Reduce vertical padding here
    this.onChanged,
    this.borderColor = Colors.black, // Default border color
  });

  @override
  _NonEditableDropdownTextFieldState createState() => _NonEditableDropdownTextFieldState();
}

class _NonEditableDropdownTextFieldState extends State<NonEditableDropdownTextField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show the dropdown on tap
        _showDropdown(context);
      },
      child: AbsorbPointer(
        // Disable direct input in the TextField
        child: TextField(
          controller: widget.controller,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.textColor,
            fontFamily: widget.fontFamily,
          ),
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: widget.hintColor,
              fontFamily: widget.fontFamily,
            ),
            filled: widget.backgroundColor != null,
            fillColor: widget.backgroundColor, // Set background color
            contentPadding: widget.contentPadding, // Reduced padding for smaller height
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor.withOpacity(0.8), // Border color set to the provided color
                width: widget.borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor.withOpacity(0.8), // Border when focused
                width: widget.borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor.withOpacity(0.8), // Border when enabled
                width: widget.borderWidth,
              ),
            ),
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) async {
    // Show a dropdown menu dialog and get the selected value
    final newValue = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: widget.items.map((String item) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, item);
              },
              child: Text(item),
            );
          }).toList(),
        );
      },
    );

    if (newValue != null && newValue != selectedValue) {
      setState(() {
        selectedValue = newValue;
        widget.controller.text = newValue; // Set the TextField value
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      });
    }
  }
}
