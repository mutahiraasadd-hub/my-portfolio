import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m_portfolio/shared/widgets/custom_button.dart';
import 'package:m_portfolio/shared/widgets/glass_container.dart';
import 'package:m_portfolio/shared/widgets/responsive_layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final padding = isDesktop
        ? const EdgeInsets.symmetric(horizontal: 100, vertical: 80)
        : const EdgeInsets.symmetric(horizontal: 17, vertical: 40);

    return Container(
      padding: padding,
      child: Column(
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
              "Get In Touch",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white, // Must be white for gradient
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "Have a project in mind or want to collaborate?",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75), // Readable subtitle
                  ),
            ),
          ),

          const SizedBox(height: 40),
          GlassContainer(
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(32),
            child: SizedBox(
              width: isDesktop ? 600 : double.infinity,
              child: Column(
                children: [
                  _buildTextField(
                    context,
                    "Name",
                    nameController,
                    Icons.person,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    "Email",
                    emailController,
                    Icons.email,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    context,
                    "Message",
                    messageController,
                    Icons.message,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: "Send Message",
                      icon: Icons.send,
                      onPressed: () => sendEmail(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(
                context,
                FontAwesomeIcons.github,
                "https://github.com/mutahiraasadd-hub",
              ),
              const SizedBox(width: 30),
              _buildSocialIcon(
                context,
                FontAwesomeIcons.linkedin,
                "https://www.linkedin.com/in/mutahira-asad-a42582370/",
              ),
              const SizedBox(width: 30),
             
            ],
          ),
        ],
      ),
    );
  }

  // --- UPDATED TEXT FIELD FOR LIGHT THEME ---
  Widget _buildTextField(
    BuildContext context,
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      // Text color while typing
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface), 
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        ),
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        filled: true,
        // Soft brown tint for the input background
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // Subtle border when not focused
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // Stronger border when clicked
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  // --- UPDATED SOCIAL ICONS ---
  Widget _buildSocialIcon(BuildContext context, IconData icon, String url) {
    return IconButton(
      onPressed: () async {
final Uri uri=Uri.parse(url);
if (await canLaunchUrl(uri)){
  await launchUrl(uri,mode: LaunchMode.externalApplication);

} else{
  debugPrint('Could not launch $url');
}
}, // TODO: Launch URL
      icon: FaIcon(icon, size: 32),
      // Base color is a soft dark brown
      color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      // Hovers with that glowing copper color
      hoverColor: const Color(0xFFC67A3D),
    );
  }

  Future<void> sendEmail() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final serviceId = 'service_kxagzrh';
    final templateId = 'template_553ah3e';
    final userId = '5KK8V8hjhqCaPkZlk';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost', // Required for some API calls
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': nameController.text,
            'user_email': emailController.text,
            'user_message': messageController.text,
          },
        }),
      );

      if (response.statusCode == 200) {
        nameController.clear();
        emailController.clear();
        messageController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed: ${response.body}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }
}