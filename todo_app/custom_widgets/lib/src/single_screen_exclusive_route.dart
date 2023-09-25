

import 'package:custom_widgets/src/fold_observer.dart';
import 'package:flutter/material.dart';

/// Route that auto-removes itself if the app spanned horizontally.
class SingleScreenExclusiveRoute<T> extends MaterialPageRoute<T> {
  SingleScreenExclusiveRoute({
    required super.builder,
  });

  @override
  Widget buildContent(BuildContext context) {
    if (MediaQuery.of(context).hinge?.bounds.top == 0.0) {
      navigator?.removeRoute(this);
    }
    return super.buildContent(context);
  }
}
