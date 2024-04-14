import 'package:flutter/material.dart';

class PreferenceTile extends StatelessWidget {
  const PreferenceTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.onTap,
    this.primaryColor,
    this.secondaryColor,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final void Function()? onTap;
  final Color? primaryColor;
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: secondaryColor,
        child: Icon(
          icon,
          color: primaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
    );
  }
}
