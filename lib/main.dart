import 'package:dunyakilavuz_github_io/curriculum_page.dart';
import 'package:dunyakilavuz_github_io/home_page.dart';
import 'package:dunyakilavuz_github_io/project_digital_daragac.dart';
import 'package:dunyakilavuz_github_io/project_solarx.dart';
import 'package:dunyakilavuz_github_io/project_solarxar.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

Future<void> main() async 
{
    GoogleFonts.config.allowRuntimeFetching = false;
    LicenseRegistry.addLicense(() async* 
    {
        final license = await rootBundle.loadString('fonts/LICENSE.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp
    (
        options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const App());
}

class App extends StatelessWidget 
{
    const App({super.key});
    static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

    static const Color mainBGColor = Color.fromRGBO(31, 51, 74, 1);
    static const Color secondaryBGColor = Color.fromRGBO(39,43,53, 1);

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp
        (
            title: 'Dünya Kılavuz',
            initialRoute: Home.route,
            navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics),],
            routes: 
            {
                Home.route:(context) =>  Home(analytics: analytics, observer: observer,),
                Curriculum.route:(context) => Curriculum(analytics: analytics, observer: observer,),
                Projects.route:(context) => Projects(analytics: analytics, observer: observer,), 
                    ProjectSolarXAR().route:(context) => ProjectSolarXAR(),
                    ProjectSolarX().route:(context) => ProjectSolarX(),
                    ProjectDigitalDaragac().route:(context) => ProjectDigitalDaragac(),
            },
        );
    }
}
