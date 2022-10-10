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
        Map<int, Color> colorMap =
        {
            50: const Color.fromRGBO(26, 34, 44, 0.1),
            100:const Color.fromRGBO(26, 34, 44, 0.2),
            200:const Color.fromRGBO(26, 34, 44, 0.3),
            300:const Color.fromRGBO(26, 34, 44, 0.4),
            400:const Color.fromRGBO(26, 34, 44, 0.5),
            500:const Color.fromRGBO(26, 34, 44, 0.6),
            600:const Color.fromRGBO(26, 34, 44, 0.7),
            700:const Color.fromRGBO(26, 34, 44, 0.8),
            800:const Color.fromRGBO(26, 34, 44, 0.9),
            900:const Color.fromRGBO(26, 34, 44, 1.0),
        };

        MaterialColor primaryColor = MaterialColor(0x1A222C, colorMap);

        return ThemeData
        (
            primarySwatch: primaryColor,
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
