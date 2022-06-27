import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Widget? icon;
  final Color backGroundColor;
  final Color textColor;
  final double radios;

  const CustomElevatedButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.icon,
    required this.backGroundColor,
    required this.textColor, this.radios =20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backGroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radios))),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              if (icon != null) icon!,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0, color: textColor),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
