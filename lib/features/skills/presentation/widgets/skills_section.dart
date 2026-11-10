import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- MULTI-SHADE BRONZE GRADIENT FOR MAIN TITLE ---
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
              "Skills Dashboard",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, // Must be white for gradient to show
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "Mobile Development",
                    Icons.install_mobile,
                    ["Flutter", "Dart", "Firebase", "State Management"],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "Web Development",
                    FontAwesomeIcons.brain,
                    [
                      "HTML5",
                      "CSS3",
                      "Responsive Design",
                      "Django",
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    "Backend & Database",
                    Icons.storage,
                    [ "SQL", "REST APIs","Firebase Firestore","Supabase"],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildSkillCategory(
                  context,
                  "Mobile Development",
                  Icons.install_mobile,
                  ["Flutter", "Dart", "Firebase", "State Management"],
                ),
                const SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Web Development",
                  FontAwesomeIcons.brain,
                  [
                    "HTML5",
                    "CSS3",
                    "Django",
                    "Responsive Design",
                  ],
                ),
                const SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Backend & Database",
                  Icons.storage,
                  [ "REST APIs", "Git","Firebase Firestore","Supabase"],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    dynamic icon, // Changed to dynamic to support both IconData and FaIconData
    List<String> skills,
  ) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon is IconData
                  ? Icon(
                      icon,
                      color: const Color(0xFFC67A3D),
                      size: 28,
                    )
                  : FaIcon(
                      icon,
                      color: const Color(0xFFC67A3D),
                      size: 28,
                    ),
              const SizedBox(width: 12),
              Expanded(
                // --- GRADIENT FOR CATEGORY TITLES ---
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFF5D3C3C),
                      Color(0xFFC67A3D),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white, // Must be white for gradient
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.08), // Slightly softer background
                    side: BorderSide(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3),
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary, // Dark brown text for high visibility
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}