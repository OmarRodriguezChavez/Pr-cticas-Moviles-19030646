import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psmna10/provider/theme_provider.dart';
import 'package:psmna10/settings/styles_settings.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Social TEC'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/cd/f8/8b/cdf88b127f9b36ef519531d4e762c75e.png'),
                ),
                accountName: Text('Omar Rodríguez'),
                accountEmail: Text('19030646@itcelaya.edu.mx')),
            ListTile(
              onTap: () {},
              title: Text('Práctica 1'),
              subtitle: Text('Descripción de la práctica'),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabled) {
                  isDarkModeEnabled
                      ? theme.setthemeData(StylesSettings.darkTheme(context))
                      : theme.setthemeData(StylesSettings.lightTheme(context));
                  this.isDarkModeEnabled = isDarkModeEnabled;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}
