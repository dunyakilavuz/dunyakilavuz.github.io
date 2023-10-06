import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class Particles extends StatefulWidget
{
    @override
    State<StatefulWidget> createState() => ParticlesState();
    final int numberOfParticles;
    final Duration refreshRate;
    final Color bgColor;
    final List<Color> particleColors;
    const Particles
    ({
            super.key, 
            required this.numberOfParticles, 
            required this.refreshRate, 
            required this.bgColor, 
            required this.particleColors
    });
}

class ParticlesState extends State<Particles> with SingleTickerProviderStateMixin
{
    final Random random = Random();
    final List<ParticleModel> particles = [];
    late Timer timer;
    late Vector2 dimensions;

    @override
    void initState() 
    {
        super.initState();
        List.generate(widget.numberOfParticles, (index) 
        {
            particles.add(ParticleModel(random, widget.particleColors));
        });
    // defines a timer 
        setState(() {});
        timer = Timer.periodic
        (
            widget.refreshRate,
            (Timer t) {setState(() {});}
        );
    }

    @override
    void dispose() 
    {
        timer.cancel();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) 
    {
        dimensions = Vector2(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

        return Container
        (
            color: widget.bgColor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topLeft,
            child: CustomPaint(painter: ParticlePainter(particles, dimensions))
        );

    }
}

class ParticlePainter extends CustomPainter
{
    List<ParticleModel> particles;
    Vector2 dimensions;

    ParticlePainter(this.particles, this.dimensions);

    @override
    void paint(Canvas canvas, Size size) 
    {
        for (var particle in particles) 
        {
            particle.updateParticle(dimensions);

            canvas.drawCircle
            (
                Offset(particle.position.x, particle.position.y),
                particle.size,
                Paint()
                ..color = Color.fromRGBO(
                    particle.particleColor.red, 
                    particle.particleColor.green, 
                    particle.particleColor.blue, 
                    particle.alpha)
                ..style = PaintingStyle.fill
            );
        }
    }
 
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ParticleModel
{
    late double size;
    late double speed;
    late Vector3 direction;
    late Vector2 velocity;
    Vector2 position = Vector2.zero();
    late Random random;
    late double alpha;
    late double alphaProgress; 
    List<Color> particleColors;
    late Color particleColor;

    ParticleModel(this.random, this.particleColors)
    {
        direction = Quaternion.axisAngle(Vector3(0,0,1), random.nextDouble() * 2 * math.pi).rotate(Vector3(1,0,0));
        speed = random.nextDouble() + 2;
        velocity = direction.xy * speed;
        size = random.nextDouble() * 1 + 1.5;
        alpha = random.nextDouble();
        alphaProgress = random.nextDouble() * 0.05;
        particleColor = particleColors[random.nextInt(particleColors.length)];
    }
    
    void updateParticle(Vector2 dimensions) 
    {
        if(position == Vector2.zero())
        {
            position = Vector2(random.nextDouble() * dimensions.x, random.nextDouble() * dimensions.y);
        }

        position += velocity;
        position = Vector2
        (
            position.x % dimensions.x, 
            position.y % dimensions.y
        );

        alpha += alphaProgress;

        if(alpha > 1) 
        {
            alpha = 1;
            alphaProgress = -alphaProgress;
        }

        if(alpha < 0)
        {
            alpha = 0;
            alphaProgress = -alphaProgress;
        }

    } 
}