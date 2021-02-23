import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBotton extends StatefulWidget {
  double blurStrengthX;
  double blurStrengthY;
  double height;
  AlignmentGeometry alignment;
  double colorOpacity;
  double width;
  EdgeInsetsGeometry padding;
  Color color;
  BorderRadiusGeometry borderRadius;
  Widget child;
  BoxBorder border;
  Function onTap;
  Function onDoubleTap;
  Function onLongPress;
  GlassBotton({
    this.child,
    this.alignment,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.height,
    this.colorOpacity,
    this.border,
    this.borderRadius,
    this.padding,
    this.width,
    this.blurStrengthX,
    this.blurStrengthY,
    this.color,
  });
  @override
  _GlassContainerState createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassBotton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          widget.borderRadius ?? BorderRadius.all(Radius.circular(0.0)),
      child: InkWell(
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongPress,
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.blurStrengthX ?? 10,
              sigmaY: widget.blurStrengthY ?? 10,
            ),
            child: AnimatedContainer(
              duration: kThemeChangeDuration,
              alignment: widget.alignment ?? Alignment.topLeft,
              padding: widget.padding ?? EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: widget.color == null
                    ? Colors.transparent
                    : widget.color.withOpacity(widget.colorOpacity ?? 0.2),
                borderRadius:
                    widget.borderRadius ?? BorderRadius.all(Radius.zero),
                border: widget.border ??
                    Border.all(width: 0.0, color: Colors.transparent),
              ),
              child: widget.child,
              height: widget.height ?? 50,
              width: widget.width ?? 50,
            )),
      ),
    );
  }
}
