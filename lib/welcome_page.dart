import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget
{
  const WelcomePage({super.key});

  @override
    State<StatefulWidget> createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin
{
    late Animation animation;
    late AnimationController controller;

    static TextStyle? nameText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline2?.copyWith
        (
            fontSize: 90,
            fontWeight: FontWeight.w100,
        );
    }

    static TextStyle? professionText(BuildContext context) 
    {
        return Theme.of(context).textTheme.headline4?.copyWith
        (
            fontSize: 29, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 1.5,
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

    void onSliderPress()
    {
        print("Click");
    }

    @override
    void initState()
    {
        super.initState();
        controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
        animation = ColorTween(begin: Colors.amber, end: Colors.green).animate(controller)..addListener(() { setState(() {});});
    }

    @override
    void dispose() 
    {
        controller.dispose();
        super.dispose();
    }


  @override
    Widget build(BuildContext context) 
    {
        return Stack
        (
            children: 
            [
                const Particles(),
                Center
                (
                    child: Column
                    (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                            Container(height: 100,),
                            Text('Dünya', style: nameText(context)?.copyWith(letterSpacing: 40)),
                            Text('Kılavuz', style: nameText(context)?.copyWith(letterSpacing: 22)),
                            Text('M.Sc. Computer Engineer', style: professionText(context)),
                            Material
                            (
                                color: Colors.transparent,
                                child: InkWell
                                (
                                    borderRadius: BorderRadius.circular(45),
                                    highlightColor: Colors.transparent,
                                    hoverColor: const Color.fromARGB(28, 121, 121, 121),
                                    splashColor: const Color.fromARGB(14, 255, 255, 255),
                                    onTap: onSliderPress,
                                    child: Icon
                                    (
                                        Icons.keyboard_arrow_down_sharp,
                                        color: arrowDownColor.evaluate(AlwaysStoppedAnimation(controller.value)),
                                        size: 60,
                                    ),
                                ),
                            )
                        ],
                    ),
                ),
            ],
        );
    }
}