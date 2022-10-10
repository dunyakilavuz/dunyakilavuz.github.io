import 'package:dunyakilavuz_github_io/curriculum_page.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:html' as html;

class NavButtons extends StatefulWidget
{
    const NavButtons({super.key});
    @override
    State<StatefulWidget> createState() => NavButtonsState();
}

class NavButtonsState extends State<NavButtons> with SingleTickerProviderStateMixin
{
    late Animation buttonColorAnim;
    late AnimationController buttonColorController;
    double iconSize = 35;
    static String linkedinURL = "https://www.linkedin.com/in/dunyakilavuz/";
    static String githubURL  = "https://github.com/dunyakilavuz/";
    static String mailURL = "mailto:dunyakilavuz@gmail.com";
    static String mailAddress = "dunyakilavuz@gmail.com";

    static TextStyle? buttonText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 20,
            fontWeight: FontWeight.normal,
        );
    }

    static TextStyle? notificationText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 15,
            fontWeight: FontWeight.normal,
        );
    }

    Animatable<Color?> buttonColor = TweenSequence<Color?>
    (
        [
            TweenSequenceItem
            (
                weight: 1.0,
                tween: ColorTween
                (
                    begin: Colors.red,
                    end: Colors.green,
                )
            ),

            TweenSequenceItem
            (
                weight: 1.0,
                tween: ColorTween
                (
                    begin: Colors.green,
                    end: Colors.blue,
                ),
            ),

            TweenSequenceItem
            (
                weight: 1.0,
                tween: ColorTween
                (
                    begin: Colors.blue,
                    end: Colors.red,
                ),
            ),
        ],
    );

    void onCurriculumTap()
    {
        Navigator.of(context).pushNamed(Curriculum.route);
    }

    void onProjectsTap()
    {
        Navigator.of(context).pushNamed(Projects.route);
    }

    void onMailTap()
    {
        Clipboard.setData(ClipboardData(text: mailAddress));
        notify("Mail address copied to clipboard.");
    }

    void onLinkedInTap()
    {
        html.window.open(linkedinURL, 'new tab');
        notify("Opened LinkedIn in a new tab.");
    }
    void onGithubTap()
    {
        html.window.open(githubURL, 'new tab');
        notify("Opened Github in a new tab.");
    }

    void notify(String text)
    {
        double notifyWidth = text.length * 10;
        ScaffoldMessenger.of(context).showSnackBar
        (
            SnackBar
            (
                content: Container
                (
                    alignment: Alignment.center,
                    width: notifyWidth,
                    height: 30,
                    child: Text(text, style: notificationText(context),),
                ),
                duration: const Duration(seconds: 2),
                shape: const StadiumBorder(),
                backgroundColor: Colors.blueGrey,
                behavior: SnackBarBehavior.floating,
                width: notifyWidth, 
            )
        );
    }

    SizedBox seperator(double width)
    {
        return SizedBox(width: width,);
    }

    ElevatedButton iconAndLabelButton(Icon icon, onTap, String labelText)
    {
        return  ElevatedButton.icon
        (   
            style: ElevatedButton.styleFrom
            (
                backgroundColor: const Color.fromARGB(20, 255, 255, 255), 
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder
                (
                    borderRadius: BorderRadius.circular(18.0),
                )
            ),
            onPressed: onTap, 
            icon: icon,
            label: Text
            (
                labelText,
                style: buttonText(context),
            ),
        );
    }

    Material iconOnlyButton(Icon icon, onTap)
    {
        return  Material
        (
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
            color: const Color.fromARGB(20, 255, 255, 255), 
            child: InkWell
            (
                customBorder: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                highlightColor: Colors.transparent,
                hoverColor: const Color.fromARGB(28, 121, 121, 121),
                splashColor: const Color.fromARGB(14, 255, 255, 255),
                onTap: onTap,
                child: icon
            ),
        );
    }

    Material svgOnlyButton(SvgPicture svg, onTap)
    {
        return  Material
        (
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
            color: const Color.fromARGB(20, 255, 255, 255),
            child: InkWell
            (
                customBorder: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)),
                highlightColor: Colors.transparent,
                hoverColor: const Color.fromARGB(28, 121, 121, 121),
                splashColor: const Color.fromARGB(14, 255, 255, 255),
                onTap: onTap,
                child: svg
            ),
        );
    }

    @override
    void initState()
    {
        super.initState();
        buttonColorController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
        buttonColorAnim = buttonColor.animate(buttonColorController)..addListener(() { setState(() {});});
    }

    @override
    void dispose() 
    {
        buttonColorController.dispose();
        super.dispose();
    }
    
    @override
    Widget build(BuildContext context) 
    {
        return SingleChildScrollView
        (
            scrollDirection: Axis.horizontal,
            child: Row
            (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                    iconAndLabelButton
                    (
                        Icon
                        (
                            Icons.history_edu_sharp,
                            color: buttonColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: iconSize,
                        ),
                        onCurriculumTap,
                        "Curriculum",
                    ),
                    seperator(10),
                    iconAndLabelButton
                    (
                        Icon
                        (
                            Icons.architecture_sharp,
                            color: buttonColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: iconSize,
                        ),
                        onProjectsTap,
                        "Projects",
                    ),
                    seperator(10),
                    iconOnlyButton
                    (
                        Icon
                        (
                            Icons.email_outlined,
                            color: buttonColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: iconSize,
                        ),
                        onMailTap
                    ),
                    seperator(10),
                    svgOnlyButton
                    (
                        SvgPicture.asset
                        (
                            "assets/linkedin_icon.svg",
                            color: buttonColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            width: iconSize,
                            height: iconSize,
                        ),
                        onLinkedInTap
                    ),
                    seperator(10),
                    svgOnlyButton
                    (
                        SvgPicture.asset
                        (
                            "assets/github_icon.svg",
                            color: buttonColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            width: iconSize,
                            height: iconSize,
                        ),
                        onGithubTap
                    ),
                ],
            )
        );
    }
}