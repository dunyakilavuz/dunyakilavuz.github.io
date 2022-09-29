import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CurriculumVitaePage extends StatelessWidget
{
    const CurriculumVitaePage({super.key});

    static TextStyle? sectionText (BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 30, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1.5,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    static TextStyle? entryText (BuildContext context)
    {
        return Theme.of(context).textTheme.bodyText1?.copyWith
        (
            fontSize: 18, 
            fontWeight: FontWeight.w300, 
            letterSpacing: 1,
            color: const Color.fromARGB(255, 26, 34, 44),
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox
        (
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column
            (
                children: 
                [
                    Container(height: 10,),
                    FutureBuilder
                    (
                        future: rootBundle.loadString("assets/cv.md"),
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) 
                        {
                            if (snapshot.hasData) 
                            {
                                return Markdown
                                (
                                    shrinkWrap: true,
                                    selectable: true,
                                    data: snapshot.data.toString(),
                                    styleSheet: MarkdownStyleSheet
                                    (
                                        h1: sectionText(context),
                                        p: entryText(context),
                                    ),
                                );
                            }

                            return const Center
                            (
                                child: CircularProgressIndicator(),
                            );
                    }),
                ],
            ),
        );
    }
}