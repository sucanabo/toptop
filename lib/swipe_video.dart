import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class SwipeVideo extends StatelessWidget {
  const SwipeVideo({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> colorLst =
        [0, 0, 0].map((item) => Random().nextInt(255)).toList();
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(colorLst[0], colorLst[1], colorLst[2], 1),
          child: Center(
            child: Text(
              'Content Video',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight - const Alignment(0.05, -0.35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FavouriteButton(),
              SizedBox(height: 12),
              CommentButton(),
              SizedBox(height: 12),
              MarkButton(),
              SizedBox(height: 12),
              ShareButton(),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Felix Dinh',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(children: [
                      Icon(Icons.music_note, color: Colors.white70,size: 15,),
                      Text('Music name - Unknown Artist', style: TextStyle(color: Colors.white),)
                    ],)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10,bottom: 5),
                  child: MusicRotate(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MusicRotate extends StatefulWidget {
  const MusicRotate({super.key});

  @override
  State<MusicRotate> createState() => _MusicRotateState();
}

class _MusicRotateState extends State<MusicRotate> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5))..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) =>  Transform.rotate(
        angle: controller.value * 2 * math.pi,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black87,
          ),
          child: Center(
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.person, size: 15,),
            ),
          ),
        ),
      ),
    );
  }
}


class MarkButton extends StatelessWidget {
  const MarkButton({super.key, this.interactNumber = 0});

  final int interactNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Icon(
            Icons.bookmark,
            color: Colors.white,
            size: 30,
          ),
          Text(
            interactNumber.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class ShareButton extends StatefulWidget {
  const ShareButton({super.key, this.interactNumber = 0});

  final int interactNumber;

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Icon(
            Icons.share,
            color: Colors.white,
            size: 30,
          ),
          Text(
            widget.interactNumber.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  void _onTap() {}
}

class CommentButton extends StatefulWidget {
  const CommentButton({super.key, this.interactNumber = 0});

  final int interactNumber;

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Icon(
            Icons.comment,
            color: Colors.white,
            size: 30,
          ),
          Text(
            widget.interactNumber.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  void _onTap() {
    print('clicked here');
    showModalBottomSheet<void>(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Comments',
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
        enableDrag: true,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.width));
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key, this.interactNumber = 0});

  final int interactNumber;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController activeController;
  late AnimationController deActiveController;
  late Animation<double> heartActiveAnimation;
  late Animation<double> heartDeActiveAnimation;

  bool _active = false;
  double _circleScale = 0;

  @override
  void initState() {
    activeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => setState(() {}));
    // deActiveController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300),
    // )..addListener(() => setState(() {}));

    heartActiveAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: 1.5),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1),
        weight: 50,
      ),
    ]).animate(activeController);
    //heartDeActiveAnimation = Tween<double>(begin: 1, end:0).animate(deActiveController);
  }

  @override
  Widget build(BuildContext context) {
    print('current circle: $_circleScale');
    return GestureDetector(
      onTap: () {
        if (_active) {
          activeController.reverse();
        } else {
          _circleScale = 1;
          activeController.forward();
        }
        _active = !_active;
      },
      child: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Icon(
                      Icons.favorite_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    child: ScaleTransition(
                      scale: heartActiveAnimation,
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              // AnimatedScale(
              //   scale: _circleScale,
              //   curve: Curves.easeIn,
              //   duration: Duration(milliseconds: 300),
              //   child: Container(
              //     height: 60,
              //     width: 60,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.yellow, width: 1),
              //         borderRadius: BorderRadius.circular(100)),
              //   ),
              // )
            ],
          ),
          Text(
            widget.interactNumber.toString(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
