import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});

    static TextStyle? sectionTextStyle (BuildContext context) 
    {
        return Theme.of(context).textTheme.headline1?.copyWith
        (
            fontSize: 30, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1.5,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    static TextStyle? subsectionTextStyle (BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 26, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1.5,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    static TextStyle? entryTextStyle (BuildContext context)
    {
        return Theme.of(context).textTheme.bodyText1?.copyWith
        (
            fontSize: 18, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    static Row sectionText(String text ,BuildContext context)
    {
        return Row
        (
            children: 
            [
                Image(image: ),
                Text(text, style: sectionTextStyle(context),);
            ],
        );

    }

    static Text subsectionText(String text ,BuildContext context)
    {
        return Text(text, style: subsectionTextStyle(context),);
    }

    static Text entryText(String text ,BuildContext context)
    {
        return Text(text, style: subsectionTextStyle(context),);
    }

    static Text entry2Text(String text1, String text2 ,BuildContext context)
    {
        return Text("$text1\t$text2", style: subsectionTextStyle(context),);
    }


    @override
    Widget build(BuildContext context) 
    {
        return Center
        (
            child: Column
            (
                children: 
                [

                ],
            ),    
        );
    }

}