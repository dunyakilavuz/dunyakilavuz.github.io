// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:dunyakilavuz_github_io/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui_web' as ui_web;

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});

    @override
    Widget build(BuildContext context) 
    {
        UniqueKey viewID = UniqueKey();
        String srcURL = kDebugMode ? 'assets/cv.html' : 'https:dunyakilavuz.com/cv.html';

        ui_web.platformViewRegistry.registerViewFactory(
            viewID.toString(),
            (int viewID) => IFrameElement()
            ..width = MediaQuery.of(context).size.width.toString()
            ..height = MediaQuery.of(context).size.height.toString()
            ..src = srcURL
            ..style.border = 'none'
            ..style.width = "100%"
            ..style.height = "100%"
        );

        return Column
        (
            children: 
            [
                Container
                (
                    width: MediaQuery.of(context).size.width,
                    height: 56, // Height of floating action button
                    color: App.mainBGColor
                ),
                SizedBox
                (
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 56, // Height of floating action button
                    child: HtmlElementView(viewType: viewID.toString()),
                ),
            ],
        );
    }
}
