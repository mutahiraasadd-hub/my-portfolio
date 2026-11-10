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
  final ScrollController _scrollController = ScrollController();
  final double _scrollAmount = 374.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scroll(double amount) {
    if (!_scrollController.hasClients) return;

    final targetOffset = (_scrollController.offset + amount).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.tryParse(url.trim());

    if (uri == null || !uri.hasScheme) return;

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      debugPrint('Could not open URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 24, vertical: 40);

    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF5D3C3C),
                Color(0xFFC67A3D),
                Color(0xFF5D3C3C),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              " Projects",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 40),

          Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 10,
                ),
                child: Row(
                  children: [
                    _buildProjectCard(
                      context,
                      "Custom POS Terminal",
                      "A client-focused Point of Sale (POS) system developed and delivered using Flutter and Supabase. Includes inventory management, employee management, and recipe management, with cloud database integration to support daily business operations.",
                      ["Flutter", "Dart", "Riverpod", "Supabase"],
                      const Color(0xFFC67A3D),
                      "",
                      "",
                      imageUrl:"https://raw.githubusercontent.com/mutahiraasadd-hub/portfolio-assets/main/custom-pos/Screenshot%202026-11-11%20004813.png",
                      screenshotsUrl: "https://github.com/mutahiraasadd-hub/portfolio-assets/tree/main/custom-pos",
                      projectLabel: "Client Project",
                    ),

                    const SizedBox(width: 24),

                    _buildProjectCard(
                      context,
                      "Veterinary Clinic Website",
                      "A production-ready Flutter web application for veterinary clinics, featuring responsive UI, Supabase authentication and database integration, clinic location and directions through maps, and WhatsApp integration for appointment inquiries.",
                      [
                        "Flutter",
                        "Supabase",
                        "Flutter Maps",
                        "WhatsApp API"
                      ],
                      const Color(0xFFA0522D),
                      "",
                      "",
                      imageUrl:"https://raw.githubusercontent.com/mutahiraasadd-hub/portfolio-assets/main/veterinary-clinic/Screenshot%202026-10-16%20021430.png",
                      screenshotsUrl: "https://github.com/mutahiraasadd-hub/portfolio-assets/tree/main/veterinary-clinic",
                      projectLabel: "Client Project",
                    ),

                    const SizedBox(width: 24),

                    _buildProjectCard(
                      context,
                      "Gym Management ",
                      "Collaborated on developing a gym management SAAS Tool that helps manage member records, track membership fee status, and can send custom reminders to gym members. Implemented CRUD operations and integrated Supabase for authentication, cloud data storage, and real-time updates.",
                      ["Flutter", "Dart", "Supabase", "Provider"],
                      const Color(0xFFC67A3D),
                      "",
                      "",
                     imageUrl: "https://raw.githubusercontent.com/mutahiraasadd-hub/portfolio-assets/dba8c180f4f2bd17085bd5a5c7048c7e204b2bc5/gym-management/Screenshot%202026-11-10%20234650.png",                      screenshotsUrl: "https://github.com/mutahiraasadd-hub/portfolio-assets/tree/main/gym-management",
                      projectLabel: "Collaborative Development",
                    ),

                    const SizedBox(width: 24),

                    _buildProjectCard(
                      context,
                      "FitSage – AI Fitness App",
                      "A collaborative AI-powered fitness and nutrition app featuring personalized macro calculations and food recognition. Contributed to integrating a custom EfficientNetB0 model trained on a 110-class food dataset, achieving 88.46% classification accuracy, along with CalorieNinjas API integration for nutritional information.",
                      [
                        "Flutter",
                        "Firebase",
                        "EfficientNetB0",
                        "CalorieNinjas API"
                      ],
                      const Color(0xFFA0522D),
                      "",
                      "",
                      screenshotsUrl: "https://github.com/mutahiraasadd-hub/portfolio-assets/tree/main/fitsage",
                      imageUrl: "https://raw.githubusercontent.com/mutahiraasadd-hub/portfolio-assets/main/fitsage/WhatsApp%20Image%202026-11-11%20at%2002.00.31.jpeg", 
                      projectLabel: "Team Collaboration",
                    ),

                    const SizedBox(width: 24),

                    _buildProjectCard(
                      context,
                      "Portfolio Website",
                      "A responsive web portfolio built with Flutter Web, featuring a clean interface, glassmorphism styling, and animated elements to present projects and development skills.",
                      ["Flutter Web", "Dart", "Responsive UI"],
                      const Color(0xFF8B5A2B),
                      "https://github.com/mutahiraasadd-hub/my-portfolio",
                      "",
                      screenshotsUrl: "",
                      imageUrl: "https://raw.githubusercontent.com/mutahiraasadd-hub/portfolio-assets/main/portfolioimage/Screenshot%202026-11-11%20020507.png"
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 0,
                child: _buildArrowButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () => _scroll(-_scrollAmount),
                ),
              ),

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

  Widget _buildArrowButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
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
        color: const Color(0xFF5D3C3C),
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
    String liveDemo, {
    String screenshotsUrl = "",
    String imageUrl = "", // Added imageUrl here
    String? projectLabel,
  }) {
    return SizedBox(
      width: 350,
      height: 450,
      child: GlassContainer(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _ProjectCardContent(
            title: title,
            description: description,
            tags: tags,
            accentColor: accentColor,
            githubUrl: githubUrl,
            liveDemo: liveDemo,
            screenshotsUrl: screenshotsUrl,
            imageUrl: imageUrl, // Passed imageUrl here
            projectLabel: projectLabel,
            onOpenUrl: _openUrl,
          ),
        ),
      ),
    );
  }
}

class _ProjectCardContent extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final Color accentColor;
  final String githubUrl;
  final String liveDemo;
  final String imageUrl;
  final String screenshotsUrl;
  final String? projectLabel;
  final Function(String) onOpenUrl;

  const _ProjectCardContent({
    required this.title,
    required this.description,
    required this.tags,
    required this.accentColor,
    required this.githubUrl,
    required this.liveDemo,
    this.imageUrl = "",
    required this.screenshotsUrl,
    this.projectLabel,
    required this.onOpenUrl,
  });

  @override
  State<_ProjectCardContent> createState() => _ProjectCardContentState();
}

class _ProjectCardContentState extends State<_ProjectCardContent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hasGithub = widget.githubUrl.trim().isNotEmpty;
    final hasLiveDemo = widget.liveDemo.trim().isNotEmpty;
    final hasScreenshots = widget.screenshotsUrl.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.accentColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: widget.imageUrl.trim().isNotEmpty
                ? Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 40,
                        color: widget.accentColor.withOpacity(0.6),
                      ),
                    ),
                  )
                : Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: widget.accentColor.withOpacity(0.6),
                    ),
                  ),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),

        if (widget.projectLabel != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.projectLabel!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: widget.accentColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],

        const SizedBox(height: 8),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.75),
                        height: 1.4,
                      ),
                  maxLines: _isExpanded ? null : 3,
                  overflow: _isExpanded
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  child: Text(
                    _isExpanded ? "See Less" : "See More",
                    style: TextStyle(
                      color: widget.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        Wrap(
          spacing: 6,
          runSpacing: 4,
          children: widget.tags
              .map(
                (tag) => Chip(
                  label: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  backgroundColor: widget.accentColor.withOpacity(0.15),
                  side: BorderSide.none,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList(),
        ),

        if (hasGithub || hasLiveDemo || hasScreenshots) ...[
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              if (hasGithub)
                CustomButton(
                  label: "View Code",
                  isOutlined: true,
                  onPressed: () => widget.onOpenUrl(widget.githubUrl),
                ),
              if (hasLiveDemo)
                CustomButton(
                  label: "Live Demo",
                  isOutlined: true,
                  onPressed: () => widget.onOpenUrl(widget.liveDemo),
                ),
              if (hasScreenshots)
                CustomButton(
                  label: "View Screenshots",
                  isOutlined: true,
                  onPressed: () => widget.onOpenUrl(widget.screenshotsUrl),
                ),
            ],
          ),
        ],
      ],
    );
  }
}