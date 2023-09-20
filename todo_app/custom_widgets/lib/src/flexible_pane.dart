import 'package:flutter/material.dart';

class FlexiblePane extends StatelessWidget {
  /// The child widget to display within this layout.
  final Widget child;

  const FlexiblePane({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final theme = Theme.of(context);
      return Material(
          color: theme.colorScheme.surface,
          surfaceTintColor: theme.colorScheme.surfaceTint,
          shadowColor: Colors.transparent,
          elevation: 2,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: child,
          ),);
    },);
  }
}
