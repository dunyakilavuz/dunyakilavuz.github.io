import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/project_solarx.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectTemplate extends StatelessWidget
{
    final String route;
    final String title;
    final String imagePath;
    final StatelessWidget projectContent;

    const ProjectTemplate
    (
        {
            super.key, 
            required this.route, 
            required this.title,
            required this.imagePath,
            required this.projectContent,
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
        projectContent: ProjectDigitalDaragac(),
    );

    ProjectTemplate solarxProject = ProjectTemplate
    (
        route: "/solarx",
        title: "Solar X",
        imagePath: "assets/solarx-logo.png",
        projectContent: ProjectSolarX(),
    );

    ProjectTemplate arProjects = ProjectTemplate
    (
        route: "/arprojects",
        title: "AR Projects",
        imagePath: "assets/ar-logo.svg",
        projectContent: ProjectDigitalDaragac(),
    );

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
                    child: SingleChildScrollView
                    (
                        scrollDirection: Axis.vertical,
                        child: project,
                    )
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
            color: const Color.fromARGB(255, 26, 34, 44),
            borderRadius: radius,
            child: InkWell
            (
                borderRadius: radius,
                onTap: () => displayProject(project),
                hoverColor: const Color.fromARGB(255, 36, 48, 61),
                child: Container
                (
                    decoration: BoxDecoration
                    (
                        borderRadius: radius,
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
                                child: project.imagePath.endsWith(".svg") ?
                                SvgPicture.asset
                                (
                                    project.imagePath,
                                    color: Colors.white,
                                    width: 100,
                                    height: 100,
                                )
                                :
                                Image.asset
                                (
                                    project.imagePath,
                                    width: 100,
                                    height: 100,
                                )
                            ),
                            Utils.columnSeperator(10),
                            Text(project.title, style: ProjectTemplate.cardTitleText(),),
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
        return Column
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
                        Text("Projects",style: ProjectTemplate.sectionText(),),
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
                        projectCard(solarxProject),
                        //projectCard(arProjects),
                    ],
                ),
            ],
        );
    }
}
