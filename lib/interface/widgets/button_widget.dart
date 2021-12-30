
import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  const ButtonWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: basePadding,
      margin: basePadding,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: FittedBox(
          child: TextWiget.headline2(label),
        ),
      ),
    );
  }
}
