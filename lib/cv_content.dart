import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                SvgPicture.asset("assets/cv_section_start_rect.svg",),
                const SizedBox(width: 10,),
                Text(text, style: sectionTextStyle(context),),
            ],
        );

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
                    sectionText("Education", context),
                    RichText(text: TextSpan
                    (
                        text: "2017 - 2020    Master of Science Degree",
                        style: entryTextStyle(context),
                    ))
                ],
            ),    
        );
    }

}