import 'package:dunyakilavuz_github_io/nav_buttons.dart';
import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:flutter/material.dart';

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
        return const TextStyle
        (
            fontFamily: "SF Pro",
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 40,
        );
    }

    static TextStyle surnameText(BuildContext context) 
    {
        return const TextStyle
        (
            fontFamily: "SF Pro",
            color: Colors.white,
            fontSize: 90,
            fontWeight: FontWeight.w100,
            letterSpacing: 22,
        );
    }


    static TextStyle professionText(BuildContext context) 
    {
        return const TextStyle
        (
            fontFamily: "SF Pro",
            color: Colors.white,
            fontSize: 29, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.5,
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
                    const Particles(numberOfParticles: 20,),
                    Container
                    (
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height,
                        child: Column
                        (
                            children: <Widget>
                            [
                                Expanded(child: Container(),),
                                FittedBox
                                (
                                    fit: BoxFit.scaleDown,
                                    child: Column
                                    (
                                        children: 
                                        [
                                            Text('Dünya', style: nameText(context)),
                                            Text('Kılavuz', style: surnameText(context)),
                                            Text('M.Sc. Computer Engineer', style: professionText(context)),
                                        ],
                                    ),
                                ),
                                const SizedBox(height: 10,),
                                const NavButtons(),
                                Expanded(child: Container(),),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}