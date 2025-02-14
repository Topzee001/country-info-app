import 'package:country_info_app/Viewmodels/country_viewmodel.dart';
import 'package:country_info_app/Viewmodels/theme_viewmodel.dart';
import 'package:country_info_app/Views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewModel>(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812), // Base on your Figma design
      builder: (context, child) => MaterialApp(
        title: 'Countries App',
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
