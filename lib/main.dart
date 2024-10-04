import 'package:domi/presentation/home/bloc/home_bloc.dart';
import 'package:domi/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:domi/utils/route/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloc>(
      create: (context) => HomeBloc(),
      dispose: (context, value) {
        value.dispose();
      },
      builder: (context, child) => ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => settings.generateRoute,
            theme: appTheme,
          );
        },
      ),
    );
  }
}
