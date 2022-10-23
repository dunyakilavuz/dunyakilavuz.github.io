import 'package:dunyakilavuz_github_io/digital_daragac_modal.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';

class ProjectsContent extends StatefulWidget
{
  const ProjectsContent({super.key});
  @override
  State<StatefulWidget> createState() => ProjectsContentState();
}

class ProjectsContentState extends State<ProjectsContent>
{
    static TextStyle sectionText(BuildContext context) 
    {
        return TextStyle
        (
            fontFamily: "SF Pro",
            color: Colors.grey.shade100,
            fontSize: 35,
            fontWeight: FontWeight.w100,
        );
    }

    void onTap()
    {
        print("Tap");
        displayProject();
    }
    void displayProject(Widget project)
    {
        showDialog
        (
            context: Navigator.of(context).context,
            routeSettings: const RouteSettings(name: "/dialog"),
            builder: (BuildContext context) 
            {
                return Dialog
                (
                    shape: RoundedRectangleBorder
                    (
                        borderRadius:BorderRadius.circular(15.0)
                    ),
                    child: digitalDaragacModal()
                );
            }
        );
    }

    static Widget projectItem(Color color ,onTap)
    {
        return Material
        (
            color: color,
            child: InkWell
            (
                onTap: onTap,
                child: Container
                (
                    width: 100,
                    height: 100,
                    color: color,
                )
            ),
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Container
        (
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey,
            child: Column
            (
                children: 
                [
                    Utils.columnSeperator(10),
                    Text("Projects",style: sectionText(context),),
                    Utils.columnSeperator(10),
                    Wrap
                    (
                        children: 
                        [
                            projectItem(Colors.grey.shade300, onTap),
                        ],
                    )
                ],
            )
        );
    }
}