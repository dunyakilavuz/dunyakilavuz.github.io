import 'package:dunyakilavuz_github_io/curriculum_page.dart';
import 'package:dunyakilavuz_github_io/home_page.dart';
import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/project_solarx.dart';
import 'package:dunyakilavuz_github_io/project_solarxar.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async 
{
    GoogleFonts.config.allowRuntimeFetching = false;
    LicenseRegistry.addLicense(() async* 
    {
        final license = await rootBundle.loadString('fonts/LICENSE.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    WidgetsFlutterBinding.ensureInitialized();
    runApp(const App());
}

class App extends StatelessWidget 
{
    const App({super.key});

    static const Color mainBGColor = Color.fromRGBO(31, 51, 74, 1);
    static const Color secondaryBGColor = Color.fromRGBO(39,43,53, 1);

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp
        (
            title: 'Dünya Kılavuz',
            initialRoute: Home.route,
            navigatorObservers: const [],
            routes: 
            {
                Home.route:(context) =>  const Home(),
                Curriculum.route:(context) => const Curriculum(),
                Projects.route:(context) => const Projects(), 
                    ProjectSolarXAR().route:(context) => ProjectSolarXAR(),
                    ProjectSolarX().route:(context) => ProjectSolarX(),
                    ProjectDigitalDaragac().route:(context) => ProjectDigitalDaragac(),
            },
        );
    }
}
