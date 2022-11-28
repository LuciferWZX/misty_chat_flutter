import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';

class SearchInput extends StatefulWidget {
  final GestureTapCallback? onTap;
  final bool autoFocus;
  final bool enabled;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  const SearchInput({Key? key,this.onTap, this.focusNode, this.autoFocus = false,this.enabled = true, this.textEditingController}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 5,right: 5),
      decoration: BoxDecoration(
          color: ColorsUtil.hexStringColor("#EFF1F8"),
          borderRadius: const BorderRadius.all(Radius.circular(32))
      ),
      child: Center(
        child: GestureDetector(
          onTap: widget.onTap,
          child: TextField(
            controller: widget.textEditingController,
              enabled: widget.enabled,
              focusNode: widget.focusNode,
              autofocus: widget.autoFocus,
              decoration:const InputDecoration(
                // isCollapsed: true,
                // contentPadding: EdgeInsets.only( left: 20,right: 20),
                  hintText: "搜索",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search)
              )
          ),
        ),
      ),
    );
  }
}
