import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SlideDots extends StatefulWidget {
  bool isActive;
  SlideDots(this.isActive, {Key? key}) : super(key: key);

  @override
  State<SlideDots> createState() => _SlideDotsState();
}

class _SlideDotsState extends State<SlideDots> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: widget.isActive ? 10 : 6,
      width: widget.isActive ? 10 : 6,
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
