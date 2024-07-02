import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/Common/Utils/app_colors.dart';
import 'package:rick_and_morty/Common/Utils/strings.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.grey850,
      child: ListView(
        children: [
          ListTile(
            title:  Text('Episodes', style: GoogleFonts.roboto(color: Colors.white),),
            onTap: () => Modular.to.pushNamed(Strings.episodesModule),
          ),
          ListTile(
            title:  Text('Locations', style: GoogleFonts.roboto(color: Colors.white),),
            onTap: () => Modular.to.pushNamed(Strings.locationsModule),
          ),
        ],
      ),
    );
  }
}