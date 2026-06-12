import 'package:flutter/material.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      width: double.infinity,
      padding: padding,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- MULTI-SHADE BRONZE GRADIENT FOR "ABOUT ME" ---
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF5D3C3C), // Dark Brown
                Color(0xFFC67A3D), // Neon Bronze/Copper
                Color(0xFF5D3C3C), // Dark Brown
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              "About Me",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, // Must be white for the gradient to show correctly
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          GlassContainer(
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- MULTI-SHADE BRONZE GRADIENT FOR "JOURNEY" ---
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [
                            Color(0xFF5D3C3C),
                            Color(0xFFC67A3D),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          "Journey",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, // Must be white for the gradient
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "I have mid-level Flutter, where I built robust backend systems and learned the fundamentals of object-oriented programming. "
                        "Over time, my passion shifted towards the front-end and the exciting world of Artificial Intelligence.\n\n"
                        "Today, I specialize in Flutter Development and Machine Learning. I love building seamless cross-platform applications while simultaneously training intelligent models to solve real-world problems. "
                        "This unique blend of skills allows me to create smart, beautiful, and highly functional applications.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                          // --- THE FIX FOR THE INVISIBLE TEXT ---
                          // Uses the theme's text color with slight transparency for a soft, readable look
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.85), 
                        ),
                      ),
                    ],
                  ),
                ),
                if (isDesktop) ...[
                  const SizedBox(width: 40),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.05), // Lightened the background a bit for better contrast
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3), // Softened the border
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}