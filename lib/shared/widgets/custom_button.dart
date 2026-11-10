import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final dynamic icon; // <-- Changed from IconData? to dynamic
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    if (isOutlined) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        // --- Conditionally render standard Icon or FaIcon ---
        icon: icon != null 
            ? (icon is IconData 
                ? Icon(icon, color: color) 
                : FaIcon(icon, color: color)) 
            : const SizedBox.shrink(),
        label: Text(label, style: TextStyle(color: color)),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: theme.colorScheme.background,
        elevation: 10,
        shadowColor: color.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      // --- Conditionally render standard Icon or FaIcon ---
      icon: icon != null 
          ? (icon is IconData 
              ? Icon(icon) 
              : FaIcon(icon)) 
          : const SizedBox.shrink(),
      label: Text(label),
    );
  }
}