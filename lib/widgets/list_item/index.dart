import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

import '../../utils/color.util.dart';

class ListItem extends StatefulWidget {
  final bool slidable;
  final String imgSrc;
  final String title;
  final String desc;
  final Widget? action;
  const ListItem({
    Key? key ,
    this.slidable = false,
    this.title = "",
    this.desc = "",
    this.action,
    required this.imgSrc
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    if(widget.slidable){
      return buildSlidable();
    }
    return buildListItem();
  }
  Widget buildListItem(){
    return Container(
      padding: const EdgeInsets.only(left: 16,top: 14,right: 16,bottom: 14),
      child: Flex(
        direction: Axis.horizontal,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          GFAvatar(
              size: 37,
              backgroundImage:NetworkImage(widget.imgSrc)
          ),
          const SizedBox(width: 16),
          buildInfo(),
          const SizedBox(width: 16),
          widget.action!=null?buildAction():buildDetail()
        ],
      ),
    );
  }

  Widget buildSlidable(){
    return Slidable(
      key: const ValueKey(1),
      child: buildListItem(),
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
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 56
          ),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorsUtil.hexStringColor("#001E2F"),
                  height: 1.5
              ),),
              Text(widget.desc,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                  color: ColorsUtil.hexStringColor("#74777F"),
                  height: 1.5
              )),
            ],
          ),
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
  Widget buildAction(){
    return widget.action as Widget;
  }
}
