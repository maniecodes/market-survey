import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survey/themes/themes.dart';

class CustomPasswordfieldWidget extends StatelessWidget {
  final IconData? fontIcon;
  final IconData? prefixIcon;
  final String hintText;
  final String labelText;
  final String? initialValue;
  final bool obscureText;
  final TextEditingController controller;
//final FocusNode? currentFocusNode;
final Function()? onTap;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Function(String)? onSubmitted;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomPasswordfieldWidget(
      {Key? key,
      this.fontIcon,
      this.prefixIcon,
      required this.hintText,
      required this.labelText,
      required this.obscureText,
      required this.controller,
      this.onTap,
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
      style: Theme.of(context).textTheme.bodyText1,
      // textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      //autofillHints: [AutofillHints.organizationName],
      maxLines: 1,
      cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      enableInteractiveSelection: true,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.bodyText1,
        labelText: labelText,
        filled: false,
        hintText: hintText,

        errorText: errorText,
        // icon: Padding(
        //     padding: EdgeInsets.only(top: 15.0), child: Icon(prefixIcon)),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Themes().lightTheme.dividerColor,
            size: 20,
          ),
        ),
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
