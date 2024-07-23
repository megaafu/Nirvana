import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:nirvana/src/socials/instagram/entities/user.dart';

class HomeInstagram extends StatefulWidget {
  const HomeInstagram({super.key});

  @override
  State<HomeInstagram> createState() => _HomeInstagramState();
}

class _HomeInstagramState extends State<HomeInstagram> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: SvgIcon(
              size: 22.h,
              icon: const SvgIconData("assets/icons/photo.svg"),
            ),
          ),
          title: Image.asset("assets/instagram.png"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgIcon(
                size: 22.h,
                icon: const SvgIconData("assets/icons/messanger.svg"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: InstagramNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return InstagramStories(
                    user: stories[index],
                  );
                },
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return InstagramPost(
                    user: stories[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstagramNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const InstagramNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const icons = [
      "assets/icons/home.svg",
      "assets/icons/search.svg",
      "assets/icons/add-square.svg",
      "assets/icons/heart.svg",
      "assets/icons/photo.svg"
    ];
    return BottomNavigationBar(
      items: icons
          .map(
            (icon) => BottomNavigationBarItem(
              label: "",
              icon: SvgIcon(
                color: Colors.black,
                size: 22.h,
                icon: SvgIconData(icon),
              ),
            ),
          )
          .toList(),
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

class InstagramStories extends StatelessWidget {
  final User user;
  const InstagramStories({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            user.name,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class InstagramPost extends StatelessWidget {
  final User user;
  const InstagramPost({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 10.w,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 22.r,
          ),
          title: Text(
            user.name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "Maputo, Mozambique",
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ),
        Image.asset(
          "assets/image.png",
          height: 375.h,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Row(
            children: [
              SvgIcon(
                size: 21.h,
                icon: const SvgIconData("assets/icons/heart.svg"),
              ),
              SizedBox(width: 17.w),
              SvgIcon(
                size: 21.h,
                icon: const SvgIconData("assets/icons/comments.svg"),
              ),
              SizedBox(width: 17.w),
              SvgIcon(
                size: 21.h,
                icon: const SvgIconData("assets/icons/messanger.svg"),
              ),
              const Spacer(),
              SvgIcon(
                size: 21.h,
                icon: const SvgIconData("assets/icons/bookmark.svg"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
