// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:domi/gen/assets.gen.dart';
import 'package:domi/model/location.dart';
import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textStyle.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.location,
    required this.onTap,
  });
  final Location location;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 325.w,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: AppColors.surfaceCard,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Assets.icons.svg.location.svg(height: 20.h),
              const SizedBox(
                width: 9.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.street,
                    style: AppTextstyle.desktopBodyB4,
                  ),
                  Text(location.state, style: AppTextstyle.mobileBodyB4),
                ],
              )
            ],
          ),
        ));
  }
}
