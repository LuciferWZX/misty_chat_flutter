import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/badge/gf_badge.dart';

import '../../utils/color.util.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return buildSlidable(
      child: Container(
        padding: const EdgeInsets.only(left: 16,top: 14,right: 16,bottom: 14),
        child: Flex(
          direction: Axis.horizontal,
          children:  [
            const GFAvatar(
                size: 56,
                backgroundImage:NetworkImage("https://img2.baidu.com/it/u=3650686799,1942032122&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1668790800&t=2c279653d74e825ccda477205f73f7d7")
            ),
            const SizedBox(width: 16),
            buildInfo(),
            const SizedBox(width: 16),
            buildDetail()
          ],
        ),
      )
    );
  }
  Widget buildSlidable({required Widget child}){
    return Slidable(

        key: const ValueKey(1),
        child: child,

      startActionPane: ActionPane(
        motion:  const DrawerMotion(),
        // A pane can dismiss the Slidable.
        // dismissible: DismissiblePane(onDismissed: () {
        //   debugPrint("start-dissmiss");
        // }),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (BuildContext context) {
              debugPrint("删除");
            },
          ),
          SlidableAction(
            onPressed: (BuildContext context) {
              debugPrint("分享");
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          debugPrint("end-dissmiss");
        }),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (BuildContext context) {
              debugPrint("Archive");
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {
              debugPrint("Save");
            },
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),
    );
  }
  Widget buildInfo(){
    return(
      Expanded(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bryan",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorsUtil.hexStringColor("#001E2F"),
            ),),
            Text("what do you think?what do you think?what do you think?what do you think?",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
              color: ColorsUtil.hexStringColor("#74777F"),
            )),
          ],
        ),
      )
    );
  }
  Widget buildDetail(){
    return(
      Flex(
        direction:Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:[
          Builder(
              builder: (ctx)=>InkWell(
                child: Text("4:40PM"),
                onTap: (){
                  Slidable.of(ctx)?.openStartActionPane();
                },
              ),
          ),
          SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 25,
                minWidth: 25
            ),
            child:  Container(
                padding: EdgeInsets.only(left: 5,right: 5),
                decoration: BoxDecoration(
                    color: ColorsUtil.hexStringColor("#1974E6"),
                    borderRadius: const BorderRadius.all(Radius.circular(32))
                ),
                child: Center(
                  child: Text("99+",style: TextStyle(color: Colors.white,fontSize: 12),),
                )

            ),
          )
        ],
      )
    );
  }
}
