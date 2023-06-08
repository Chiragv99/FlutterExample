import 'package:flutter/material.dart';

class AddSequence extends StatefulWidget  {

  final String title, descriptions, text;
  final Image img;

  const AddSequence({Key? key, required this.title, required this.descriptions, required this.text, required this.img}) : super(key: key);

  @override
  _AddSequenceState createState() => _AddSequenceState();
}

class _AddSequenceState extends State<AddSequence> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: const <Widget>[
        Text("Hello"),
      ],
    );
  }

}