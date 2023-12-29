import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String btnText;

  const CustomButton({super.key,
    required this.onTap,
    required this.btnText
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        padding: const EdgeInsets.all(10),
        decoration:  BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
          child: Text(btnText,
            style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
          ),
      ),
    );
  }
}
