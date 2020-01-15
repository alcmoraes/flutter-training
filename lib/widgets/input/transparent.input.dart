import 'package:flutter/material.dart';

class TransparentInput extends StatefulWidget {
  TransparentInput({
    Key key,
    @required this.onChanged,
    this.label,
    this.placeholder,
    this.validator,
    this.controller,
    this.focus = false,
    this.obscure = false
  }) : super(key: key);

  final bool obscure;
  final String label;
  final bool focus;
  final Function onChanged;
  final String placeholder;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  _TransparentInputState createState() => _TransparentInputState();
}

class _TransparentInputState extends State<TransparentInput> {

  bool _obscureToggle = false;

  void _toggleObscureInput(){
    setState((){
      _obscureToggle = !_obscureToggle;
    });
  }

  @override
  initState() {
    super.initState();
    setState(() {
      _obscureToggle = widget.obscure ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autofocus: widget.focus ?? false,
      onChanged: widget.onChanged,
      obscureText: _obscureToggle,
      style: TextStyle(
        fontSize: 20
      ),
      decoration: InputDecoration(
        suffixIcon: widget.obscure ? IconButton(
          icon: Icon(_obscureToggle ? Icons.visibility : Icons.visibility_off),
          onPressed: this._toggleObscureInput
        ) : null,
        hintStyle: TextStyle(color: Color.fromARGB(100, 100, 100, 100)),
        labelStyle: TextStyle(
          fontFamily: "Oswald",
          fontSize: 16,
        ),
        labelText: widget.label ?? null,
        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        hintText: widget.placeholder ?? widget.label ?? null,
      ),
    );
  }
}