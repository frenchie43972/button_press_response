import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  _MessageScreen createState() => _MessageScreen();
}

class _MessageScreen extends State<MessageScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.redAccent,
    ).animate(_controller);

    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setWidth = MediaQuery.of(context).size.width;
    final setHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 206, 209),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: setWidth * 0.83,
              height: setHeight * 0.85,
              decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  border: Border.all(
                    width: 6,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wrap it Up!',
                    style: TextStyle(
                      fontSize: setWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          // child:
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffffff).withOpacity(0.76),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
