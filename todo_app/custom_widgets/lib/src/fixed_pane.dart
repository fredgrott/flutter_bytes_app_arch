


import 'package:flutter/material.dart';

class FixedPane extends StatelessWidget {

  /// The child widget to display within this layout.
  final Widget child;

  const FixedPane({
    super.key,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);



    return Material(
      color: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,

      child: SizedBox(
            width: 340,
            height: double.infinity,
            child: child,
          ),
     );

  }





}
