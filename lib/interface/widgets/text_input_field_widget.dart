import 'package:eds_test/interface/shared/styles.dart';
import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class TextInputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeHolder;
  final bool isContent;
  final bool isBusy;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide.none,
  );

  TextInputFieldWidget({
    Key? key,
    required this.controller,
    required this.isBusy,
    this.placeHolder = '',
    this.isContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      // overriding default blue color
      data: ThemeData(primaryColor: Theme.of(context).primaryColor),
      child: TextField(
        minLines: isContent ? 10 : 1,
        maxLines: isContent ? 25 : 2,
        style: bodyStyle,
        controller: controller,
        enabled: !isBusy,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: placeHolder,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          filled: true,
          alignLabelWithHint: true,
          focusedBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
