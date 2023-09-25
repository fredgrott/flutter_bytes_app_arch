// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: parameter_assignments, unused_local_variable

import 'package:custom_widgets/src/app_breakpoints.dart';

import 'package:custom_widgets/src/running_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

const double kAppMaterialGutterValue = 8;

const double kAppMaterialCompactMinMagin = 8;

const double kAppMaterialMediumMinMargin = 12;

const double kAppMaterialExpandedMinMargin = 32;

const double kAppMaterialGiganticMinMargin = 72;

/// Implements the basic visual layout structure for
/// [Material Design 3](https://m3.material.io/foundations/adaptive-design/overview)
/// that adapts to a variety of screens.
///
/// CAUTION! The Flutter Docs are still incorrect as one needs to do
/// Theme.of to grab platform so that simulating platform when testing works!
/// Hence why RunningPlatform class is a must!
///
/// NOTE: Drawers are NOW side sheets, i.e. standard for expanded and gigantic and modal
///       for medium and compact. Per
///       https://m3.material.io/components/navigation-drawer/guidelines
///
/// Modified from the AdaptiveScaffold in the Flutter Adaptive Scaffold
/// package to support Material Design 3 Canonical Layouts and Widgets.
/// [CanonicalScaffold] provides a preset of layout, including positions and
/// animations, by handling macro changes in navigational elements and bodies
/// based on the current features of the screen, namely screen width and platform.
/// For example, the navigational elements would be a [BottomNavigationBar] on a
/// small mobile device or a [Drawer] on a small desktop device and a
/// [NavigationRail] on larger devices. When the app's size changes, for example
/// because its window is resized, the corresponding layout transition is animated.
/// The layout and navigation changes are dictated by "breakpoints" which can be
/// customized or overridden.
///
/// Also provides a variety of helper methods for navigational elements,
/// animations, and more.
///
/// [AdaptiveScaffold] is based on [AdaptiveLayout] but is easier to use at the
/// cost of being less customizable. Apps that would like more refined layout
/// and/or animation should use [AdaptiveLayout].
///
/// ```dart
/// CanonicalScaffold(
///  destinations: const [
///    NavigationDestination(icon: Icon(Icons.inbox), label: 'Inbox'),
///    NavigationDestination(icon: Icon(Icons.article), label: 'Articles'),
///    NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
///    NavigationDestination(icon: Icon(Icons.video_call), label: 'Video'),
///  ],
///  destinationsIOS: [
///
///  ]
///  smallBody: (_) => ListView.builder(
///    itemCount: children.length,
///    itemBuilder: (_, idx) => children[idx]
///  ),
///  body: (_) => GridView.count(crossAxisCount: 2, children: children),
/// ),
/// ```
///
/// See also:
///
///  * [AdaptiveLayout], which is what this widget is built upon internally and
///   acts as a more customizable alternative.
///  * [SlotLayout], which handles switching and animations between elements
///   based on [Breakpoint]s.
///  * [SlotLayout.from], which holds information regarding Widgets and the
///   desired way to animate between switches. Often used within [SlotLayout].
///  * [Design Doc](https://flutter.dev/go/adaptive-layout-foldables).
///  * [Material Design 3 Specifications] (https://m3.material.io/foundations/adaptive-design/overview).
class CanonicalScaffold extends StatefulWidget {
  /// Returns a const [AdaptiveScaffold] by passing information down to an
  /// [AdaptiveLayout].
  const CanonicalScaffold({
    super.key,
    required this.destinations,
    required this.destinationsIOS,
    this.selectedIndex = 0,
    this.leadingUnextendedNavRail,
    this.leadingExtendedNavRail,
    this.trailingNavRail,
    this.smallBody,
    this.body,
    this.largeBody,
    this.giganticBody,
    this.bodyRatio = 1.0,
    this.smallBreakpoint = AppBreakpoints.small,
    this.mediumBreakpoint = AppBreakpoints.medium,
    this.largeBreakpoint = AppBreakpoints.large,
    this.giganticBreakpoint = AppBreakpoints.gigantic,
    this.drawerBreakpoint = AppBreakpoints.smallDesktop,
    this.internalAnimations = true,
    this.bodyOrientation = Axis.horizontal,
    this.onSelectedIndexChange,
    this.useDrawer = true,
    this.appBar,
    this.navigationRailWidth = 72,
    this.extendedNavigationRailWidth = 192,
    this.appBarBreakpoint,
  });

  /// The destinations to be used in navigation items. These are converted to
  /// [NavigationRailDestination]s and [BottomNavigationBarItem]s and inserted
  /// into the appropriate places. If passing destinations, you must also pass a
  /// selected index to be used by the [NavigationRail].
  final List<NavigationDestination> destinations;

  /// Destinations for Apple devices
  final List<BottomNavigationBarItem> destinationsIOS;

  /// The index to be used by the [NavigationRail].
  final int? selectedIndex;

  /// Option to display a leading widget at the top of the navigation rail
  /// at the middle breakpoint.
  final Widget? leadingUnextendedNavRail;

  /// Option to display a leading widget at the top of the navigation rail
  /// at the largest breakpoint.
  final Widget? leadingExtendedNavRail;

  /// Option to display a trailing widget below the destinations of the
  /// navigation rail at the largest breakpoint.
  final Widget? trailingNavRail;

  /// Widget to be displayed in the body slot at the smallest breakpoint.
  ///
  /// If nothing is entered for this property, then the default [body] is
  /// displayed in the slot. If null is entered for this slot, the slot stays
  /// empty.
  final WidgetBuilder? smallBody;

  /// Widget to be displayed in the body slot at the middle breakpoint.
  ///
  /// The default displayed body.
  final WidgetBuilder? body;

  /// Widget to be displayed in the body slot at the largest breakpoint.
  ///
  /// If nothing is entered for this property, then the default [body] is
  /// displayed in the slot. If null is entered for this slot, the slot stays
  /// empty.
  final WidgetBuilder? largeBody;

  /// Widget to be displayed in the body slot at the largest breakpoint.
  ///
  /// If nothing is entered for this property, then the default [body] is
  /// displayed in the slot. If null is entered for this slot, the slot stays
  /// empty.
  final WidgetBuilder? giganticBody;

  /// Defines the fractional ratio of body to the secondaryBody.
  ///
  /// For example 0.3 would mean body takes up 30% of the available space and
  /// secondaryBody takes up the rest.
  ///
  /// If this value is null, the ratio is defined so that the split axis is in
  /// the center of the screen.
  final double? bodyRatio;

  /// The breakpoint defined for the small size, associated with mobile-like
  /// features.
  ///
  /// Defaults to [Breakpoints.small].
  final Breakpoint smallBreakpoint;

  /// The breakpoint defined for the medium size, associated with tablet-like
  /// features.
  ///
  /// Defaults to [Breakpoints.mediumBreakpoint].
  final Breakpoint mediumBreakpoint;

  /// The breakpoint defined for the large size, associated with desktop-like
  /// features.
  ///
  /// Defaults to [Breakpoints.largeBreakpoint].
  final Breakpoint largeBreakpoint;

  /// The breakpoint defined for the large size, associated with desktop-like
  /// features.
  ///
  /// Defaults to [Breakpoints.largeBreakpoint].
  final Breakpoint giganticBreakpoint;

  /// Whether or not the developer wants the smooth entering slide transition on
  /// secondaryBody.
  ///
  /// Defaults to true.
  final bool internalAnimations;

  /// The orientation of the body and secondaryBody. Either horizontal (side by
  /// side) or vertical (top to bottom).
  ///
  /// Defaults to Axis.horizontal.
  final Axis bodyOrientation;

  /// Whether to use a [Drawer] over a [BottomNavigationBar] when not on mobile
  /// and Breakpoint is small.
  ///
  /// Defaults to true.
  final bool useDrawer;

  

  /// Option to override the drawerBreakpoint for the usage of [Drawer] over the
  /// usual [BottomNavigationBar].
  ///
  /// Defaults to [Breakpoints.smallDesktop].
  final Breakpoint drawerBreakpoint;

  /// An optional [Breakpoint] which overrides the [appBar] breakpoint to display
  /// an [AppBar] without depending on the drawer visibility.
  ///
  /// By default, an [AppBar] will show on [Breakpoints.smallDesktop] if [useDrawer] is set
  /// to true.
  final Breakpoint? appBarBreakpoint;

  /// Option to override the default [AppBar] when using drawer in desktop
  /// small.
  final PreferredSizeWidget? appBar;

  /// Callback function for when the index of a [NavigationRail] changes.
  final Function(int)? onSelectedIndexChange;

  /// The width used for the internal [NavigationRail] at the medium [Breakpoint].
  final double navigationRailWidth;

  /// The width used for the internal extended [NavigationRail] at the large
  /// [Breakpoint].
  final double extendedNavigationRailWidth;

  /// Callback function for when the index of a [NavigationRail] changes.
  static WidgetBuilder emptyBuilder = (_) => const SizedBox();

  /// Public helper method to be used for creating a [NavigationRailDestination] from
  /// a [NavigationDestination].
  static NavigationRailDestination toRailDestination(
    NavigationDestination destination,
  ) {
    return NavigationRailDestination(
      label: Text(destination.label),
      icon: destination.icon,
      selectedIcon: destination.selectedIcon,
    );
  }

  /// Creates a Material 3 Design Spec abiding [NavigationRail] from a
  /// list of [NavigationDestination]s.
  ///
  /// Takes in a [selectedIndex] property for the current selected item in
  /// the [NavigationRail] and [extended] for whether the [NavigationRail]
  /// is extended or not.
  static Builder standardNavigationRail({
    required List<NavigationRailDestination> destinations,
    double width = 72,
    int? selectedIndex,
    bool extended = false,
    Color? backgroundColor,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    Widget? leading,
    Widget? trailing,
    Function(int)? onDestinationSelected,
    double? groupAlignment,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
    TextStyle? selectedLabelTextStyle,
    TextStyle? unSelectedLabelTextStyle,
    NavigationRailLabelType labelType = NavigationRailLabelType.none,
  }) {
    if (extended && width == 72) {
      width = 192;
    }
    return Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: padding,
          child: SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        labelType: labelType,
                        leading: leading,
                        trailing: trailing,
                        onDestinationSelected: onDestinationSelected,
                        groupAlignment: groupAlignment,
                        backgroundColor: backgroundColor,
                        extended: extended,
                        selectedIndex: selectedIndex,
                        selectedIconTheme: selectedIconTheme,
                        unselectedIconTheme: unselectedIconTheme,
                        selectedLabelTextStyle: selectedLabelTextStyle,
                        unselectedLabelTextStyle: unSelectedLabelTextStyle,
                        destinations: destinations,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  /// Public helper method to be used for creating a [BottomNavigationBar] from
  /// a list of [NavigationDestination]s.
  static Builder standardBottomNavigationBar({
    // adjusted to platform adaptive techniques
    required List<NavigationDestination> destinations,
    required List<BottomNavigationBarItem> destinationsIOS,
    int? currentIndex,
    double iconSize = 24,
    ValueChanged<int>? onDestinationSelected,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final NavigationBarThemeData currentNavBarTheme = NavigationBarTheme.of(context);
        return NavigationBarTheme(
          data: currentNavBarTheme.copyWith(
            iconTheme: MaterialStateProperty.resolveWith(
              (Set<MaterialState> states) {
                return currentNavBarTheme.iconTheme?.resolve(states)?.copyWith(size: iconSize) ??
                    IconTheme.of(context).copyWith(size: iconSize);
              },
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).removePadding(removeTop: true),
            child: RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context)
                ? CupertinoTabBar(
                    items: destinationsIOS,
                    currentIndex: currentIndex ?? 0,
                  )
                : NavigationBar(
                    selectedIndex: currentIndex ?? 0,
                    destinations: destinations,
                    onDestinationSelected: onDestinationSelected,
                  ),
          ),
        );
      },
    );
  }

  /// Animation from bottom offscreen up onto the screen.
  static AnimatedWidget bottomToTop(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  /// Animation from on the screen down off the screen.
  static AnimatedWidget topToBottom(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0, 1),
      ).animate(animation),
      child: child,
    );
  }

  /// Animation from left off the screen into the screen.
  static AnimatedWidget leftOutIn(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  /// Animation from on screen to left off screen.
  static AnimatedWidget leftInOut(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1, 0),
      ).animate(animation),
      child: child,
    );
  }

  /// Animation from right off screen to on screen.
  static AnimatedWidget rightOutIn(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  /// Fade in animation.
  static Widget fadeIn(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeInCubic),
      child: child,
    );
  }

  /// Fade out animation.
  static Widget fadeOut(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: ReverseAnimation(animation),
        curve: Curves.easeInCubic,
      ),
      child: child,
    );
  }

  /// Keep widget on screen while it is leaving
  static Widget stayOnScreen(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 1.0).animate(animation),
      child: child,
    );
  }

  @override
  State<CanonicalScaffold> createState() => _CanonicalScaffoldState();
}

class _CanonicalScaffoldState extends State<CanonicalScaffold> {
  @override
  Widget build(BuildContext context) {
    final NavigationRailThemeData navRailTheme = Theme.of(context).navigationRailTheme;

    // To properly use AdaptiveLayout one has to
    // wrap it in a Scaffold widget.
    return Scaffold(
      appBar: widget.drawerBreakpoint.isActive(context) && widget.useDrawer ||
              (widget.appBarBreakpoint?.isActive(context) ?? false)
          ? widget.appBar ?? AppBar()
          : null,
      drawer: widget.drawerBreakpoint.isActive(context) && widget.useDrawer
          ? NavigationDrawer(
              onDestinationSelected:widget.onSelectedIndexChange ,
              selectedIndex: widget.selectedIndex,
              children: widget.destinations.map((_) => CanonicalScaffold.toRailDestination(_)).toList() as List<Widget>,
          )
              
            //  NavigationRail(
             //   extended: true,
            //    leading: widget.leadingExtendedNavRail,
           //     trailing: widget.trailingNavRail,
           //     selectedIndex: widget.selectedIndex,
             //   destinations: widget.destinations.map((_) => CanonicalScaffold.toRailDestination(_)).toList(),
             //   onDestinationSelected: widget.onSelectedIndexChange,
             // ),
           // )
          : null,
      // Generally you always write your own custom scaffold using the AdaptiveLayout
      // and its API.
      body: AdaptiveLayout(
        bodyOrientation: widget.bodyOrientation,
        bodyRatio: widget.bodyRatio,
        internalAnimations: widget.internalAnimations,
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            widget.mediumBreakpoint: SlotLayout.from(
              key: const Key('primaryNavigation'),
              builder: (_) => CanonicalScaffold.standardNavigationRail(
                width: widget.navigationRailWidth,
                leading: widget.leadingUnextendedNavRail,
                trailing: widget.trailingNavRail,
                selectedIndex: widget.selectedIndex,
                destinations: widget.destinations.map((_) => CanonicalScaffold.toRailDestination(_)).toList(),
                onDestinationSelected: widget.onSelectedIndexChange,
                backgroundColor: navRailTheme.backgroundColor,
                selectedIconTheme: navRailTheme.selectedIconTheme,
                unselectedIconTheme: navRailTheme.unselectedIconTheme,
                selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              ),
            ),
            widget.largeBreakpoint: SlotLayout.from(
              key: const Key('primaryNavigation1'),
              builder: (_) => AdaptiveScaffold.standardNavigationRail(
                width: widget.extendedNavigationRailWidth,
                extended: true,
                leading: widget.leadingExtendedNavRail,
                trailing: widget.trailingNavRail,
                selectedIndex: widget.selectedIndex,
                destinations: widget.destinations.map((_) => AdaptiveScaffold.toRailDestination(_)).toList(),
                onDestinationSelected: widget.onSelectedIndexChange,
                backgroundColor: navRailTheme.backgroundColor,
                selectedIconTheme: navRailTheme.selectedIconTheme,
                unselectedIconTheme: navRailTheme.unselectedIconTheme,
                selectedLabelTextStyle: navRailTheme.selectedLabelTextStyle,
                unSelectedLabelTextStyle: navRailTheme.unselectedLabelTextStyle,
              ),
            ),
          },
        ),
        bottomNavigation: !widget.drawerBreakpoint.isActive(context) || !widget.useDrawer
            ? SlotLayout(
                config: <Breakpoint, SlotLayoutConfig>{
                  widget.smallBreakpoint: SlotLayout.from(
                    key: const Key('bottomNavigation'),
                    builder: (_) => CanonicalScaffold.standardBottomNavigationBar(
                      currentIndex: widget.selectedIndex,
                      destinations: widget.destinations,
                      destinationsIOS: widget.destinationsIOS,
                      onDestinationSelected: widget.onSelectedIndexChange,
                    ),
                  ),
                },
              )
            : null,
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig?>{
            Breakpoints.standard: SlotLayout.from(
              key: const Key('body'),
              inAnimation: CanonicalScaffold.fadeIn,
              outAnimation: CanonicalScaffold.fadeOut,
              builder: widget.body,
            ),
            if (widget.smallBody != null)
              widget.smallBreakpoint: (widget.smallBody != CanonicalScaffold.emptyBuilder)
                  ? SlotLayout.from(
                      key: const Key('smallBody'),
                      inAnimation: CanonicalScaffold.fadeIn,
                      outAnimation: CanonicalScaffold.fadeOut,
                      builder: widget.smallBody,
                    )
                  : null,
            if (widget.body != null)
              widget.mediumBreakpoint: (widget.body != CanonicalScaffold.emptyBuilder)
                  ? SlotLayout.from(
                      key: const Key('body'),
                      inAnimation: CanonicalScaffold.fadeIn,
                      outAnimation: CanonicalScaffold.fadeOut,
                      builder: widget.body,
                    )
                  : null,
            if (widget.largeBody != null)
              widget.largeBreakpoint: (widget.largeBody != CanonicalScaffold.emptyBuilder)
                  ? SlotLayout.from(
                      key: const Key('largeBody'),
                      inAnimation: CanonicalScaffold.fadeIn,
                      outAnimation: CanonicalScaffold.fadeOut,
                      builder: widget.largeBody,
                    )
                  : null,
            if (widget.giganticBody != null)
              widget.giganticBreakpoint: (widget.giganticBody != CanonicalScaffold.emptyBuilder)
                  ? SlotLayout.from(
                      key: const Key('largeBody'),
                      inAnimation: CanonicalScaffold.fadeIn,
                      outAnimation: CanonicalScaffold.fadeOut,
                      builder: widget.giganticBody,
                    )
                  : null,
          },
        ),
      ),
      
    );
  }
}
