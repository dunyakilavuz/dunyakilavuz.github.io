import 'package:dunyakilavuz_github_io/curriculum_page.dart';
import 'package:dunyakilavuz_github_io/home_page.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:flutter/material.dart';

void main() 
{
    runApp(const App());
}

class App extends StatelessWidget 
{
    const App({super.key});

    ThemeData appThemeData()
    {
        return ThemeData
        (
            primarySwatch: Colors.blue,
            textTheme: const TextTheme
            (
                bodyText2: TextStyle
                (
                    fontFamily: "SF Pro",
                    color: Colors.white,

                ),
                headline2: TextStyle
                (
                    fontFamily: "SF Pro",
                    color: Colors.white,

                ),
                headline4: TextStyle
                (
                    fontFamily: "SF Pro",
                    color: Colors.white,
                )
            )
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp
        (
            title: 'Dünya Kılavuz',
            theme: appThemeData(),
            initialRoute: Home.route,
            routes: 
            {
                Home.route:(context) => const Home(),
                Curriculum.route:(context) => const Curriculum(),
                Projects.route:(context) => const Projects(),
            },
        );
    }
}
