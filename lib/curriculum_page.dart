import 'package:dunyakilavuz_github_io/curriculum_content.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class Curriculum extends StatelessWidget
{
    const Curriculum({super.key, required this.analytics, required this.observer});
    static const String route = "/curriculum";
    final FirebaseAnalytics analytics;
    final FirebaseAnalyticsObserver observer;
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold
        (
            backgroundColor: Colors.white,
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
                    color: Colors.white,
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        );
    }
}