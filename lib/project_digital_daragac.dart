import 'package:dunyakilavuz_github_io/projects_content.dart';
import 'package:flutter/material.dart';

Widget projectDigitalDaragac()
{
    String intro = "Digital Daragac is a project we developed to create a virtual museum for the open-space art exhibitions which are displayed in Daragac, Izmir, Turkey.";

    return SingleChildScrollView
    (
        scrollDirection: Axis.vertical,
        child: Column
        (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
                RichText
                (
                    textAlign: TextAlign.justify,
                    text: TextSpan
                    (
                        text: intro,
                        style: ProjectsContentState.entryTextStyle(),
                    ),
                ),
                Wrap
                (
                    spacing: 10,
                    runSpacing: 10,
                    children: 
                    [
                        
                    ],
                ),
            ],
        ),
    );
}