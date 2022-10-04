import 'package:dunyakilavuz_github_io/curriculum_content.dart';
import 'package:flutter/material.dart';

class Curriculum extends StatelessWidget
{
    const Curriculum({super.key});
    static const String route = "/curriculum";

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (
            backgroundColor: const Color.fromARGB(255, 26, 34, 44),
            body: const SingleChildScrollView
            (
                child: Center
                (
                    child: CurriculumContent(),
                ),
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
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        );
    }
}