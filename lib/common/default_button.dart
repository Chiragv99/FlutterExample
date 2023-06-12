import 'package:flutter/material.dart';
import 'package:flutterapi/common/size_config.dart';

import 'my_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
    this.width,
    this.height,
    this.textSize
  }) : super(key: key);
  final String? text;
  final Function? press;
  final double? width;
  final double? height;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width!!),
      height: getProportionateScreenHeight(height!!),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(textSize!!),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
