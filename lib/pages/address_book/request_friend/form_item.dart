import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';
enum FormDirection {
  vertical,
  horizon
}
class FormItem extends StatelessWidget {
  final String? label;
  final Widget child;
  final FormDirection direction;
  const FormItem({
    Key? key, required this.child,
    this.direction=FormDirection.vertical,
    this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(direction == FormDirection.vertical){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "",
            style: TextStyle(
              color: ColorsUtil.hexStringColor("#434343")
            ),
          ),
          const SizedBox(height: 4),
          child
        ],
      );
    }
    return Container();
  }
}
