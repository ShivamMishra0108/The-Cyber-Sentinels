import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_cyber_sentinels/chatbox.dart';
import 'package:the_cyber_sentinels/listtile.dart';
import 'package:the_cyber_sentinels/theme/theme_provider.dart';
import 'package:the_cyber_sentinels/theme/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeData == darkmode;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Center(
                  child: SizedBox(
                    height: 150, // adjust the height
                    width: 400, // adjust the width
                    child: Image.asset('assets/images/image4.png'),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Theme Toggle
              SwitchListTile(
                title: Text('Dark Mode'),
                value: isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),

              // Ask AI
              Listtile(
                text: "Ask AI",
                icon: Icons.android,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatbox()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
