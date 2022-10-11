import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});
    static String thesisURL = "https://tez.yok.gov.tr/UlusalTezMerkezi/TezGoster?key=fl0Kw4p1rmMDotyKRdYv1BlOn0xw7xvxfzqjc8tCRUrg-kyuC-miRPg4PxXcgxul";
    static String gamedevURL = "https://se.ieu.edu.tr/gamedev/en/";
    static Color mainColor = Colors.lightBlue.shade900;
    static String bullet = "\u2022 ";

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

    static Text entryText(String text, BuildContext context, {TextAlign textAlign = TextAlign.left})
    {
        return Text(text , style: entryTextStyle(context), textAlign: textAlign);
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
            width: MediaQuery.of(context).size.width * 0.9,
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
                            FittedBox
                            (
                                fit: BoxFit.scaleDown,
                                child: Column
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
                            )
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
                                        TextSpan(text: "'link.'", style: entryTextStyle(context)?.copyWith(fontSize: 16, color: mainColor),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(thesisURL, 'new tab');}),
                                    ],
                                ),
                                textAlign: TextAlign.justify,
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
                                        TextSpan(text: "'link.'", style: entryTextStyle(context)?.copyWith(fontSize: 16, color: mainColor),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(gamedevURL, 'new tab');}),
                                    ],
                                ),
                                textAlign: TextAlign.justify,
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
                                ),
                            ),
                        ]
                    ),
                    seperator(10),
                    sectionText("Experience", context),
                    TableRow
                    (
                        children: 
                        [
                            Text("2021 Aug - Today", style: entryTextStyle(context), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "QReal 3D - The Glimpse Group", style: entryTextStyle(context)?.copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", XR Developer", style: entryTextStyle(context)?.copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("Description", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text
                            (
                                "QReal specializes in creating life-like 3D and Augmented Reality (AR) content. "
                                "Job includes creating Snapchat Lenses from storyboards, implementing game mechanics by mainly scripting in Javascript, "
                                "material editing for both 2D and 3D content, designing levels and so on. Used Lens Studio, a very similar tool to Unity 3D." , 
                                style: entryTextStyle(context), 
                                textAlign: TextAlign.justify,
                            )
                        ]
                    ),
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
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("Description", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text(
                                "Computer technician duty in a newly opened laboratory in IUE. "
                                "Job includes duties like server management, mail service administration, "
                                "local networking, periodic checks and maintenance of laboratory computers and other hardware. "
                                "I was employed while doing my Master's degree.", 
                                style: entryTextStyle(context), 
                                textAlign: TextAlign.justify,
                            )
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
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("Description", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Assisted the course 'SE 320 - Introduction to Computer Games' throughout the semester.", style: entryTextStyle(context), textAlign: TextAlign.justify,)
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("2014 Summer", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis,),
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
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("Description", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Moving, re-developing a Java game project to Unity Engine.", style: entryTextStyle(context), textAlign: TextAlign.justify,)
                        ]
                    ),
                    seperator(10),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("2013 Summer", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis,),
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
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            AutoSizeText("Description", style: entryTextStyle(context), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Introduction to Java programming language, making applications using JFrame.", style: entryTextStyle(context), textAlign: TextAlign.justify,)
                        ]
                    ),
                    seperator(10),
                    sectionText("Skills", context),
                    TableRow
                    (
                        children: 
                        [
                            Container(),
                            Container(),
                            Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                [
                                    entryText("I am actively using the technologies;", context),
                                    entryText("$bullet Dart - Flutter, this site is actually made with Flutter for web!", context),
                                    entryText("$bullet JS   - React Native, Lens Studio. ", context),
                                    entryText("$bullet C#   - Unity 3D, Godot Engine.", context),
                                    entryText("But also familiar with the technologies;", context),
                                    entryText("$bullet Java", context),
                                    entryText("$bullet Python", context),
                                    entryText("$bullet C & C++", context),
                                    entryText("$bullet HTML & CSS", context),  
                                    entryText("I actively use Git with GitHub for most of my projects.", context),
                                ],
                            ),
                        ]
                    ),
                    seperator(10),
                    sectionText("Language Skills", context),
                    TableRow
                    (
                        children: 
                        [
                            Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: 
                                [
                                    entryText("Turkish", context),
                                    entryText("English", context),
                                    entryText("Spanish", context),
                                    entryText("Greek", context),
                                ],
                            ),
                            Container(),
                            Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                [
                                    entryText("Native", context),
                                    entryText("IELTS 7.0 / 9.0 - 20.05.2017", context),
                                    entryText("Intermediate", context), 
                                    entryText("Beginner, just started learning", context)   
                                ],
                            ),
                        ]
                    ),
                    seperator(10),
                    sectionText("About me", context),
                    TableRow
                    (
                        children: 
                        [
                            Container(),
                            Container(),
                            Column
                            (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: 
                                [
                                    entryText("I enjoy;", context),
                                    entryText("$bullet Most sports; weight-lifting, running, swimming, cycling and so on.", context),
                                    entryText("$bullet Outdoor activities like camping and trekking.", context),
                                    entryText("$bullet Reading and watching things about astronomy and physics.", context),
                                    entryText("$bullet Gaming!", context),
                                ],
                            ),
                        ]
                    ),
                    seperator(100),
                ],
            ),    
        );
    }

}