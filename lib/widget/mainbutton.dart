import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/size_config.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onCountSelected;

  MainButton({
    required this.onCountSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(onPressed:  onCountSelected, child:  Text(
        "Submit",
        style: TextStyle(
          fontSize: getProportionateScreenWidth(18),
          color: Colors.white,
        ),
      )),
    );

  }
}