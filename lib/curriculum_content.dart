import 'package:dunyakilavuz_github_io/main.dart';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;

class CurriculumContent extends StatelessWidget
{
    const CurriculumContent({super.key});

    static const String viewType = 'cv-iframe';
    static const String srcURL = 'cv.html';
    static bool _registered = false;

    static void _registerViewFactory()
    {
        if (_registered) return;
        _registered = true;
        ui_web.platformViewRegistry.registerViewFactory(
            viewType,
            (int viewID)
            {
                final iframe = web.HTMLIFrameElement()
                    ..src = srcURL
                    ..title = 'Curriculum Vitae';
                iframe.style
                    ..border = 'none'
                    ..width = '100%'
                    ..height = '100%';
                return iframe;
            },
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        _registerViewFactory();
        final Size size = MediaQuery.sizeOf(context);

        return Column
        (
            children: 
            [
                Container
                (
                    width: size.width,
                    height: 56, // Height of floating action button
                    color: App.mainBGColor
                ),
                SizedBox
                (
                    width: size.width,
                    height: size.height - 56, // Height of floating action button
                    child: const HtmlElementView(viewType: viewType),
                ),
            ],
        );
    }
}
