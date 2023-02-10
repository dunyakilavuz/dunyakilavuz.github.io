import 'package:dunyakilavuz_github_io/project_template.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectSolarX extends StatelessWidget
{
    ProjectSolarX({super.key});
    final String title = "SOLAR X";
    final double galleryHeight = 600;
    final String appStoreURL = "";
    final String googlePlayURL = "https://play.google.com/store/apps/details?id=com.dunyakilavuz.SolarX";
    final List<String> images = 
    [
        "assets/solarx_01.png",
        "assets/solarx_02.png",
        "assets/solarx_03.png",
        "assets/solarx_04.png",
        "assets/solarx_05.png",
    ];

    @override
    Widget build(BuildContext context) 
    {
        return SingleChildScrollView
        (
            scrollDirection: Axis.vertical,
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                [
                    Row
                    (
                        children: 
                        [
                            Expanded(child: Container()),
                            Text(title, style: ProjectTemplate.projectDetailTitle(),),
                            Expanded(child: Container()),
                        ],
                    ),
                    Utils.columnSeperator(10),
                    RichText // Intro
                    (
                        textAlign: TextAlign.justify,
                        text: TextSpan
                        (
                            children: 
                            [
                                ProjectTemplate.entry("A hobby project of mine. It is a solar system planetarium where you can set a date and time"),
                                ProjectTemplate.entry(" and it will show you how the planets will stand at that time. Also it will show you the azimuth and altitude info of the celestial objects respectively."),
                                ProjectTemplate.entry(" I used Godot Engine "),
                                ProjectTemplate.icon("godot-logo", width: 40, height: 40),
                                ProjectTemplate.entry(" with "),
                                ProjectTemplate.icon("c-sharp-logo", width: 40, height: 40),
                                ProjectTemplate.entry(" to develop the app."),
                            ]
                        )
                    ),
                    Utils.columnSeperator(10),
                    Utils.imageGallery(images, galleryHeight),
                    Utils.columnSeperator(10),
                    RichText // Outro
                    (
                        textAlign: TextAlign.justify,
                        text: TextSpan
                        (
                            children: 
                            [
                                ProjectTemplate.entry("The project is only available for Android devices right now. However I plan to publish for iOS as well. "),
                                ProjectTemplate.entry("You can download the app from the link below."),
                            ]
                        )
                    ),
                    Utils.columnSeperator(10),
                    FittedBox
                    (
                        fit: BoxFit.scaleDown,
                        child: Row
                        (
                            children: 
                            [
                                //Utils.svgButton(SvgPicture.asset("assets/appStore.svg", width: 120, height: 80,), () => {Utils.openURLatNewTab(appStoreURL)}),
                                Utils.svgButton(SvgPicture.asset("assets/googlePlay.svg", width: 120, height: 80,), () => {Utils.openURLatNewTab(googlePlayURL)}),
                            ],
                        ),
                    ),
                ],
            ),
        );

    }
}