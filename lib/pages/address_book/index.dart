import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/entities/contact_user.dart';
import 'package:misty_chat/pages/address_book/contact.dart';
import 'package:misty_chat/routes/index.dart';

import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/normal_list_item/index.dart';
import 'package:misty_chat/widgets/search_input/index.dart';

class AddressBookPage extends StatefulWidget {
  const AddressBookPage({Key? key}) : super(key: key);

  @override
  State<AddressBookPage> createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    focusNode.unfocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {

    ContactUser user1 = ContactUser(
        id: "55a5e776-2a49-433e-b6a3-43cdd6b8ecb2",
        email: "admin2@qq.com",
        avatar: "https://img2.baidu.com/it/u=3064904053,3191769934&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1669395600&t=e37c1279968e38084b5c2fde1b5dc939",
        phone: "15295747481",
        nickname: "admin2",
        username: "admin2",
        authority: 0,
        sex: 2,
        banned: false
    );
    ContactUser user2 = ContactUser(
        id: "6cca9f32-74cc-4f77-ae2a-b917f747061b",
        email: "admin4@qq.com",
        avatar: "https://img2.baidu.com/it/u=3064904053,3191769934&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1669395600&t=e37c1279968e38084b5c2fde1b5dc939",
        phone: "15295747484",
        nickname: "いいadmin4",
        username: "admin4",
        authority: 0,
        sex: 2,
        banned: false
    );
    ContactUser user3 = ContactUser(
        id: "82478f2c-ec14-4a81-94fc-9c316b67fda6",
        email: "admin5@qq.com",
        avatar: "https://img2.baidu.com/it/u=3064904053,3191769934&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1669395600&t=e37c1279968e38084b5c2fde1b5dc939",
        phone: "15295747485",
        nickname: "包dmin5",
        username: "admin5",
        authority: 0,
        sex: 2,
        banned: false
    );
    ContactUser user4 = ContactUser(
        id: "55a5e776-2a49-433e-b6a3-43cdd6b8ecb6",
        email: "admin6@qq.com",
        avatar: "https://img2.baidu.com/it/u=3064904053,3191769934&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1669395600&t=e37c1279968e38084b5c2fde1b5dc939",
        phone: "15295747486",
        nickname: "admin6",
        username: "admin6",
        authority: 0,
        sex: 2,
        banned: false
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        elevation: 0,
        title: const Text(
          "联系人",
          style: TextStyle(
              color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 24
          )),
        actions: [
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.more_vert)
          )
        ],
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 10),
            child: SearchInput(
              enabled: false,
              onTap: (){
                Get.toNamed(RoutePath.searchUser);
              },
            ),
          ),
          NormalListItem(
            onTap: (){
              Get.toNamed(RoutePath.newFriend);
            },
            prefix:Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child:const Center(
                child: const Icon(Icons.group_add,color: Colors.white,),
              ),
            ),
            title: "好友请求",
          ),
          Expanded(
              child: Contact(
                contactList: [user1,user2,user3,user4,user1,user2,user3,user4,user1,user2,user3,user4],
              )
          )
        ],
      ),
    );
  }
}
