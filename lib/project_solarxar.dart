import 'package:dunyakilavuz_github_io/project_template.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectSolarXAR extends ProjectTemplate
{
    ProjectSolarXAR({super.key}): 
    super
    (
        route: "/projects/solarxar",
        title: "SOLAR X AR",
        imagePath: "assets/solarxar-logo.jpg",
        isFolder:  false,
    );

    final double galleryHeight = 600;
    final String appStoreURL = "https://apps.apple.com/tr/app/solarx-ar/id6447647945";
    final String googlePlayURL = "";
    final List<String> images = 
    [
        "assets/solarxar_01.png",
        "assets/solarxar_02.png",
        "assets/solarxar_03.png",
        "assets/solarxar_04.png",
        "assets/solarxar_05.png",
    ];


    Widget content(BuildContext context) 
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
                                ProjectTemplate.entry("SolarX AR is an app where you can explore solar system, discover planet positions and movements and enjoy"),
                                ProjectTemplate.entry(" immersive augmented reality experiences. "),
                                ProjectTemplate.entry(" I used "),
                                ProjectTemplate.icon("flutter-logo", width: 25, height: 25),
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
                                ProjectTemplate.entry("The project is only available for iOS devices right now. However I plan to publish for Android as well. "),
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
                                Utils.svgButton(SvgPicture.asset("assets/appStore.svg", width: 120, height: 80,), () => {Utils.openURLatNewTab(appStoreURL)}),
                                //Utils.svgButton(SvgPicture.asset("assets/googlePlay.svg", width: 120, height: 80,), () => {Utils.openURLatNewTab(googlePlayURL)}),
                            ],
                        ),
                    ),
                ],
            ),
        );

    }

    @override
    Widget build(BuildContext context) 
    {
        return template(context, content);
    }
}