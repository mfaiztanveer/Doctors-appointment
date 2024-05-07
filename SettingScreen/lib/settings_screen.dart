import 'package:flutter/material.dart';
import 'settings_components.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SettingsHeader(),
          SizedBox(height: 25),
          SettingsSection(
            title: 'Account',
            items: [
              SettingItem(
                text: 'Edit profile',
                icon: Icons.edit,
                onTap: () {
                  print('Edit profile tapped');
                },
              ),
              SettingItem(
                text: 'Privacy',
                icon: Icons.lock_outlined,
                onTap: () {
                  print('Privacy profile tapped');
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          SettingsSection(
            title: 'Support & About',
            items: [
              SettingItem(
                text: 'Help & Support',
                icon: Icons.help_outline,
                onTap: () {
                  print('Help & Support tapped');
                },
              ),
              SettingItem(
                text: 'Terms and Policies',
                icon: Icons.description,
                onTap: () {
                  print('Terms and Policies tapped');
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          SettingsSection(
            title: 'Actions',
            items: [
              SettingItem(
                text: 'Add Account',
                icon: Icons.person_add_rounded,
                onTap: () {
                  print('Add Account tapped');
                },
              ),
              SettingItem(
                text: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  print('Logout tapped');
                },
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
