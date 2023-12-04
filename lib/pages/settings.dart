import 'package:CurrencyConverter/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Map<String, String> localizedLangMode = {
    "en": "English",
    "uk": "Українська"
  };

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final appLocal = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              appLocal.lang,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: localeProvider.locale,
                alignment: Alignment.centerRight,
                items: AppLocalizations.supportedLocales.map((nextLocale) {
                  return DropdownMenuItem(
                    value: nextLocale,
                    child: Center(
                      child: Text(
                        localizedLangMode[nextLocale.toString()]!,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (locale) {
                  localeProvider.setLocale(locale!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
