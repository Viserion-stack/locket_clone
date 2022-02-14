import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/application.dart';

class StandardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const StandardAppbar({Key? key, required this.onHelp, required this.onMenu})
      : super(key: key);
  final Function onHelp;
  final Function onMenu;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF3F1EB),
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(
          Icons.arrow_back,
        ),
        iconSize: AppInsets.xxMedium,
        color: Colors.black,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.help_outline,
          ),
          iconSize: AppInsets.xxMedium,
          color: Colors.black,
          onPressed: () => onHelp,
        ),
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.menu,
            ),
            iconSize: AppInsets.xxMedium,
            color: Colors.black,
            onPressed: () => onMenu),
      ],
      elevation: 0.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppInsets.mLarge);
}
