import 'package:flutter/material.dart';
import 'package:untitled/core/max_width.dart';

class ScreensSection extends StatefulWidget {
  const ScreensSection({super.key});

  @override
  State<ScreensSection> createState() => _ScreensSectionState();
}

class _ScreensSectionState extends State<ScreensSection> {
  final _controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    final screenshots = [
      ScreenshotData(
        imageAsset: 'assets/images/activity.png',
        title: 'Activity Tracking',
        description: 'Intuitive interface for logging all baby activities',
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6B9D), Color(0xFFC44569)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      ScreenshotData(
        imageAsset: 'assets/images/history.png',
        title: 'History Timeline',
        description: 'Beautiful timeline view of all recorded activities',
        gradient: const LinearGradient(
          colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      ScreenshotData(
        imageAsset: 'assets/images/recipe.png',
        title: 'Baby Food Recipes',
        description: 'Age-appropriate recipes with nutritional information',
        gradient: const LinearGradient(
          colors: [Color(0xFFFFD93D), Color(0xFFFF8C42)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      ScreenshotData(
        imageAsset: 'assets/images/sound.png',
        title: 'Relaxing Sounds',
        description: 'Curated collection of soothing sounds for baby',
        gradient: const LinearGradient(
          colors: [Color(0xFFA8E6CF), Color(0xFFDCEDC1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenWidth < 640 ? 40 : 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.primary.withOpacity(0.03),
            Theme.of(context).colorScheme.secondary.withOpacity(0.05),
            Theme.of(context).colorScheme.tertiary.withOpacity(0.02),
          ],
          stops: const [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative background elements
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary.withOpacity(0.08),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.03),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.tertiary.withOpacity(0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Main content
          MaxWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section header
                Container(
                  margin: EdgeInsets.only(bottom: screenWidth < 640 ? 32 : 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '📱 Screenshots',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'See Sara in Action',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Experience our beautifully designed interface that makes baby tracking simple and intuitive.',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                // Responsive layout: horizontal scroll on mobile, grid on desktop/tablet
                if (screenWidth < 640)
                  _buildHorizontalScrollView(context, screenshots)
                else
                  _buildGridView(context, screenshots),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScrollView(BuildContext context, List<ScreenshotData> screenshots) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth < 480 ? 16 : 20),
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              final screenshot = screenshots[index];
              return Container(
                width: screenWidth * 0.75, // Show more of the next card
                margin: EdgeInsets.only(right: screenWidth < 480 ? 16 : 20),
                child: _buildScreenshotCard(context, screenshot),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Enhanced scroll indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.swipe_left,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Swipe',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.swipe_right,
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselView(BuildContext context, List<ScreenshotData> screenshots) {
    return Column(
      children: [
        SizedBox(
          height: 450, // Reduced height from 600 to 450 (25% smaller)
          child: PageView.builder(
            controller: _controller,
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              final screenshot = screenshots[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: _buildScreenshotCard(context, screenshot),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        // Enhanced dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            screenshots.length,
            (index) => Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(BuildContext context, List<ScreenshotData> screenshots) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getGridCrossAxisCount(context),
        crossAxisSpacing: screenWidth < 480 ? 8 : (screenWidth < 640 ? 10 : 20),
        mainAxisSpacing: screenWidth < 480 ? 8 : (screenWidth < 640 ? 10 : 20),
        childAspectRatio: _getAspectRatio(screenWidth),
      ),
      itemCount: screenshots.length,
      itemBuilder: (context, index) {
        return _buildScreenshotCard(context, screenshots[index]);
      },
    );
  }

  int _getGridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 640) return 1; // Mobile - single column
    if (width < 900) return 2; // Small tablet - 2 columns
    if (width < 1200) return 2; // Large tablet - 2 columns  
    return 2; // Desktop - 2x2 grid (2 columns)
  }

  double _getAspectRatio(double width) {
    // Simple aspect ratios for phone screenshots
    if (width < 640) return 0.8; // Mobile - good for phone screenshots
    if (width < 900) return 0.8; // Small tablet - same as mobile
    if (width < 1200) return 0.8; // Large tablet - same as mobile
    return 0.8; // Desktop - same ratio for consistency
  }

  Widget _buildPhoneMockup(BuildContext context, String imageAsset) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          width: 200, // Fixed width for phone mockup
          height: 400, // Fixed height for phone mockup (2:1 ratio)
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Phone frame
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                  color: Colors.grey[100],
                ),
              ),
              
              // Screen content
              Padding(
                padding: const EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(19),
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageGallery(BuildContext context, String currentImage) {
    final screenshots = [
      'assets/images/activity.png',
      'assets/images/history.png', 
      'assets/images/recipe.png',
      'assets/images/sound.png',
    ];
    
    final initialIndex = screenshots.indexOf(currentImage);
    
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ImageGalleryModal(
        images: screenshots,
        initialIndex: initialIndex >= 0 ? initialIndex : 0,
      ),
    );
  }

  Widget _buildScreenshotCard(BuildContext context, ScreenshotData screenshot) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;
    
    return HoverableScreenshotCard(
      gradient: screenshot.gradient,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phone mockup with screenshot
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () => _showImageGallery(context, screenshot.imageAsset),
                child: Container(
                  margin: EdgeInsets.all(isMobile ? 12 : 16),
                  child: _buildPhoneMockup(context, screenshot.imageAsset),
                ),
              ),
            ),

            // Screenshot info
            Container(
              height: isMobile ? 100 : 110, // Balanced height matching hero section proportions
              padding: EdgeInsets.fromLTRB(
                isMobile ? 16 : 20,
                isMobile ? 12 : 16,
                isMobile ? 16 : 20,
                isMobile ? 12 : 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    screenshot.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: isMobile ? 15 : 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: isMobile ? 6 : 8),
                  Expanded(
                    child: Text(
                      screenshot.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        height: 1.2,
                        fontSize: isMobile ? 12 : 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableScreenshotCard extends StatefulWidget {
  final Widget child;
  final LinearGradient gradient;

  const HoverableScreenshotCard({
    super.key,
    required this.child,
    required this.gradient,
  });

  @override
  State<HoverableScreenshotCard> createState() => _HoverableScreenshotCardState();
}

class _HoverableScreenshotCardState extends State<HoverableScreenshotCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: _isHovered
              ? Matrix4.translationValues(0, -4, 0)
              : Matrix4.identity(),
          decoration: _isHovered
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: widget.gradient.colors.first.withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: widget.gradient.colors.last.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
          child: widget.child,
        ),
      ),
    );
  }
}

class ImageGalleryModal extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageGalleryModal({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ImageGalleryModal> createState() => _ImageGalleryModalState();
}

class _ImageGalleryModalState extends State<ImageGalleryModal> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Close button
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            
            // Image viewer
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Page indicator
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            
            // Navigation arrows
            if (_currentIndex > 0)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            
            if (_currentIndex < widget.images.length - 1)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 28,
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

class ScreenshotData {
  final String imageAsset;
  final String title;
  final String description;
  final LinearGradient gradient;

  const ScreenshotData({
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.gradient,
  });
}
