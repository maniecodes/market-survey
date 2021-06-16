import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final Function()? onPressed;

  const CustomButtonWidget({Key? key, required this.buttonName, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
