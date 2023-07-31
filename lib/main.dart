import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toptop/app_navigation.dart';
import 'package:toptop/data/video_repository.dart';
import 'package:toptop/data/video_response.dart';
import 'package:toptop/main_screen_app_bar.dart';
import 'package:toptop/swipe_video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController cateTabController;
  final repo = VideoRepository();
  VideoResponse? data;

  @override
  void initState() {
    super.initState();
    cateTabController = TabController(length: 3, vsync: this);
    fetchVideos();
  }

  @override
  void dispose() {
    cateTabController.dispose();
    super.dispose();
  }

  void fetchVideos()async{
    data = await repo.getVideoList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainScreenAppBar(controller: cateTabController),
        extendBodyBehindAppBar: true,
        body: TabBarView(
          controller: cateTabController,
          children: List.generate(3, (index) => videoCate()),
        ),
        bottomNavigationBar: const AppNavigation(),
      ),
    );
  }

  Widget videoCate() => PageView.builder(
        itemBuilder: (context, index) => const SwipeVideo(),
        scrollDirection: Axis.vertical,
        pageSnapping: true,
      );
}
