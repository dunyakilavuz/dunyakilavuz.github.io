import 'package:dunyakilavuz_github_io/home.dart';
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
                    color: Color.fromARGB(255, 255, 255, 255),

                ),
                headline2: TextStyle
                (
                    fontFamily: "SF Pro",
                    color: Color.fromARGB(255, 255, 255, 255),

                ),
                headline4: TextStyle
                (
                    fontFamily: "SF Pro",
                    color: Color.fromARGB(255, 255, 255, 255)
                )
            )
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp
        (
            title: 'Flutter Demo',
            theme: appThemeData(),
            home: const Home(title: 'Flutter Demo Home Page'),
        );
    }
}
