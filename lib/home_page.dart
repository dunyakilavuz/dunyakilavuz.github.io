import 'package:dunyakilavuz_github_io/main.dart';
import 'package:dunyakilavuz_github_io/nav_buttons.dart';
import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget
{
    const Home({super.key, required this.analytics, required this.observer});
    static const String route = "/";
    final FirebaseAnalytics analytics;
    final FirebaseAnalyticsObserver observer;
    @override
    State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home>
{
    static TextStyle nameText() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 43,
        );
    }

    static TextStyle surnameText() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 23.5,
        );
    }


    static TextStyle professionText() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.white,
            fontSize: 30, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 2.8,
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (
            body: Stack
            (
                alignment: Alignment.center,
                children: 
                [
                    const Particles
                    (
                        numberOfParticles: 40, 
                        refreshRate: Duration(milliseconds: 20),
                        bgColor: App.mainBGColor,
                        particleColors: 
                        [
                            Color.fromARGB(255, 122, 253, 166),
                            Color.fromARGB(255, 124, 218, 255),
                            Color.fromARGB(255, 227, 156, 255),
                            Color.fromARGB(255, 255, 169, 125),
                        ]
                    ),
                    Padding
                    (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: FittedBox
                        (
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: Column
                            (
                                children: 
                                [
                                    Text('Dünya', style: nameText()),
                                    Text('Kılavuz', style: surnameText()),
                                    Text('M.Sc. Computer Engineer', style: professionText()),
                                    Utils.columnSeperator(10),
                                    const NavButtons(),
                                ],
                            ),
                        ),
                    ),
                ],
            )
        );
    }
}