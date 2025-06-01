import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nirvana/src/entities/social.dart';
import 'package:nirvana/src/socials/instagram/pages/home.dart';
import 'package:nirvana/src/widgets/lobby_card.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bem Vindo",
                style: TextStyle(
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: AnimationLimiter(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    children: Social.values
                        .map(
                          (social) => AnimationConfiguration.staggeredGrid(
                            position: Social.values.indexOf(social),
                            columnCount: Social.values.length,
                            duration: const Duration(milliseconds: 800),
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeInstagram(),
                                        ),
                                      );
                                    },
                                    child: LobbyCard(social: social)),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
