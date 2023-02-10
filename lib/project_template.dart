import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ProjectTemplate extends StatelessWidget
{
    final String route;
    final String title;
    final String imagePath;
    final bool isFolder;

    const ProjectTemplate
    (
        {
            super.key, 
            required this.route,
            required this.title,
            required this.imagePath,
            required this.isFolder,
        }
    );

    static TextStyle sectionText() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w100,
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

    static TextStyle cardTitleText() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.grey.shade100,
            fontSize: 30,
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
        );
    }

    static TextStyle projectDetailTitle() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
        );
    }

    static TextStyle projectDetailEntry() 
    {
        return GoogleFonts.roboto
        (
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
            height: 1.5,
        );
    }

    static TextSpan entry(String text, {Color textColor = Colors.black})
    {
        return TextSpan(text: text, style: ProjectTemplate.projectDetailEntry().copyWith(color: textColor, height: 1.5));
    }

    static WidgetSpan icon(String icon, {double width = 30, double height = 30})
    {
        return WidgetSpan
        (
            alignment: PlaceholderAlignment.middle, 
            child: SvgPicture.asset
            (
                "assets/$icon.svg", 
                width: width, 
                height: height,
            ),
        );
    }

    Widget template(BuildContext context, Function projectContent) 
    {
        return Scaffold
        (
            backgroundColor: Colors.white,
            body: Container
            (
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: projectContent(context)
            ),
            floatingActionButton: FloatingActionButton
            (
                onPressed: () =>{ Navigator.pop(context)},
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                focusColor: Colors.transparent,
                child: const Icon
                (
                    Icons.chevron_left_sharp,
                    size: 30,
                    color: Colors.black,
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        );
    }
}