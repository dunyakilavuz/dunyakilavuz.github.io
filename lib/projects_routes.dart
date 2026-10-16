import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/project_solarx.dart';
import 'package:dunyakilavuz_github_io/project_solarxar.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:dunyakilavuz_github_io/routes.dart';
import 'package:flutter/widgets.dart';

/// Entry point of the deferred "projects" chunk: returns the page for [name],
/// or null if it is not a projects route.
Widget? projectsPageFor(String name)
{
    if (name == Routes.projects) return const Projects();
    final Map<String, Widget Function()> pages =
    {
        ProjectSolarXAR.routeName: () => ProjectSolarXAR(),
        ProjectSolarX.routeName: () => ProjectSolarX(),
        ProjectDigitalDaragac.routeName: () => ProjectDigitalDaragac(),
    };
    return pages[name]?.call();
}
