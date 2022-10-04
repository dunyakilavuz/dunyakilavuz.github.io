import 'package:flutter/material.dart';

class ProjectsContent extends StatefulWidget
{
  const ProjectsContent({super.key});
  @override
  State<StatefulWidget> createState() => ProjectsContentState();
}

class ProjectsContentState extends State<ProjectsContent>
{
    static TextStyle? nameText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 45,
            fontWeight: FontWeight.w100,
        );
    }


    @override
    Widget build(BuildContext context) 
    {
        return Container
        (
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.amber,
            child: Column
            (
                children: 
                [
                    Expanded(child: Container()),
                    Text("UNDER CONSTRUCTION",style: nameText(context),),
                    Expanded(child: Container()),
                ],
            )
        );
    }
    
}