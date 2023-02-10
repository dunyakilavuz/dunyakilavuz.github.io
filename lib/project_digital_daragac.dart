import 'package:dunyakilavuz_github_io/project_template.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectDigitalDaragac extends ProjectTemplate
{
    ProjectDigitalDaragac({super.key}) : 
    super
    (
        route: "/projects/digitaldaragac",
        title: "DIGITAL DARAGAC",
        imagePath: "assets/digitaldaragac.png",
        projectContent: content(context,)
    );
    
    
    final double galleryHeight = 600;
    final String appStoreURL = "https://apps.apple.com/tr/app/dijital-dara%C4%9Fa%C3%A7/id1578002749";
    final String googlePlayURL = "https://play.google.com/store/apps/details?id=tr.edu.ieu.digitaldaragac&pli=1";
    final List<String> images = 
    [
        "assets/daragac_01.png",
        "assets/daragac_02.png",
        "assets/daragac_03.png",
        "assets/daragac_04.png",
        "assets/daragac_05.png",
        "assets/daragac_06.png",
        "assets/daragac_07.png",
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
                                ProjectTemplate.entry("A project we developed to create a virtual museum for the open-space art exhibitions which are displayed in Daragac, Izmir, Turkey."),
                                ProjectTemplate.entry(" We are displaying some of the best artworks of Daragac in the app. Some artworks are available in 3-D which can be viewed via Augmented Reality "),
                                ProjectTemplate.icon("ar-logo"),
                                ProjectTemplate.entry(" .We used"),
                                ProjectTemplate.entry(" React Native ", textColor: const Color.fromARGB(255, 96, 216, 248)),
                                ProjectTemplate.icon("react-native-logo"),
                                ProjectTemplate.entry(" to develop the front-end for iOS and Android while "),
                                ProjectTemplate.icon("django-logo"),
                                ProjectTemplate.entry(" is used for back-end web services."),
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
                                ProjectTemplate.entry("The project should be available as long as Izmir University of Economics supports it. You can obtain mobile versions from links below."),
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
                                Utils.svgButton(SvgPicture.asset("assets/googlePlay.svg", width: 120, height: 80,), () => {Utils.openURLatNewTab(googlePlayURL)}),
                            ],
                        ),
                    ),
                ],
            ),
        );

    }
}