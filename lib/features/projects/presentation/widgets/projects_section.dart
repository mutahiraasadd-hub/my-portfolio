import 'package:flutter/material.dart';
import 'package:m_portfolio/shared/widgets/custom_button.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  // 1. Add the ScrollController
  final ScrollController _scrollController = ScrollController();
  
  // The width of one card (350) + the SizedBox width (24)
  final double _scrollAmount = 374.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 2. Scroll logic
  void _scroll(double amount) {
    _scrollController.animateTo(
      _scrollController.offset + amount,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface, // Alternating background
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
              "Selected Projects",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, // Must be white for gradient to show
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
          
          // 3. Wrap SingleChildScrollView in a Stack to float the arrows
          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                controller: _scrollController, // Attach controller here
                scrollDirection: Axis.horizontal,
                // Added some padding so the cards don't get hidden behind the arrows
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 10), 
                child: Row(
                  children: [
                    _buildProjectCard(
                      context,
                      "Gym Management App",
                      "A complete shopping app built with Flutter and Firebase. Features include user authentication, product catalog, cart management, and payment gateway integration.",
                      ["Flutter", "Firebase", "Provider", "Stripe"],
                      const Color(0xFFC67A3D), // Copper accent
                      "",
                      "",
                    ),
                    const SizedBox(width: 24),
                    _buildProjectCard(
                      context,
                      "Ai Fitness app",
                      "An AI-powered mobile app that detects plant diseases from leaf images using a custom ResNet model trained on PyTorch. Integrated via TFLite.",
                      ["Flutter", "PyTorch", "ResNet", "TFLite"],
                      const Color(0xFFA0522D), // Sienna accent
                      "",
                      "",
                    ),
                    const SizedBox(width: 24),
                    _buildProjectCard(
                      context,
                      "Portfolio Website",
                      "A high-performance responsive web portfolio built with Flutter Web. Features a clean light theme, glassmorphism UI, and animated elements.",
                      ["Flutter Web", "GoRouter", "Animate"],
                      const Color(0xFF8B5A2B), // Rich Ochre accent
                      "",
                      "",
                    ),
                  //  const SizedBox(width: 24),
             //       _buildProjectCard(
                 //     context,
                //      "Java POS Terminal",
                //      "A Point of Sale (POS) terminal application built with Java. Features include inventory management, order processing, and sales reporting.",
                //      ["Java", "MySQL", "Desktop App"],
                 //     const Color(0xFFCD853F), // Peru/Warm Brown accent
                //      "https://github.com/Hasnat-Akbar/pos_trminal",
                 //     "",
                //    ),
               ],
               ),
             ),

              // --- Left Arrow ---
              Positioned(
                left: 0,
                child: _buildArrowButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => _scroll(-_scrollAmount),
                ),
              ),

              // --- Right Arrow ---
              Positioned(
                right: 0,
                child: _buildArrowButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: () => _scroll(_scrollAmount),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Styled Arrow Button ---
  Widget _buildArrowButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Glass effect
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 20),
        color: const Color(0xFF5D3C3C), // Dark brown to match your theme
        onPressed: onTap,
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> tags,
    Color accentColor,
    String githubUrl,
    String liveDemo,
  ) {
    return SizedBox(
      width: 350,
      height: 450,
      child: GlassContainer(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder Image Area
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.15), // Softer background for light theme
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: accentColor.withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary, // Rich brown title
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  // --- FIX FOR INVISIBLE TEXT ---
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75), 
                  height: 1.5,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map(
                    (tag) => Chip(
                      label: Text(
                        tag, 
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary, // Dark text for readability
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      backgroundColor: accentColor.withOpacity(0.15),
                      side: BorderSide.none,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "View Code",
                    isOutlined: true,
                    onPressed: () async {
                      final url = githubUrl.trim();
                      if (url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Source code URL not available yet!',
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    label: "Live Demo",
                    isOutlined: true,
                    onPressed: () async {
                      final url = liveDemo.trim(); 
                      if (url.isNotEmpty) {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      } else {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Live Demo URL not available yet!', 
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}