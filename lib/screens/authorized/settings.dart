import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mavka/layouts/authorized/page.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageLayout(
      hero: 'bottom_navbar',
      title: 'Налаштування',
      color: Colors.white,
      isTitleBlack: true,
      child: ValueListenableBuilder(
          valueListenable: Hive.box<String>('prefs').listenable(),
          builder: (context, Box<String> box, widget) {
            return ListView(
              physics: const ScrollPhysics(),
              children: [
                Text(
                  'Загальні',
                  style: GoogleFonts.montserratAlternates(
                      fontWeight: FontWeight.w500, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Темне оформлення',
                        style: GoogleFonts.montserrat(fontSize: 16),
                      ),
                      Switch(
                        value:
                            box.get('dark_theme', defaultValue: 'no') == 'yes',
                        onChanged: (val) =>
                            box.put('dark_theme', val ? 'yes' : 'no'),
                      )
                    ],
                  ),
                ),
                Text(
                  'Розширені',
                  style: GoogleFonts.montserratAlternates(
                      fontWeight: FontWeight.w500, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Двигун рендерінгу формул',
                            style: GoogleFonts.montserrat(fontSize: 16),
                          ),
                          Text(
                            '* Katex швидший\n* MathJax гарніший',
                            style: GoogleFonts.firaMono(fontSize: 12),
                          ),
                        ],
                      ),
                      // todo as enum
                      DropdownButton<String>(
                        items: const [
                          DropdownMenuItem(
                            value: 'Katex',
                            child: Text('Katex'),
                          ),
                          DropdownMenuItem(
                            value: 'MathJax',
                            child: Text('MathJax'),
                          )
                        ],
                        onChanged: (value) {
                          box.put('tex_engine', value);
                        },
                        value: box.get('tex_engine', defaultValue: 'Katex'),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                  child: Text(
                    'mavka',
                    style: GoogleFonts.montserrat(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Colors.blue),
                  ),
                ),
                Center(
                  child: Text(
                    'v0.0.0.1',
                    style: GoogleFonts.firaMono(fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FlutterIcons.github_faw5d),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(FlutterIcons.telegram_faw5d),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(FlutterIcons.globe_fea),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(FlutterIcons.instagram_faw5d),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(FlutterIcons.facebook_faw5d),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
