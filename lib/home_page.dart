import 'package:dunyakilavuz_github_io/nav_buttons.dart';
import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    static TextStyle? nameText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 90,
            fontWeight: FontWeight.w100,
        );
    }

    static TextStyle? professionText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline4?.copyWith
        (
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
                    const Particles(),
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
                                            Text('Dünya', style: nameText(context)?.copyWith(letterSpacing: 40),),
                                            Text('Kılavuz', style: nameText(context)?.copyWith(letterSpacing: 22),),
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