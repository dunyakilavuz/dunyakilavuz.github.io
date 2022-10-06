import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});
    static String thesisURL = "https://tez.yok.gov.tr/UlusalTezMerkezi/TezGoster?key=fl0Kw4p1rmMDotyKRdYv1BlOn0xw7xvxfzqjc8tCRUrg-kyuC-miRPg4PxXcgxul";
    static String gamedevURL = "https://se.ieu.edu.tr/gamedev/en/";
    static Color mainColor = Colors.lightBlue.shade900;

    static TextStyle? sectionTextStyle (BuildContext context) 
    {
        return Theme.of(context).textTheme.headline1?.copyWith
        (
            fontSize: 24, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1.5,
            color: mainColor,
        );
    }

    static TextStyle? subsectionTextStyle (BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 22, 
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
            height: 1.8,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    static TextStyle? nameText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
        );
    }

    static TextStyle? surnameText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
        );
    }

    static TextStyle? professionText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline4?.copyWith
        (
            fontSize: 25, 
            fontWeight: FontWeight.w200, 
            letterSpacing: 1.5,
            color: Colors.black,
        );
    }

    static TableRow sectionText(String text ,BuildContext context)
    {
        return TableRow
        (
            children: 
            [
                SizedBox // That blue line before sections.
                (
                    height: 30,
                    child: Column
                    (
                        children: 
                        [
                            Expanded(child: Container()),
                            Container(color: mainColor, height: 10,),
                            Expanded(child: Container()),
                        ],
                    )
                ),
                Container(),
                Text(text, style: sectionTextStyle(context)),
            ],
        );
    }

    static TableRow seperator(double height)
    {
        return TableRow
        (
            children: 
            [
                SizedBox(height: height,),
                SizedBox(height: height,),
                SizedBox(height: height,),
            ]
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Container
        (
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Table
            (
                //border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                columnWidths: const 
                {
                    0: FlexColumnWidth(1),
                    1: FixedColumnWidth(20),
                    2: FlexColumnWidth(4),
                },   
                children: 
                [
                    seperator(100),
                    TableRow
                    (                        
                        children: 
                        [
                            Container
                            (
                                decoration: BoxDecoration
                                (
                                    border: Border.all
                                    (
                                        width: 0.5,
                                        color: Colors.blue,
                                    ),
                                ) ,
                                padding: const EdgeInsets.all(5),
                                child: Image.asset("cvpic.jpg",),  
                            ),
                            Container(),
                            Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children:  
                                [
                                    RichText
                                    (
                                        text: TextSpan
                                        (
                                            children: <TextSpan> 
                                            [
                                                TextSpan(text: "Dünya ", style: nameText(context),),
                                                TextSpan(text: "Kılavuz", style: surnameText(context)),
                                            ]
                                        ),
                                    ),
                                    Text("M.Sc. Computer Engineer", style: professionText(context),),
                                ]
                            ),  
                        ]
                    ),
                    TableRow
                    (
                        decoration: const BoxDecoration
                        (
                            border: Border
                            (
                                bottom: BorderSide(width: 1.0, color: Colors.black45),
                            )
                        ),
                        children:
                        [
                            Container(height: 10,),
                            Container(height: 10,),
                            Container(height: 10,),
                        ]
                    ),
                    seperator(10),
                    sectionText("Education", context),
                    TableRow
                    (
                        children: 
                        [
                            Text("2017 - 2020", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Master of Science Degree", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Izmir University of Economics", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: ", Faculty of Engineering and Computer Science", style: entryTextStyle(context)),
                                        TextSpan(text: ", Computer Engineering", style: entryTextStyle(context)),
                                        TextSpan(text: ", GPA - 3.50 / 4.00.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: "\nTo view the thesis document, follow the Council of Higher Education's Thesis ", style: entryTextStyle(context)?.copyWith(fontSize: 16),),
                                        TextSpan(text: "'link.'", style: entryTextStyle(context)?.copyWith(fontSize: 16),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(thesisURL, 'new tab');}),
                                    ],
                                )
                            ),
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2012 - 2016", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Bachelor of Science Degree", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Izmir University of Economics", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: ", Faculty of Engineering and Computer Science", style: entryTextStyle(context)),
                                        TextSpan(text: ", Computer Engineering", style: entryTextStyle(context)),
                                        TextSpan(text: ", GPA - 2.99 / 4.00.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: "\nSpecialized in Game Development. For more info follow this ", style: entryTextStyle(context)?.copyWith(fontSize: 16),),
                                        TextSpan(text: "'link.'", style: entryTextStyle(context)?.copyWith(fontSize: 16),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(gamedevURL, 'new tab');}),
                                    ],
                                )
                            ),
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2008 - 2012", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "High School Education", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Bodrum Marmara College", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                )
                            ),
                        ]
                    ),
                    seperator(10),
                    sectionText("Experience", context),
                    TableRow
                    (
                        children: 
                        [
                            Text("2018 Jul - 2021 Aug", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Izmir University of Economics", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Laboratory Specialist.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                )
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            Text(
                                "Computer technician duty in a newly opened laboratory in IUE. "
                                "Job includes duties like server management, mail service administration, "
                                "local networking, periodic checks and maintenance of laboratory computers and other hardware. "
                                "I was employed while doing my Master's degree.", style: entryTextStyle(context),)
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2017 Fall", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Izmir University of Economics", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Voluntary Laboratory Assistant.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                )
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            Text("Assisted the course 'SE 320 - Introduction to Computer Games' throughout the semester.", style: entryTextStyle(context),)
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2014 Summer", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Mobexis Software Corporation", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Software Developer Intern.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                )
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            Text("Moving, re-developing a Java game project to Unity Engine.", style: entryTextStyle(context),)
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2013 Summer", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Bilsa Software Corporation", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Software Developer Intern.", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                )
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            Text("Introduction to Java programming language, making applications using JFrame.", style: entryTextStyle(context),)
                        ]
                    ),
                    seperator(100),
                ],
            ),    
        );
    }

}