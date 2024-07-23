import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:nirvana/src/entities/social.dart';

class LobbyCard extends StatelessWidget {
  final Social social;
  const LobbyCard({
    required this.social,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgIcon(icon: SvgIconData(social.icon)),
          SizedBox(height: 16.h),
          Text(social.label),
        ],
      ),
    );
  }
}
