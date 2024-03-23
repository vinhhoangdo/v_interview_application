import 'package:flutter/material.dart';

class IAInputField extends StatefulWidget {
  const IAInputField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.prefixIcon,
    this.obscureText = false,
    this.disableTouch = false,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final String label;
  final bool obscureText;
  final bool disableTouch;

  @override
  State<IAInputField> createState() => _IAInputFieldState();
}

class _IAInputFieldState extends State<IAInputField> {


  TextEditingController get _controller => widget.controller;

  String? Function(String?)? get _validation => widget.validator;

  IconData get _prefixIcon => widget.prefixIcon ?? Icons.email;

  String get _label => widget.label;

  bool get _obscureText => widget.obscureText;

  bool get _disableTouch => widget.disableTouch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: _validation,
      obscureText: _obscureText,
      enabled: !_disableTouch,
      decoration: InputDecoration(
        prefixIcon: Icon(
          _prefixIcon,
          color: Theme.of(context).iconTheme.color,
        ),
        labelText: _label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
