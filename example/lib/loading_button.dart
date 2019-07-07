import 'package:flutter/material.dart';

const _scale_height = 36; /// default indicator height
const _scale_factor = 0.4;

class FLLoadingButton extends StatefulWidget {
  FLLoadingButton({
    Key key,
    this.child,
    @required this.onPressed,
    this.textTheme,
    this.textColor,
    this.color,
    this.onHighlightChanged,
    this.disabledColor,
    this.highlightColor,
    this.disabledTextColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.loading = false,
    this.indicatorColor,
    this.indicatorSize,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final ButtonTextTheme textTheme;
  final ValueChanged<bool> onHighlightChanged;
  final Color textColor;
  final Color color;
  final Color disabledColor;
  final Color highlightColor;
  final Color disabledTextColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final double elevation;
  final double highlightElevation;
  final double disabledElevation;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Duration animationDuration;
  final double minWidth;
  final double height;

  final bool loading;
  final Color indicatorColor;
  final double indicatorSize;

  @override
  State<StatefulWidget> createState() => _FLLoadingButtonState();
}

class _FLLoadingButtonState extends State<FLLoadingButton> {
  @override
  Widget build(BuildContext context) {
    // color
    final Color indColor = widget.indicatorColor ??
        Theme.of(context).accentColor;
    // indicator size
    double scaleFactor;
    if (widget.indicatorSize != null
        && widget.indicatorSize > 0) {
      scaleFactor = widget.indicatorSize / _scale_height;
    } else {
      scaleFactor = (widget.height != null)
          ? _scale_factor * (widget.height / _scale_height) : _scale_factor;
    }
    // indicator area
    final Widget indicator = Transform.scale(
        scale: scaleFactor,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(indColor),
        )
    );

    final Widget loadingChild = widget.loading ? Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        indicator,
        SizedBox(width: 5.0 * scaleFactor),
        widget.child
      ],
    ) : widget.child;

    return MaterialButton(
      onPressed: widget.loading ? null : widget.onPressed,
      textTheme: widget.textTheme,
      color: widget.color,
      onHighlightChanged: widget.onHighlightChanged,
      disabledColor: widget.disabledColor,
      highlightColor: widget.highlightColor,
      textColor: widget.textColor,
      disabledTextColor: widget.disabledTextColor,
      splashColor: widget.splashColor,
      colorBrightness: widget.colorBrightness,
      elevation: widget.elevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      padding: widget.padding,
      shape: widget.shape,
      clipBehavior: widget.clipBehavior,
      materialTapTargetSize: widget.materialTapTargetSize,
      animationDuration: widget.animationDuration,
      minWidth: widget.minWidth,
      height: widget.height,
      child: loadingChild,
    );
  }
}