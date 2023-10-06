// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:google_fonts/google_fonts.dart';

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});
    static String thesisURL = "https://tez.yok.gov.tr/UlusalTezMerkezi/TezGoster?key=fl0Kw4p1rmMDotyKRdYv1BlOn0xw7xvxfzqjc8tCRUrg-kyuC-miRPg4PxXcgxul";
    static String gamedevURL = "https://se.ieu.edu.tr/gamedev/en/";
    static Color mainColor = Colors.lightBlue.shade900;
    static String bullet = "\u2022 ";

    static TextStyle sectionTextStyle () 
    {
        return GoogleFonts.roboto
        (
            fontSize: 24, 
            fontWeight: FontWeight.w400, 
            color: mainColor,
            letterSpacing: 1,
        );
    }

    static TextStyle entryTextStyle()
    {
        return GoogleFonts.roboto
        (
            fontSize: 18, 
            height: 1.8,
            color: Colors.black,
            letterSpacing: 1,
        );
    }

    static TextStyle nameText() 
    {
        return GoogleFonts.roboto
        (
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade500,
            letterSpacing: 1,
        );
    }

    static TextStyle surnameText() 
    {
        return GoogleFonts.roboto
        (
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
            letterSpacing: 1,
        );
    }

    static TextStyle professionText() 
    {
        return GoogleFonts.roboto
        (
            fontSize: 25, 
            fontWeight: FontWeight.w200, 
            color: Colors.black,
            letterSpacing: 1.5,
        );
    }

    static TableRow sectionText(String text)
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
                Text(text, style: sectionTextStyle()),
            ],
        );
    }

    static Text entryText(String text, {TextAlign textAlign = TextAlign.left, TextOverflow overflow = TextOverflow.visible})
    {
        return Text
        (
            text , 
            textAlign: textAlign, 
            overflow: overflow,
            style: entryTextStyle()
        );
    }

    static TableRow dictionaryRow(String key, String value)
    {
        return TableRow
        (
            children: 
            [
                entryText(key, textAlign: TextAlign.right, overflow: TextOverflow.ellipsis),
                Container(),
                entryText(value),
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
                    Utils.tableRowSeperator(100),
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
                                child: Image.asset("assets/profilepic.jpg",),  
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
                                                    TextSpan(text: "Dünya ", style: nameText(),),
                                                    TextSpan(text: "Kılavuz", style: surnameText()),
                                                ]
                                            ),
                                        ),
                                        Text("M.Sc. Computer Engineer", style: professionText(),),
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
                    Utils.tableRowSeperator(10),
                    sectionText("Education"),
                    TableRow
                    (
                        children: 
                        [
                            Text("2017 - 2020", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Master of Science Degree", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Izmir University of Economics", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: ", Faculty of Engineering and Computer Science", style: entryTextStyle()),
                                        TextSpan(text: ", Computer Engineering", style: entryTextStyle()),
                                        TextSpan(text: ", GPA - 3.50 / 4.00.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: "\nTo view the thesis document, follow the Council of Higher Education's Thesis ", style: entryTextStyle().copyWith(fontSize: 16),),
                                        TextSpan(text: "'link.'", style: entryTextStyle().copyWith(fontSize: 16, color: mainColor),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(thesisURL, 'new tab');}),
                                    ],
                                ),
                                textAlign: TextAlign.justify,
                            ),
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2012 - 2016", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Bachelor of Science Degree", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Izmir University of Economics", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: ", Faculty of Engineering and Computer Science", style: entryTextStyle()),
                                        TextSpan(text: ", Computer Engineering", style: entryTextStyle()),
                                        TextSpan(text: ", GPA - 2.99 / 4.00.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                        TextSpan(text: "\nSpecialized in Game Development. For more info follow this ", style: entryTextStyle().copyWith(fontSize: 16),),
                                        TextSpan(text: "'link.'", style: entryTextStyle().copyWith(fontSize: 16, color: mainColor),recognizer: TapGestureRecognizer()..onTap = () { html.window.open(gamedevURL, 'new tab');}),
                                    ],
                                ),
                                textAlign: TextAlign.justify,
                            ),
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2008 - 2012", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "High School Education", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Bodrum Marmara College", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    sectionText("Experience"),
                    TableRow
                    (
                        children: 
                        [
                            Text("2023 Jul - Today", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Maritime Trainer", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Unreal Engine Developer", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text
                            (
                                "Maritime Trainer is a specialized organization dedicated to advancing maritime education and assessment.  "
                                "We are leveraging the cutting-edge Unreal Engine 5 to craft immersive virtual reality scenarios that not "
                                "only enhance the educational experience but also provide individuals with a deeper understanding of maritime concepts and practices.", 
                                style: entryTextStyle(), 
                                textAlign: TextAlign.justify,
                            )
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("2021 Aug - 2023 Jul", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "QReal 3D - The Glimpse Group", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", XR Developer", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text
                            (
                                "QReal specializes in creating life-like 3D and Augmented Reality (AR) content. "
                                "Job includes creating Snapchat Lenses from storyboards, implementing game mechanics by mainly scripting in Javascript, "
                                "material editing for both 2D and 3D content, designing levels and so on. Used Lens Studio, a very similar tool to Unity 3D." , 
                                style: entryTextStyle(), 
                                textAlign: TextAlign.justify,
                            )
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("2018 Jul - 2021 Aug", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Izmir University of Economics", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Laboratory Specialist.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text(
                                "Computer technician duty in a newly opened laboratory in IUE. "
                                "Job includes duties like server management, mail service administration, "
                                "local networking, periodic checks and maintenance of laboratory computers and other hardware. "
                                "I was employed while doing my Master's degree.", 
                                style: entryTextStyle(), 
                                textAlign: TextAlign.justify,
                            )
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2017 Fall", style: entryTextStyle(), textAlign: TextAlign.right,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Izmir University of Economics", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Voluntary Laboratory Assistant.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Assisted the course 'SE 320 - Introduction to Computer Games' throughout the semester.", style: entryTextStyle(), textAlign: TextAlign.justify,)
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2014 Summer", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Mobexis Software Corporation", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Software Developer Intern.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Moving, re-developing a Java game project to Unity Engine.", style: entryTextStyle(), textAlign: TextAlign.justify,)
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    TableRow
                    (
                        children: 
                        [
                            Text("2013 Summer", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 2, overflow: TextOverflow.ellipsis,),
                            Container(),
                            RichText
                            (
                                text: TextSpan
                                (
                                    children: <TextSpan>
                                    [
                                        TextSpan(text: "Bilsa Software Corporation", style: entryTextStyle().copyWith(fontWeight: FontWeight.bold),),
                                        TextSpan(text: ", Software Developer Intern.", style: entryTextStyle().copyWith(fontStyle: FontStyle.italic),),
                                    ],
                                ),
                            ),
                        ]
                    ),
                    TableRow
                    (
                        children: 
                        [
                            Text("Description", style: entryTextStyle(), textAlign: TextAlign.right, maxLines: 1, overflow: TextOverflow.ellipsis,),
                            Container(),
                            Text("Introduction to Java programming language, making applications using JFrame.", style: entryTextStyle(), textAlign: TextAlign.justify,)
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    sectionText("Skills"),
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
                                    entryText("I am actively using the technologies;"),
                                    entryText("$bullet C#   - Unity 3D, Godot Engine."),
                                    entryText("$bullet JS   - React Native, Lens Studio. "),
                                    entryText("$bullet Dart - Flutter, this site is actually made with Flutter for web!"),
                                    entryText("But also familiar with the technologies;"),
                                    entryText("$bullet Java"),
                                    entryText("$bullet Python"),
                                    entryText("$bullet C & C++"),
                                    entryText("$bullet HTML & CSS"),  
                                    entryText("For most projects, I use Git with GitHub for version control."),
                                ],
                            ),
                        ]
                    ),
                    Utils.tableRowSeperator(10),
                    sectionText("Language Skills"),
                    dictionaryRow("Turkish", "Native"),
                    dictionaryRow("English", "IELTS 7.0 / 9.0 - 20.05.2017"),
                    dictionaryRow("Spanish", "Intermediate"),
                    dictionaryRow("Greek", "Beginner, just started learning"),
                    Utils.tableRowSeperator(10),
                    sectionText("About me"),
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
                                    entryText("I enjoy;"),
                                    entryText("$bullet Cycling, weight-lifting, running, swimming and so on."),
                                    entryText("$bullet Outdoor activities like camping and trekking."),
                                    entryText("$bullet Reading and watching things about astronomy and physics."),
                                    entryText("$bullet Gaming!"),
                                ],
                            ),
                        ]
                    ),
                    Utils.tableRowSeperator(100),
                ],
            ),    
        );
    }

}