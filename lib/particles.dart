import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:simple_animations/simple_animations.dart';

class Particles extends StatefulWidget
{
    @override
    State<StatefulWidget> createState() => ParticlesState();
    const Particles({super.key});
}

class ParticlesState extends State<Particles>
{
    @override
    Widget build(BuildContext context) 
    {
        return Container
        (
            color: const Color.fromARGB(255, 26, 34, 44),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: SizedBox
            (
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: CustomPaint(painter: ParticlePainter())
            ),
        );

    }
}

class ParticlePainter extends CustomPainter
{
    @override
    void paint(Canvas canvas, Size size) 
    {
        var paint = Paint()
        ..color = const Color.fromARGB(255, 68, 163, 170)
        ..style = PaintingStyle.fill;
        canvas.drawCircle(const Offset(200, 0), 100, paint);
    }
 
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
}