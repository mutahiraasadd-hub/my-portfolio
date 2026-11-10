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
                      const SizedBox(height: 5),
                      Text(
                        "I'm a Software Engineering graduate with hands-on experience in developing cross-platform mobile and web applications. My primary expertise lies in Flutter, Dart, Firebase, and Supabase, with experience in REST API integration, authentication, database design, and responsive UI development.\n\n"
                        "I have worked on a range of practical projects, including FitSage, a Veterinary Clinic Management Website, and a custom Point of Sale (POS) system that I successfully developed and delivered to a client. These projects have strengthened my ability to build scalable applications, integrate AI capabilities and cloud-based services, and develop solutions tailored to real-world business needs.\n\n"
                        "I enjoy turning ideas into functional, user-focused software, writing clean and maintainable code, and continuously exploring new technologies to improve my development skills.",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.6,
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
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(19), 
                      child: Image.asset(
                        'assets/images/your_profile_photo.JPG', 
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.person_rounded,
                            size: 80,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
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