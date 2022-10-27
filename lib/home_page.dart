import 'package:dunyakilavuz_github_io/nav_buttons.dart';
import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget
{
    const Home({super.key});
    static const String route = "/";
    @override
    State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home>
{
    static TextStyle nameText(BuildContext context) 
    {
        return GoogleFonts.roboto
        (
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 43,
        );
    }

    static TextStyle surnameText(BuildContext context) 
    {
        return GoogleFonts.roboto
        (
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 23.5,
        );
    }


    static TextStyle professionText(BuildContext context) 
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
                        numberOfParticles: 20, 
                        refreshRate: Duration(milliseconds: 20),
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
                                    Text('Dünya', style: nameText(context)),
                                    Text('Kılavuz', style: surnameText(context)),
                                    Text('M.Sc. Computer Engineer', style: professionText(context)),
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