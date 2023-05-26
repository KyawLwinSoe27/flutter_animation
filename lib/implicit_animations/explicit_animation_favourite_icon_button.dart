import 'package:flutter/material.dart';

const animationDurationForFavourite = Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplicitAnimationFavouriteIconButton({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationFavouriteIconButton> createState() =>
      _ExplicitAnimationFavouriteIconButtonState();
}

class _ExplicitAnimationFavouriteIconButtonState
    extends State<ExplicitAnimationFavouriteIconButton>
    with TickerProviderStateMixin {
  bool isAnimationCompleted = false;
  late AnimationController _controller;
  late Animation<Color?> _colorController;
  late Animation<double> _sizeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: animationDurationForFavourite, vsync: this);
    _colorController = ColorTween(begin: Colors.grey[500], end: Colors.red)
        .animate(_controller.view);
    _sizeController =
        Tween<double>(begin: 32, end: 48).animate(_controller.view);
    _controller.addStatusListener((status) {
      isAnimationCompleted = (status == AnimationStatus.completed);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) => IconButton(
        onPressed: () {
          // if(isAnimationCompleted) {
          //   _controller.reverse();
          // }else {
          //   _controller.forward();
          // }
          _controller.repeat();
        },
        icon: Icon(
          Icons.favorite,
          color: _colorController.value,
          size: _sizeController.value,
        ),
      ),
    );
  }
}

/// first => animation controller
