import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golok_apps/services/local_database/db_services.dart';

import '../utils/configuration/config.dart';
import 'dropdown_widget.dart';

class ProfileCard extends ConsumerWidget {
  final String accountName;
  final String imagePath;
  final void Function()? onTap;
  
  const ProfileCard(
      {Key? key,
      required this.accountName,
      required this.onTap,
      this.imagePath = 'assets/images/profile.png'})
      : super(key: key);
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DropdownItem> profileMenu = [
      DropdownItem(title: accountName, icon: "list", onTap: () => log.name),
      DropdownItem(title: "Sign out", icon: "home", onTap: onTap)
    ];
    return Container(
        margin: const EdgeInsets.only(left: defaultPadding),
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: Dropdown(
          items: profileMenu,
        ));
  }
}
