import 'package:dunyakilavuz_github_io/cv_page.dart';
import 'package:dunyakilavuz_github_io/welcome_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget 
{
	const Home({super.key, required this.title});
	final String title;
	@override
	State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
{
    @override
    Widget build(BuildContext context) 
    {
        return InteractiveViewer
        (
            scaleEnabled: false,
            child: SingleChildScrollView
            (
                physics: const BouncingScrollPhysics(),
                child: Column
                (
                    children: const 
                    [
                        WelcomePage(),
                        CurriculumVitaePage(),
                    ],
                )
            ),
        );
        
        

    }    
}
