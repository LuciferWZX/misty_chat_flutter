import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

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
      child: const Center(
        child: TextField(
            decoration: InputDecoration(
                // isCollapsed: true,
                // contentPadding: EdgeInsets.only( left: 20,right: 20),
                hintText: "搜索",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search)
            )
        ),
      ),
    );
  }
}
