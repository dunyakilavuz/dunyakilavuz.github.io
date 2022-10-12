import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class Particles extends StatefulWidget
{
    @override
    State<StatefulWidget> createState() => ParticlesState();
    final int numberOfParticles;
    const Particles({super.key, required this.numberOfParticles});
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
            particles.add(ParticleModel(random));
        });
    // defines a timer 
        timer = Timer.periodic
        (
            const Duration(milliseconds: 20), (Timer t) 
            {
                setState(() {});
            }
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        dimensions = Vector2(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

        return Container
        (
            color: const Color.fromARGB(255, 26, 34, 44),
            width: dimensions.x,
            height: dimensions.y,
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
                ..color = Color.fromRGBO(30, 60, 90, particle.alpha)
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
    late Vector2 direction;
    late Vector2 velocity;
    Vector2 position = Vector2.zero();
    late Random random;
    late double alpha;
    late double alphaProgress; 

    ParticleModel(this.random)
    {
        direction = Vector2(random.nextDouble(), random.nextDouble()).normalized();
        direction = random.nextDouble() < 0.5 ? direction : -direction;
        speed = random.nextDouble() * 3 + 1;
        velocity = direction * speed;
        size = random.nextDouble() * 5 + 5;
        alpha = random.nextDouble();
        alphaProgress = random.nextDouble() * 0.05;
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