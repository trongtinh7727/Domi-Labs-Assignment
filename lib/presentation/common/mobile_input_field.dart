// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textstyle.dart';

class MobileInputField extends StatelessWidget {
  const MobileInputField({
    super.key,
    this.suffixIcon,
    this.preffixIcon,
    required this.rightIcon,
    required this.leftIcon,
    required this.text,
    required this.enable,
    this.focusNode,
    this.controller,
    this.onChanged,
  });

  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final bool rightIcon;
  final bool leftIcon;
  final String text;
  final bool enable;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: enable,
        onChanged: onChanged,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            suffixIcon: rightIcon ? suffixIcon : null,
            prefixIcon: leftIcon ? preffixIcon : null,
            hintText: text,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            hintStyle: AppTextstyle.mobileBodyB2,
            
            ),
      ),
    );
  }
}
