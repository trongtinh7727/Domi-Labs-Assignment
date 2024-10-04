import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:domi/gen/assets.gen.dart';
import 'package:domi/model/location.dart';
import 'package:domi/presentation/common/address_item.dart';
import 'package:domi/presentation/common/mobile_input_field.dart';
import 'package:domi/presentation/common/mobile_primary_button.dart';
import 'package:domi/presentation/home/bloc/home_bloc.dart';
import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textstyle.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    super.key,
    this.onNextPressed,
  });
  final Future Function()? onNextPressed;
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Location? selectedLocation;
  final textEditingController = TextEditingController();
  Iterable<Location> options = const Iterable<Location>.empty();

  _onTextChange(String text) {
    setState(() {
      if (text.isEmpty || text == ' ') {
        options = const Iterable<Location>.empty();
        selectedLocation = null;
      } else {
        options = context.read<HomeBloc>().getLocation(text);
      }
    });
  }

  _onSelect(Location? location) {
    setState(() {
      selectedLocation = location;
      if (selectedLocation != null) {
        textEditingController.text =
            '${selectedLocation!.street}, ${selectedLocation!.state}';
      } else {
        textEditingController.clear();
      }
      options = const Iterable<Location>.empty();
    });
    context.read<HomeBloc>().onSelectLocation(location);
  }

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
                  _onSelect(null);
                },
              ),
              Text(
                '1/4',
                style: AppTextstyle.mobileBodyB4
                    .copyWith(color: AppColors.textHighlightBlue),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Claim your Domi ID",
            style: AppTextstyle.mobileHeadingH1,
          ),
          Text(
            'Open mails and earn money.',
            style: AppTextstyle.mobileBodyB3,
          ),
          SizedBox(height: 24.h),
          Text(
            'Complete Address',
            style: AppTextstyle.mobileBodyB4
                .copyWith(color: AppColors.textPrimary),
          ),
          SizedBox(height: 12.h),
          MobileInputField(
            controller: textEditingController,
            text: '4A Building',
            enable: selectedLocation==null,
            onChanged: _onTextChange,
            preffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Assets.icons.svg.location.svg(height: 20.h),
                  ),
                )),
            suffixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    _onSelect(
                        Location(street: '3A Street', state: 'Tampa, Florida'));
                  },
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: SvgPicture.asset(
                      Assets.icons.svg.gps.path,
                    ),
                  ),
                )),
            rightIcon: selectedLocation == null,
            leftIcon: selectedLocation != null,
          ),
          options.isNotEmpty
              ? SizedBox(
                  height: 256,
                  width: 353,
                  child: CustomScrollView(
                    slivers: [
                      SliverList.separated(
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          var option = options.elementAt(index);
                          return AddressItem(
                            location: option,
                            onTap: () {
                              _onSelect(option);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                      )
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    MobilePrimaryButton(
                        onPressed: selectedLocation != null ? widget.onNextPressed : null,
                        text: "Claim Your Address"),
                  ],
                ),
        ],
      ),
    );
  }
}
