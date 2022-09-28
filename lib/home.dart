

import 'package:dunyakilavuz_github_io/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        return SingleChildScrollView
        (
            child: Column
            (
                
                children: 
                [
                    WelcomePage(),
                ],
            )
        );
    }    
}
