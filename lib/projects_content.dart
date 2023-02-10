import 'package:dunyakilavuz_github_io/project_ar_works.dart';
import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/project_solarx.dart';
import 'package:dunyakilavuz_github_io/project_template.dart';
import 'package:dunyakilavuz_github_io/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectsContent extends StatefulWidget
{
  const ProjectsContent({super.key});
  @override
  State<StatefulWidget> createState() => ProjectsContentState();
}

class ProjectsContentState extends State<ProjectsContent>
{
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
                onTap: () => Navigator.of(context).pushNamed(project.route),
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
                        projectCard(ProjectDigitalDaragac()),
                        projectCard(ProjectSolarX()),
                        projectCard(ProjectARWorks()),
                    ],
                ),
            ],
        );
    }
}
