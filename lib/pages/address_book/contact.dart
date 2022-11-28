import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:misty_chat/entities/contact_user.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:lpinyin/lpinyin.dart';
class Contact extends StatelessWidget {
  final List<ContactUser> contactList;
  const Contact({Key? key,required this.contactList}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List<ContactUser> finalList = contactList;
    finalList.sort((a,b)=>getFirstCharacter(a.nickname).compareTo(getFirstCharacter(b.nickname)));
    print("xxxxx:${finalList}");
    return ListView.builder(
      itemExtent: 56,
      itemCount: contactList.length,
      itemBuilder: (BuildContext context, int index) {
        ContactUser curUser = finalList[index];
        String preStr = getFirstCharacter(curUser.nickname);
        if(index>0 && preStr==getFirstCharacter(finalList[index-1].nickname)){
          preStr="";
        }
        return ContactItem(
          preStr: preStr,
          imageSrc: curUser.avatar,
          imageText: curUser.nickname,
          name: curUser.nickname,
        );
      },
      // children: contactList.map((contactUser) =>
      //     ContactItem(preStr: getFirstCharacter(contactUser.nickname),imageSrc: contactUser.avatar,imageText: contactUser.nickname,name: contactUser.nickname,)
      // ).toList(),
    );
  }
  Map<String,List<ContactUser>> formatData(List<ContactUser> tempList){
    Map<String,List<ContactUser>> formatMap = {};
    for(int i=0;i<tempList.length;i++){
      String? first = getFirstCharacter(tempList[i].nickname);
      if(first!=null){
        List<ContactUser>? list = formatMap[first];
        if(list!=null){
          list.add(tempList[i]);
          formatMap[first]=list;
        }else{
          formatMap[first]=[tempList[i]];
        }
      }
    }
    return formatMap;
  }
  String getFirstCharacter(String name){
    String allFirst = PinyinHelper.getShortPinyin(name);

    return allFirst[0].capitalizeFirst??"";
  }
}
class ContactItem extends StatelessWidget {
  final String? preStr;
  final String? imageText;
  final String? imageSrc;
  final bool noPreStr;
  final String? name;
  const ContactItem({
    Key? key,
    this.preStr, this.imageText, this.imageSrc, this.name, this.noPreStr=false
  }) : super(key: key);
  //final String src = "https://img2.baidu.com/it/u=3650686799,1942032122&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1668790800&t=2c279653d74e825ccda477205f73f7d7";
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          noPreStr?SizedBox(
            width: 12,
            child: Text(
              preStr != null?"$preStr":"",
              style: TextStyle(
                  color: ColorsUtil.hexStringColor("#1B72C0"),
                  fontWeight: FontWeight.w500,
                  fontSize: 16
              ),
            ),
          ):Container(),
          const SizedBox(width: 16),
          GFAvatar(
            backgroundImage:imageSrc!=null?NetworkImage("$imageSrc"):null,
            child: Text((imageText!=null && imageSrc=="")?"$imageText":""),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Text(
            "$name",
            style: TextStyle(
                color: ColorsUtil.hexStringColor("#001E2F"),
                fontWeight: FontWeight.w400,
                fontSize: 16
            ),
            overflow: TextOverflow.ellipsis,
          )
          )
        ],
      ),
    );
  }
}

