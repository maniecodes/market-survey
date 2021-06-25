import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final IconData? fontIcon;
  final IconData? prefixIcon;
  final String hintText;
  final String labelText;
  final String? initialValue;
  // final bool obscureText;
  final TextEditingController controller;
//final FocusNode? currentFocusNode;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Function(String)? onSubmitted;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextfieldWidget(
      {Key? key,
      this.fontIcon,
      this.prefixIcon,
      required this.hintText,
      required this.labelText,
      // required this.obscureText,
      required this.controller,
      this.initialValue,
      //   required this.currentFocusNode,
      this.onChanged,
      this.onSaved,
      this.onSubmitted,
      this.errorText,
      this.validator,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //  focusNode: currentFocusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.headline5,

      // textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      //autofillHints: [AutofillHints.organizationName],
      maxLines: 1,
      cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      enableInteractiveSelection: true,
      // obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyText2,
        labelText: labelText,
        filled: false,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subtitle1,
        errorText: errorText,
        errorStyle: Theme.of(context).textTheme.subtitle2,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
