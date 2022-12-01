import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FriendListItem extends StatelessWidget {
  final String avatar;
  final String nickname;
  final String desc;
  final String username;
  final bool showDivider;
  final Widget? action;
  const FriendListItem({
    Key? key,
    required this.avatar,
    required this.nickname,
    required this.desc,
    required this.username,
    this.showDivider=false,
    this.action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GFAvatar(
                  size: 50,
                  backgroundImage:NetworkImage(avatar),
                  shape: GFAvatarShape.standard
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10,
                        right: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            nickname,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                              fontSize: 18
                            )
                        ),
                        Text(
                            "账号：$username",
                            style: TextStyle(
                              fontSize: 14,
                            )
                        ),
                        Text(
                            desc,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey
                            )
                        ),
                      ],
                    ),
                  )
              ),
              action ?? Container()
            ],
          ),
        )
      ],
    );
  }
}
