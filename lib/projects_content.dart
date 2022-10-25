import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProjectTemplate extends StatelessWidget
{
    final String route;
    final String title;
    final String imagePath;
    final Color cardColor;
    final Widget projectContent;

    const ProjectTemplate
    (
        {
            super.key, 
            required this.route, 
            required this.title,
            required this.imagePath,
            required this.cardColor,
            required this.projectContent,
        }
    );

    @override
    Widget build(BuildContext context) 
    {
        return Padding
        (
            padding: const EdgeInsets.all(20.0),
            child: projectContent
        );
    }
}

class ProjectsContent extends StatefulWidget
{
  const ProjectsContent({super.key});
  @override
  State<StatefulWidget> createState() => ProjectsContentState();
}

class ProjectsContentState extends State<ProjectsContent>
{
    ProjectTemplate digitalDaragacProject = ProjectTemplate
    (
        route: "/digitaldaragac",
        title: "Digital Daragac",
        imagePath: "assets/digitaldaragac.png",
        cardColor: Colors.black38,
        projectContent: projectDigitalDaragac(),
    );

    ProjectTemplate lensStudioProjects = ProjectTemplate
    (
        route: "/snapchatlensstudio",
        title: "Lens Studio",
        imagePath: "assets/lensstudio.png",
        cardColor: Colors.black38,
        projectContent: projectDigitalDaragac(),
    );



    static TextStyle sectionText(BuildContext context) 
    {
        return GoogleFonts.roboto
        (
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
        );
    }

    static TextStyle cardTitleText(BuildContext context) 
    {
        return GoogleFonts.roboto
        (
            color: Colors.grey.shade100,
            fontSize: 30,
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
        );
    }

    void displayProject(ProjectTemplate project)
    {
        showDialog
        (
            context: Navigator.of(context).context,
            routeSettings: RouteSettings(name: project.route),
            builder: (BuildContext context) 
            {
                return Dialog
                (
                    shape: RoundedRectangleBorder
                    (
                        borderRadius:BorderRadius.circular(15.0)
                    ),
                    child: project
                );
            }
        );
    }

    Widget projectCard(ProjectTemplate project)
    {
        BorderRadius radius = const BorderRadius.all(Radius.circular(15));
        double boxSize = 250;
        return Material
        (
            color: project.cardColor,
            borderRadius: radius,
            child: InkWell
            (
                borderRadius: radius,
                onTap: () => displayProject(project),
                child: Container
                (
                    decoration: BoxDecoration
                    (
                        borderRadius: radius,
                        color: project.cardColor,
                    ),
                    width: boxSize,
                    height: boxSize,
                    child: Column
                    (
                        children: 
                        [
                            Expanded(child: Container()),
                            ClipRRect
                            (
                                borderRadius: radius,
                                child: Image.asset
                                (
                                    project.imagePath,
                                    width: 100,
                                    height: 100,
                                )
                            ),
                            Utils.columnSeperator(10),
                            Text(project.title, style: cardTitleText(context),),
                            Expanded(child: Container()),
                        ],
                    ),
                )
            ),
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return SingleChildScrollView
        (
            child: Column
            (
                children: 
                [
                    Utils.columnSeperator(10),
                    Row
                    (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: 
                        [
                            const Icon
                            (
                                Icons.architecture_outlined,
                                color: Colors.black,
                                size: 35,
                            ),
                            Text("Projects",style: sectionText(context),),
                        ]
                    ),
                    Utils.columnSeperator(50),
                    Wrap
                    (
                        spacing: 10,
                        runSpacing: 10,
                        children: 
                        [
                            projectCard(digitalDaragacProject),
                            projectCard(lensStudioProjects),
                        ],
                    ),
                ],
            )
        );
    }
}
