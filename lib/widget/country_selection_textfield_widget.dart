
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import  'package:flutterapi/common/my_colors.dart';


class CountrySelectionTextField extends StatefulWidget {
  final TextEditingController myController;
  FocusNode myFocusNode;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final EdgeInsetsGeometry myMargin;
  final Function(String) onChanged;
  final Function(String) onSubmited;

  CountrySelectionTextField({
    required this.myController,
    required this.myFocusNode,
    this.myMargin = const EdgeInsets.all(0),
    required this.hintText,
    this.inputType = TextInputType.number,
    this.inputAction = TextInputAction.done,
    required this.onChanged,
    required this.onSubmited,
  });

  @override
  _CountrySelectionTextFieldState createState() =>
      _CountrySelectionTextFieldState();
}

class _CountrySelectionTextFieldState extends State<CountrySelectionTextField> {

  @override
  void dispose() {
//    widget.myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.myMargin,
      height: 52,
      decoration: BoxDecoration(
        color: kShareCodeBg,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 4,
          bottom: 4,
        ),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _openCountryPickerDialog();
                  },
                  child: Row(
                    children: const <Widget>[

                  SizedBox(
                    width: 5,
                  ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: Opacity(
                opacity: 0.64,
                child: TextField(
                  maxLength: 12,
                  autofocus: false,
                  controller: widget.myController,
                  focusNode:
                      widget.myFocusNode,
                  keyboardType: TextInputType.number,
                  textInputAction: widget.inputAction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    fillColor: Colors.grey,
                    counterText: "",
                  ),
                  onChanged: (str) {
                    widget.onChanged(str);
                  },
                  onSubmitted: (str) {
                    widget.onSubmited(str);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openCountryPickerDialog() => const Text("data");

}
