import 'package:flutter/material.dart';
import 'package:locket_clone/features/presentation/application/application.dart';

class StandardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const StandardAppbar(
      {Key? key,
      required this.onHelp,
      required this.onMenu,
      this.backgroundColor,
      this.appbarItemsColor})
      : super(key: key);
  final Function onHelp;
  final Function onMenu;
  final Color? backgroundColor;
  final Color? appbarItemsColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? const Color(0xFFF3F1EB),
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: const Icon(
          Icons.arrow_back,
        ),
        iconSize: AppInsets.xxMedium,
        color: appbarItemsColor ?? Colors.black,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.help_outline,
            ),
            iconSize: AppInsets.xxMedium,
            color: appbarItemsColor ?? Colors.black,
            onPressed: () {
              onHelp()!;
            }),
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(
              Icons.menu,
            ),
            iconSize: AppInsets.xxMedium,
            color: appbarItemsColor ?? Colors.black,
            onPressed: () {
              onMenu();
            }),
      ],
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppInsets.mLarge);
}
