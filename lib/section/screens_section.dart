import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class ScreensSection extends StatefulWidget {
  const ScreensSection({super.key});
  @override
  State<ScreensSection> createState() => _ScreensSectionState();
}

class _ScreensSectionState extends State<ScreensSection> {
  final _controller = PageController(viewportFraction: 0.86);

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/images/activity.png',
      'assets/images/track_activity.png',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: MaxWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Screens', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            SizedBox(
              height: isPhone(context) ? 260 : 360,
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(images[i], fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
