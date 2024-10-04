import 'package:domi/gen/assets.gen.dart';
import 'package:domi/model/location.dart';
import 'package:domi/presentation/home/bloc/home_bloc.dart';
import 'package:domi/presentation/home/widgets/address_screen.dart';
import 'package:domi/presentation/home/widgets/earning_screen.dart';
import 'package:domi/utils/app_colors.dart';
import 'package:domi/utils/app_textstyle.dart';
import 'package:domi/utils/route/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Positioned.fill(child: Assets.images.background.image(fit: BoxFit.fill)),
      Positioned(
          top: 130,
          left: 20,
          right: 20,
          child: Column(
            children: [
              StreamBuilder(
                  stream: context.read<HomeBloc>().locationController.stream,
                  builder: (context, snapshot) {
                    final Location? location = snapshot.data;
                    if (location == null) {
                      return Container();
                    }
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.labelBackground,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${location.street}, ${location.state}',
                        style: AppTextstyle.desktopBodyB4
                            .copyWith(color: AppColors.textWhite),
                      ),
                    );
                  }),
              const SizedBox(
                height: 6,
              ),
              StreamBuilder(
                stream: context.read<HomeBloc>().costController.stream,
                builder: (context, snapshot) {
                  final double? cost = snapshot.data;
                  if (cost == null) {
                    return Container();
                  }
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.labelBackground,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '\$${cost}/mo',
                      style: AppTextstyle.desktopBodyB4
                          .copyWith(color: AppColors.textWhite),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 6,
              ),
              Assets.icons.svg.subtract.svg()
            ],
          )),
      Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: Navigator(
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case RouteNames.address:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return AddressScreen(onNextPressed: () async {
                      await Navigator.of(context).pushNamed(
                        RouteNames.earning,
                      );
                    });
                  },
                );
              case RouteNames.earning:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return EarningScreen(onNextPressed: () async {});
                  },
                );
              default:
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) {
                    return AddressScreen(onNextPressed: () async {
                      await Navigator.of(context).pushNamed(
                        RouteNames.earning,
                      );
                    });
                  },
                );
            }
          },
        ),
      ),
    ])));
  }
}
