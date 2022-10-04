import 'dart:html';

import 'package:dunyakilavuz_github_io/curriculum_page.dart';
import 'package:dunyakilavuz_github_io/projects_page.dart';
import 'package:flutter/material.dart';

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

    static TextStyle? buttonText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 15,
            fontWeight: FontWeight.normal,
        );
    }

    Animatable<Color?> arrowDownColor = TweenSequence<Color?>
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
        print("Mail");
    }

    void onLinkedInTap()
    {
        print("LinkedIn");
    }
    void onGithubTap()
    {
        print("Github");
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
            color: const Color.fromARGB(20, 255, 255, 255),
            child: InkWell
            (
                borderRadius: BorderRadius.circular(45),
                highlightColor: Colors.transparent,
                hoverColor: const Color.fromARGB(28, 121, 121, 121),
                splashColor: const Color.fromARGB(14, 255, 255, 255),
                onTap: onTap,
                child: icon
            ),
        );
    }

    @override
    void initState()
    {
        super.initState();
        buttonColorController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
        buttonColorAnim = arrowDownColor.animate(buttonColorController)..addListener(() { setState(() {});});
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
        return Container
        (
            alignment: Alignment.center,
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
                            color: arrowDownColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: 30,
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
                            color: arrowDownColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: 30,
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
                            color: arrowDownColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: 30,
                        ),
                        onMailTap
                    ),
                    seperator(10),
                    iconOnlyButton
                    (
                        Icon
                        (
                            Icons.keyboard_arrow_down_sharp,
                            color: arrowDownColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: 30,
                        ),
                        onLinkedInTap
                    ),
                    seperator(10),
                    iconOnlyButton
                    (
                        Icon
                        (
                            Icons.keyboard_arrow_down_sharp,
                            color: arrowDownColor.evaluate(AlwaysStoppedAnimation(buttonColorController.value)),
                            size: 30,
                        ),
                        onGithubTap,
                    ),
                ],
            )
        );
    }
}