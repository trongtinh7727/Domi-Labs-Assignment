import 'package:domi/presentation/common/custom_slider_thumb_shape.dart';
import 'package:domi/presentation/common/custom_slider_track_shape.dart';
import 'package:domi/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:domi/presentation/common/mobile_primary_button.dart';
import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textstyle.dart';
import 'package:provider/provider.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({
    super.key,
    this.onNextPressed,
  });
  final Future Function()? onNextPressed;
  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  double _cost = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: AppColors.cardBorder),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const Icon(Icons.arrow_back),
                onTap: () {
                  context.read<HomeBloc>().onCostChange(null);
                  Navigator.pop(context);
                },
              ),
              Text(
                '2/4',
                style: AppTextstyle.mobileBodyB4
                    .copyWith(color: AppColors.textHighlightBlue),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Earn with your Domi ID",
            style: AppTextstyle.mobileHeadingH1,
          ),
          Text(
            'Open mails and earn money.',
            style: AppTextstyle.mobileBodyB3,
          ),
          SizedBox(height: 24.h),
          RichText(
            text: TextSpan(
                text: 'Your Home Value: ',
                style: AppTextstyle.mobileBodyB4.copyWith(
                    color: AppColors.textPrimary, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                      text: "2.76 Million USD",
                      style: AppTextstyle.mobileBodyB4
                          .copyWith(color: AppColors.textPrimary))
                ]),
          ),
          SizedBox(height: 24.h),
          Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.surfaceCard,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackShape: CustomSliderTrackShape(),
                        trackHeight: 60,
                        thumbShape: CustomSilderThumbShape(),
                        thumbColor: Colors.white,
                      ),
                      child: Slider(
                        value: _cost,
                        min: 0,
                        max: 250,
                        divisions: 5,
                        activeColor: AppColors.buttonTertiaryLime,
                        inactiveColor: Colors.transparent,
                        onChanged: (value) {
                          setState(() {
                            _cost = value;
                            context.read<HomeBloc>().onCostChange(value);
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        "\$${_cost.toInt()}/mo",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              )),
          SizedBox(height: 12.h),
          Text('Opening 45 direct digital mails.',
              style: AppTextstyle.mobileBodyB4.copyWith(
                color: AppColors.textHighlightBlue,
              )),
          const SizedBox(height: 32),
          MobilePrimaryButton(onPressed: () {}, text: "Claim Your Address"),
        ],
      ),
    );
  }
}
