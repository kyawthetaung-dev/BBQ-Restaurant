import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // App Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          size: 48,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'E-Menu',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Beer & BBQ Restaurant App',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Version 1.0.0',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Appearance Section
              Text(
                'Appearance',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: Column(
                  children: [
                    // Dark Mode Toggle
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      subtitle: Text(
                        themeProvider.isDarkMode
                            ? 'Dark theme enabled'
                            : 'Light theme enabled',
                      ),
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      secondary: Icon(
                        themeProvider.isDarkMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Language Section
              Text(
                'Language',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.language,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('Language'),
                      subtitle: Text(themeProvider.language),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        _showLanguageDialog(context, themeProvider);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Notifications Section
              Text(
                'Notifications',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Push Notifications'),
                      subtitle: Text(
                        themeProvider.notificationsEnabled
                            ? 'Notifications enabled'
                            : 'Notifications disabled',
                      ),
                      value: themeProvider.notificationsEnabled,
                      onChanged: (value) {
                        themeProvider.toggleNotifications();
                      },
                      secondary: Icon(
                        themeProvider.notificationsEnabled
                            ? Icons.notifications_active
                            : Icons.notifications_off,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // About Section
              Text(
                'About',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 8),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('App Information'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        _showAppInfoDialog(context);
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(
                        Icons.privacy_tip_outlined,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        _showPrivacyPolicyDialog(context);
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(
                        Icons.description_outlined,
                        color: AppTheme.primaryColor,
                      ),
                      title: const Text('Terms of Service'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        _showTermsDialog(context);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Footer
              Center(
                child: Text(
                  '© 2024 E-Menu. All rights reserved.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, ThemeProvider themeProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption(context, themeProvider, 'English'),
              _buildLanguageOption(context, themeProvider, 'Myanmar'),
              _buildLanguageOption(context, themeProvider, 'Thai'),
              _buildLanguageOption(context, themeProvider, 'Chinese'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    ThemeProvider themeProvider,
    String language,
  ) {
    final isSelected = themeProvider.language == language;
    return ListTile(
      title: Text(language),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppTheme.primaryColor)
          : null,
      onTap: () {
        themeProvider.setLanguage(language);
        Navigator.pop(context);
      },
    );
  }

  void _showAppInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.restaurant_menu, color: AppTheme.primaryColor),
              SizedBox(width: 8),
              Text('E-Menu'),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Version: 1.0.0'),
              SizedBox(height: 8),
              Text(
                'A mobile application for Beer & BBQ restaurants to promote their menus, discounts, and live music bands.',
              ),
              SizedBox(height: 16),
              Text('© 2024 E-Menu'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Privacy Policy'),
          content: const SingleChildScrollView(
            child: Text(
              'E-Menu respects your privacy. This app collects only necessary information to provide you with the best experience.\n\n'
              'We do not share your personal data with third parties. '
              'All data is stored securely on your device.',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Terms of Service'),
          content: const SingleChildScrollView(
            child: Text(
              'By using E-Menu, you agree to:\n\n'
              '1. Use the app for personal, non-commercial purposes\n\n'
              '2. Not attempt to modify or reverse engineer the app\n\n'
              '3. Respect the content and intellectual property rights\n\n'
              '4. Provide accurate information when leaving reviews',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
