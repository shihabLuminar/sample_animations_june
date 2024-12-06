import 'package:flutter/material.dart';

class TweenScreen extends StatefulWidget {
  const TweenScreen({super.key});

  @override
  State<TweenScreen> createState() => _TweenScreenState();
}

class _TweenScreenState extends State<TweenScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Size> sizeTween;
  late Animation<double> opacityTween;
  late Animation<Color?> colorTween;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    sizeTween = Tween<Size>(end: Size(100, 200), begin: Size(300, 100))
        .animate(animationController);
    opacityTween =
        Tween<double>(begin: .5, end: 1).animate(animationController);
    colorTween = ColorTween(begin: Colors.red, end: Colors.yellow)
        .animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse(); // Reverse the animation
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward(); // Forward the animation
      }
    });

    animationController.forward(); // Start the animation
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Container(
              height: sizeTween.value.height,
              width: sizeTween.value.width,
              color: colorTween.value!.withOpacity(opacityTween.value)),
        ),
      ),
    );
  }
}
