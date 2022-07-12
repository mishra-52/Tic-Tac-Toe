import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actiontext;
  CustomDialog(this.title,this.content,this.callback,[this.actiontext="Reset"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          color: Colors.white,
          onPressed: callback,
          child: Text(actiontext),
        ),
      ],
    );
  }
}
