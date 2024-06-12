import 'package:dunyakilavuz_github_io/main.dart';
import 'package:dunyakilavuz_github_io/projects_content.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget
{
    const Projects({super.key, required this.analytics, required this.observer});
    static const String route = "/projects";
    final FirebaseAnalytics analytics;
    final FirebaseAnalyticsObserver observer;
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
            body: Column
            (
                children: 
                [
                    Container
                    (
                        width: MediaQuery.of(context).size.width,
                        height: 56, // Height of floating action button
                        color: App.mainBGColor
                    ),
                    const SingleChildScrollView
                    (
                        child: Center
                        (
                            child: ProjectsContent(),
                        ),
                    ),
                ],
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
                    color: Colors.white,
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        );
    }
}