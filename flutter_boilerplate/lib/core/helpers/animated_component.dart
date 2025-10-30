import 'package:flutter/material.dart';

class AnimatedSnackBarContent extends StatefulWidget {
  final Widget child;
  const AnimatedSnackBarContent({super.key, required this.child});

  @override
  State<AnimatedSnackBarContent> createState() =>
      _AnimatedSnackBarContentState();
}

class _AnimatedSnackBarContentState extends State<AnimatedSnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  //late Animation<double> _animation;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Fade duration
      vsync: this,
    );
    //_animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // Start above the screen
      end: Offset.zero, // End at its final position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start the fade-in animation immediately
    _controller.forward();
  }

  @override
  void dispose() {
    // Note: You can add logic here to trigger the fade-out if needed,
    // but the SnackBar's dismissal handles the disappearance.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return FadeTransition(opacity: _animation, child: widget.child);
    return SlideTransition(position: _animation, child: widget.child);
  }
}
