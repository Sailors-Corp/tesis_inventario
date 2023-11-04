// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  final String text;
  final bool? isLoading;
  final Function()? onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const SizedBox(height: 0),
                const SizedBox(width: 10),
                Text(text),
              ],
            ))
        : ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(width: 10),
                Text(text),
              ],
            ));
  }
}
