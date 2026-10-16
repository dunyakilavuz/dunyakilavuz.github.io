import 'dart:math' as math;
import 'dart:math' show Random;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    // Notifies the painter to repaint without rebuilding the widget tree.
    final ValueNotifier<int> repaint = ValueNotifier<int>(0);
    late final Ticker ticker;
    Vector2 dimensions = Vector2(1, 1);
    Duration lastStep = Duration.zero;

    @override
    void initState() 
    {
        super.initState();
        for (int i = 0; i < widget.numberOfParticles; i++)
        {
            particles.add(ParticleModel(random, widget.particleColors));
        }
        ticker = createTicker(onTick)..start();
    }

    // Advance the simulation in fixed steps of [refreshRate] so motion speed
    // is independent of the display refresh rate.
    void onTick(Duration elapsed)
    {
        final int stepUs = widget.refreshRate.inMicroseconds;
        int steps = 0;
        while (elapsed - lastStep >= widget.refreshRate && steps < 5)
        {
            for (final particle in particles) 
            {
                particle.updateParticle(dimensions);
            }
            lastStep += Duration(microseconds: stepUs);
            steps++;
        }
        if (elapsed - lastStep >= widget.refreshRate) lastStep = elapsed; // Skip backlog after tab was hidden.
        if (steps > 0) repaint.value++;
    }

    @override
    void dispose() 
    {
        ticker.dispose();
        repaint.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) 
    {
        final Size size = MediaQuery.sizeOf(context);
        dimensions = Vector2(size.width, size.height);

        return Container
        (
            color: widget.bgColor,
            width: size.width,
            height: size.height,
            alignment: Alignment.topLeft,
            child: RepaintBoundary
            (
                child: CustomPaint(painter: ParticlePainter(particles, dimensions, repaint)),
            ),
        );
    }
}

class ParticlePainter extends CustomPainter
{
    final List<ParticleModel> particles;
    final Vector2 dimensions;
    final Paint _paint = Paint()..style = PaintingStyle.fill;

    ParticlePainter(this.particles, this.dimensions, Listenable repaint) : super(repaint: repaint);

    @override
    void paint(Canvas canvas, Size size) 
    {
        for (final particle in particles) 
        {
            if (particle.position == Vector2.zero()) continue;
            _paint.color = particle.particleColor.withValues(alpha: particle.alpha);
            canvas.drawCircle
            (
                Offset(particle.position.x, particle.position.y),
                particle.size,
                _paint,
            );
        }
    }
 
    @override
    bool shouldRepaint(ParticlePainter oldDelegate) => oldDelegate.dimensions != dimensions;
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