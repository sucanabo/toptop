import 'package:flutter/material.dart';

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainScreenAppBar({
    super.key,
    required this.controller,
    this.onItemTap,
  });

  final TabController controller;
  final void Function(int)? onItemTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        heightFactor: 1.5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.live_tv,color: Colors.white,size: 30,)),
            TabBar(
              controller: controller,
              onTap: onItemTap,
              //indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(width: 2,color: Colors.white),
                  insets: EdgeInsets.symmetric(horizontal: 8),
              ),

              labelPadding: const EdgeInsets.symmetric(horizontal: 12),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              tabs: const <Widget>[
                Tab(
                  child: Text('Friend'),
                ),
                Tab(
                  child: Text('Following'),
                ),
                Tab(
                  child: Text('For you'),
                ),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,size: 30,)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
