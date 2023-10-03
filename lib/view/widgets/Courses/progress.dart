import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({
    super.key,
    required this.color,
    required this.percent,
    required this.width,
  });

  final Color color;
  final double percent;
  final double width;

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
        ),
        Container(
          width: (widget.width) * widget.percent,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
                widget.color,
                widget.color,
              ],
              stops: const [
                -0.2,
                0.0,
                0.1,
                .8,
                .9,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
            ),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
