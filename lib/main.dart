import 'package:flutter/material.dart';
import 'package:flutter_application_news/config/Theme/theme.dart';
import 'package:flutter_application_news/presentation/screens/detail_page.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/news_provider.dart';
import 'presentation/screens/homePage_screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // create: (context) => NewsProvider(),
      providers: [ChangeNotifierProvider(create: (context) => NewsProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail' : (context) => const DetailPage(),
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
