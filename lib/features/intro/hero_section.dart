import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_portfolio/shared/widgets/custom_button.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  const HeroSection({super.key, required this.onViewWork});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: _buildMobileLayout(context),
      desktopBody: _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "👋 Hi, I'm Mutahira.",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary, 
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(),
                const SizedBox(height: 20),
                SizedBox(
                  height: 135, 
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Building Cross-Platform Apps\n& Intelligent Models.",
                        textStyle: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Flutter Developer | Machine Learning Enthusiast",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), 
                  ),
                ).animate(delay: 1000.ms).fadeIn().slideY(begin: 0.2, end: 0),
                const SizedBox(height: 40),
                Row(
                  children: [
                    CustomButton(
                      label: "Download Resume",
                      icon: FontAwesomeIcons.download,
                      onPressed: () async {
final url=Uri.parse("https://raw.githubusercontent.com/mutahiraasadd-hub/my-resume/main/mutahira's_cv.pdf");

if(await canLaunchUrl(url)){
  await launchUrl(url,mode: LaunchMode.externalApplication);
}
else{
  debugPrint('Could not launch resume URL');
}

                      }, 
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      label: "View Work",
                      isOutlined: true,
                      onPressed: onViewWork,
                    ),
                  ],
                ).animate(delay: 1200.ms).fadeIn().slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
          
          // --- DESKTOP ROBOT ANIMATION ---
          Expanded(
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3), // The physical circle
                ),
                child: Icon(
                  FontAwesomeIcons.robot,
                  size: 150,
                  color: Theme.of(context).colorScheme.primary, // Base brown color
                )
                // 1. Robot Icon Animation (using .tint removes the square block)
                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                .tint(
                  color: const Color(0xFFC67A3D), // Tints into glowing copper
                  duration: 1500.ms,
                  curve: Curves.easeInOut,
                ),
              )
              // 2. Circular Glow Animation (animates the container's shadow)
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .boxShadow(
                borderRadius: BorderRadius.circular(200), // Forces shadow to be a perfect circle
                begin: BoxShadow(
                  color: const Color(0xFFC67A3D).withOpacity(0.0), // Starts with no glow
                  blurRadius: 60,
                  spreadRadius: 10,
                ),
                end: BoxShadow(
                  color: const Color(0xFFC67A3D).withOpacity(0.5), // Breathes into strong neon glow
                  blurRadius: 80,
                  spreadRadius: 20,
                ),
                duration: 1500.ms,
                curve: Curves.easeInOut,
              ),
            ).animate(delay: 600.ms).scale(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // --- MOBILE ROBOT ANIMATION ---
          Center(
            child: Container(
              height: 200, 
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: Icon(
                FontAwesomeIcons.robot,
                size: 80, 
                color: Theme.of(context).colorScheme.primary,
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .tint(
                color: const Color(0xFFC67A3D), 
                duration: 1500.ms,
                curve: Curves.easeInOut,
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .boxShadow(
              borderRadius: BorderRadius.circular(100), // Half of height/width for circle
              begin: BoxShadow(
                color: const Color(0xFFC67A3D).withOpacity(0.0),
                blurRadius: 30,
                spreadRadius: 5,
              ),
              end: BoxShadow(
                color: const Color(0xFFC67A3D).withOpacity(0.5),
                blurRadius: 40,
                spreadRadius: 10,
              ),
              duration: 1500.ms,
              curve: Curves.easeInOut,
            ),
          ).animate(delay: 600.ms).scale(),
          
          const SizedBox(height: 40),
          
          Text(
            "👋 Hi, I'm  Mutahira.",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Building Cross-Platform Apps & Intelligent Models",
                  textStyle: Theme.of(context).textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Flutter Developer | Machine Learning Enthusiast",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ).animate(delay: 1000.ms).fadeIn(),
          const SizedBox(height: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: "Download Resume",
                icon: FontAwesomeIcons.download,
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "View Work",
                isOutlined: true,
                onPressed: onViewWork,
              ),
            ],
          ).animate(delay: 1200.ms).fadeIn().slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}