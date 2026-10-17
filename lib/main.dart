import 'package:dunyakilavuz_github_io/curriculum_page.dart' deferred as curriculum;
import 'package:dunyakilavuz_github_io/home_page.dart';
import 'package:dunyakilavuz_github_io/image_gallery.dart';
import 'package:dunyakilavuz_github_io/projects_routes.dart' deferred as projects;
import 'package:dunyakilavuz_github_io/routes.dart';
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

    /// Curriculum and project pages live in deferred chunks that are only
    /// downloaded when first visited, keeping the initial bundle small.
    static Route<dynamic>? onGenerateRoute(RouteSettings settings)
    {
        final String name = settings.name ?? Routes.home;
        if (name == Routes.home) 
        {
            return MaterialPageRoute(settings: settings, builder: (_) => const Home());
        }
        if (name == Routes.curriculum)
        {
            return MaterialPageRoute
            (
                settings: settings,
                builder: (_) => DeferredPage(load: curriculum.loadLibrary, builder: () => curriculum.Curriculum()),
            );
        }
        if (name.startsWith(Routes.projects))
        {
            return MaterialPageRoute
            (
                settings: settings,
                builder: (_) => DeferredPage
                (
                    load: projects.loadLibrary,
                    builder: () => projects.projectsPageFor(name) ?? const Home(),
                ),
            );
        }
        return MaterialPageRoute(settings: settings, builder: (_) => const Home());
    }

    @override
    Widget build(BuildContext context) 
    {
        return const MaterialApp
        (
            title: 'Dünya Kılavuz',
            initialRoute: Routes.home,
            onGenerateRoute: onGenerateRoute,
            scrollBehavior: AppScrollBehavior(),
        );
    }
}

/// Shows a placeholder while a deferred library downloads, then builds the page.
class DeferredPage extends StatefulWidget
{
    const DeferredPage({super.key, required this.load, required this.builder});
    final Future<void> Function() load;
    final Widget Function() builder;

    @override
    State<DeferredPage> createState() => _DeferredPageState();
}

class _DeferredPageState extends State<DeferredPage>
{
    late final Future<void> _future = widget.load();

    @override
    Widget build(BuildContext context)
    {
        return FutureBuilder<void>
        (
            future: _future,
            builder: (context, snapshot)
            {
                if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError)
                {
                    return widget.builder();
                }
                return const ColoredBox
                (
                    color: App.mainBGColor,
                    child: Center(child: CircularProgressIndicator(color: Colors.white)),
                );
            },
        );
    }
}
