import 'package:dunyakilavuz_github_io/particles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget 
{
	const Home({super.key, required this.title});
	final String title;
	@override
	State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin
{
    late Animation animation;
    late AnimationController controller;

    void _incrementCounter() 
    {
        setState(() 
        {

        });
    }

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
            fontSize: 35, 
            fontWeight: FontWeight.bold, 
            letterSpacing: 5,
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
        return Scaffold
        (
            body: Stack
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
                                Expanded(child: Container(),),
                                Text('Dünya', style: nameText(context)?.copyWith(letterSpacing: 40)),
                                Text('Kılavuz', style: nameText(context)?.copyWith(letterSpacing: 22)),
                                Text('Software Engineer', style: professionText(context)),
                                Expanded(child: Container(),),
                                ElevatedButton.icon
                                (
                                    label: const Text(""),
                                    onPressed: onSliderPress, 
                                    icon: Icon
                                    (
                                        Icons.keyboard_arrow_down_sharp,
                                        color: arrowDownColor.evaluate(AlwaysStoppedAnimation(controller.value)),
                                        size: 60,
                                    ), 
                                    style: ElevatedButton.styleFrom
                                    (
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0),),
                                        alignment: Alignment.center,
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
            floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            ),
        );
    }    
}
