import 'package:ct_app/routes/route_generator.dart';
import 'package:ct_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CT',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackbarKey,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          dividerColor: Color(0xfff2f2f2),
          dividerTheme: DividerThemeData(color: Color(0xfff2f2f2), thickness: 1),
          fontFamily: 'Manrope'),
      builder: (context, child) {
        var mediaQueryData = MediaQuery.of(context);
        double scaleFactor =
            ((mediaQueryData.size.width / 375.0) + (mediaQueryData.size.height / 812.0)) / 2;

        return MediaQuery(
            data: mediaQueryData.copyWith(textScaler: TextScaler.linear(scaleFactor)),
            child: child!);
      },
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
