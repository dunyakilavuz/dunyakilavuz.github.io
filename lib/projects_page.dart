import 'package:dunyakilavuz_github_io/projects_content.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget
{
    const Projects({super.key});
    static const String route = "/projects";
    @override
    State<StatefulWidget> createState() => ProjectsState();
}

class ProjectsState extends State<Projects>
{
  @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (
            backgroundColor: Colors.amber,
            body: const SingleChildScrollView
            (
                child: Center
                (
                    child: ProjectsContent(),
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