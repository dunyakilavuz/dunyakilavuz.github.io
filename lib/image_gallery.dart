import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Scroll behavior that lets every pointer type drag scrollables, so the
/// galleries (and pages) can be scrolled by mouse drag on desktop as well as
/// by touch, stylus and trackpad.
class AppScrollBehavior extends MaterialScrollBehavior
{
    const AppScrollBehavior();

    @override
    Set<PointerDeviceKind> get dragDevices => const
    {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        PointerDeviceKind.unknown,
    };
}

/// Snaps to multiples of [itemExtent] after a drag or fling ends.
class SnapScrollPhysics extends ScrollPhysics
{
    const SnapScrollPhysics({required this.itemExtent, super.parent});

    final double itemExtent;

    @override
    SnapScrollPhysics applyTo(ScrollPhysics? ancestor) =>
        SnapScrollPhysics(itemExtent: itemExtent, parent: buildParent(ancestor));

    double _targetPixels(ScrollMetrics position, Tolerance tolerance, double velocity)
    {
        double item = position.pixels / itemExtent;
        if (velocity < -tolerance.velocity) 
        {
            item -= 0.5;
        }
        else if (velocity > tolerance.velocity) 
        {
            item += 0.5;
        }
        final double target = item.roundToDouble() * itemExtent;
        return target.clamp(position.minScrollExtent, position.maxScrollExtent);
    }

    @override
    Simulation? createBallisticSimulation(ScrollMetrics position, double velocity)
    {
        // Let the parent handle overscroll at the edges.
        if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
            (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
        {
            return super.createBallisticSimulation(position, velocity);
        }
        final Tolerance tolerance = toleranceFor(position);
        final double target = _targetPixels(position, tolerance, velocity);
        if ((target - position.pixels).abs() < tolerance.distance) return null;
        return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    }

    @override
    bool get allowImplicitScrolling => false;
}

/// Horizontal screenshot gallery: drag with mouse/touch/trackpad, fling with
/// momentum and snap per image. Vertical mouse-wheel scrolling passes through
/// to the page.
class ImageGallery extends StatefulWidget
{
    const ImageGallery({super.key, required this.images, required this.height});

    final List<String> images;
    final double height;

    static const double margin = 20;

    @override
    State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery>
{
    final ScrollController _controller = ScrollController();
    ImageStream? _stream;
    ImageStreamListener? _listener;
    double? _aspectRatio; // width / height of the gallery images.
    bool _dragging = false;

    @override
    void didChangeDependencies()
    {
        super.didChangeDependencies();
        if (_stream == null && widget.images.isNotEmpty)
        {
            // All images of a gallery share one orientation, so the first one
            // gives the item width used for snapping.
            _stream = AssetImage(widget.images.first).resolve(createLocalImageConfiguration(context));
            _listener = ImageStreamListener((info, _)
            {
                if (!mounted) return;
                setState(() => _aspectRatio = info.image.width / info.image.height);
            });
            _stream!.addListener(_listener!);
        }
    }

    @override
    void dispose()
    {
        if (_listener != null) _stream?.removeListener(_listener!);
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        const double margin = ImageGallery.margin;
        final double imageHeight = widget.height - 2 * margin;
        final double? itemExtent = _aspectRatio == null ? null : imageHeight * _aspectRatio! + 2 * margin;
        final ScrollPhysics physics = itemExtent == null
            ? const BouncingScrollPhysics()
            : SnapScrollPhysics(itemExtent: itemExtent, parent: const BouncingScrollPhysics());

        return Container
        (
            height: widget.height,
            decoration: BoxDecoration
            (
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: ScrollConfiguration
            (
                behavior: const AppScrollBehavior(),
                child: MouseRegion
                (
                    cursor: _dragging ? SystemMouseCursors.grabbing : SystemMouseCursors.grab,
                    child: Listener
                    (
                        onPointerDown: (_) => setState(() => _dragging = true),
                        onPointerUp: (_) => setState(() => _dragging = false),
                        onPointerCancel: (_) => setState(() => _dragging = false),
                        child: Scrollbar
                        (
                            controller: _controller,
                            thumbVisibility: true,
                            thickness: 6,
                            radius: const Radius.circular(3),
                            child: ListView.builder
                            (
                                controller: _controller,
                                scrollDirection: Axis.horizontal,
                                physics: physics,
                                itemExtent: itemExtent,
                                itemCount: widget.images.length,
                                itemBuilder: (context, index)
                                {
                                    return Container
                                    (
                                        color: Colors.grey,
                                        margin: const EdgeInsets.all(margin),
                                        child: Image.asset
                                        (
                                            widget.images[index],
                                            height: imageHeight,
                                            fit: BoxFit.contain,
                                            // Decode at display size instead of full resolution.
                                            cacheHeight: (imageHeight * MediaQuery.devicePixelRatioOf(context)).round(),
                                        ),
                                    );
                                },
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}
