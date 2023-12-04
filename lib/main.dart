import 'package:currencyconverter/providers/locale_provider.dart';
import 'package:currencyconverter/pages/home.dart';
import 'package:currencyconverter/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const Home(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            theme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: provider.locale,
            home: BottomMenu(
              selectedIndex: _selectedIndex,
              screens: _screens,
              onTab: (value) {
                setState(
                  () {
                    _selectedIndex = value as int;
                  },
                );
              },
            ),
          );
        },
      );
}

class BottomMenu extends StatelessWidget {
  final int selectedIndex;
  final List<Widget> screens;
  final Function(int?) onTab;

  const BottomMenu({
    super.key,
    required this.selectedIndex,
    required this.screens,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        selectedLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.currency_exchange),
            label: appLocal.menu_converter,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: appLocal.menu_settings,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTab,
      ),
    );
  }
}
