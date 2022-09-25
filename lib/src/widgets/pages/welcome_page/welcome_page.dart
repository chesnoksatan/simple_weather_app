import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/widgets/pages/welcome_page/items.dart';
import 'package:simple_weather_app/src/widgets/pages/welcome_page/slide.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  final VoidCallback? onExit;

  const WelcomePage({super.key, this.onExit});

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: items.length,
          itemBuilder: (context, index) => Slide(
            header: items[index]["header"]!,
            description: items[index]["description"]!,
            asset: items[index]["asset"]!,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => widget.onExit?.call(),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: items.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 14,
                    dotWidth: 14,
                    spacing: 5,
                    activeDotColor: Color(0xFF484B5B),
                    dotColor: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_pageController.page == items.length - 1) {
                      widget.onExit?.call();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  icon: const Icon(Icons.navigate_next),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
