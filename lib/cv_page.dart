import 'package:dunyakilavuz_github_io/cv_content.dart';
import 'package:flutter/material.dart';

class CurriculumVitaePage extends StatelessWidget
{
    const CurriculumVitaePage({super.key});
    @override
    Widget build(BuildContext context) 
    {
        return Container
        (

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center
            (
                child: Column
                (
                    children: 
                    [
                        Container(height: 10,),
                        const CurriculumContent(),
                    ],
                ) 
            ),
        );
    }
}