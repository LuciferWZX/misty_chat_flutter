import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';

class NormalListItem extends StatefulWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String title ;
  final VoidCallback? onTap;
  const NormalListItem({
    Key? key,
    this.prefix,
    this.title="",
    this.suffix,
    this.onTap,
  }) : super(key: key);

  @override
  State<NormalListItem> createState() => _NormalListItemState();
}

class _NormalListItemState extends State<NormalListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child:Flex(
          direction: Axis.horizontal,
          children: [
            buildPrefix(),
            const SizedBox(width: 16),
            Expanded(
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorsUtil.hexStringColor("#001E2F")
                  ),
                )
            ),
            buildSuffix()
          ],
        ) ,
      ),
    );
  }
  Widget buildPrefix(){
    if(widget.prefix!=null){
      return widget.prefix as Widget;
    }
    return Container();
  }
  Widget buildSuffix(){
    if(widget.suffix!=null){
      return widget.suffix as Widget;
    }
    return Container();
  }
}
