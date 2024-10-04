import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class MobilePrimaryButton extends StatelessWidget {
  const MobilePrimaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(),
      child: Text(
        text,
        style: AppTextstyle.mobileBodyB2.copyWith(color: AppColors.textWhite),
      ),
    );
  }
}
