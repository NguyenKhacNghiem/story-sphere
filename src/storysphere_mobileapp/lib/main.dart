import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/constants/utils/theme.dart';
import 'package:storysphere_mobileapp/routing/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height), minTextAdapt: true);
    return MaterialApp(
      title: 'Story Sphere',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Story Sphere Home Page'),
    );
  }
}

final _appRouter = AppRouter();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Story Sphere',
        theme: lightTheme,
        routerConfig: _appRouter.config(),
      );
  }
}
