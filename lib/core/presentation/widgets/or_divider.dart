import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            ),
          ),
        ),
        Text(LocaleKeys.or.tr()),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.black26,
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
