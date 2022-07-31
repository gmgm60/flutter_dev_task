import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

// class IsPass {
//   bool isPassword = false;
//
//   IsPass();
// }

class CustomFormField extends StatefulWidget {
  final TextInputType textType;
  final bool showSuffix;
  final IconData? prefix;
  final String textLabel;
  final TextEditingController? controller;

  final bool isPassword;
  // final IsPass isPass = IsPass();
  final String? Function(String?)? validation;
  final Function(String? str)? onChanged;
  final Function(String? str)? onSaved;
  final double horizontalPadding;
  final double radius;
  final int? maxLines;
  final int? minLines;
  final String initValue;

 const CustomFormField({
    Key? key,
    required this.textLabel,
    this.showSuffix = false,
    this.prefix,
    this.controller,
    this.isPassword = false,
    required this.textType,
    required this.validation,
    this.onChanged,
    this.horizontalPadding = 25.0,
    this.radius = 20,
    this.maxLines,
    this.minLines,
    this.initValue = "",
    this.onSaved,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isPassword=false;
  @override
  void initState() {
    isPassword = widget.isPassword;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: widget.horizontalPadding,right: widget.horizontalPadding, top: 30.0),
        child: TextFormField(
          onSaved: widget.onSaved,
          initialValue: widget.initValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.textType,
          controller: widget.controller,
          obscureText: isPassword,
          validator: widget.validation,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.done,
          style: const TextStyle(color: tileTextColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: textFormBackground,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            labelText: widget.textLabel.tr(),
            alignLabelWithHint: true,
            prefixIcon: widget.prefix != null
                ? Icon(widget.prefix, color: Colors.blue)
                : null,
            suffixIcon: widget.showSuffix
                ? IconButton(
                    onPressed: () {
                      isPassword = !isPassword;
                      setState(() {});
                    },
                    icon: Icon(isPassword
                        ? Icons.visibility
                        : Icons.visibility_off))
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: textFormBackground, width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textFormBackground, width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
          ),
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines ?? 1,
        ));
  }
}
