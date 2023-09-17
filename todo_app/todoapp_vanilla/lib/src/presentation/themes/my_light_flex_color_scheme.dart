// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_color_schemes.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_key_colors.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_sub_themes_data.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_tones.dart';

FlexColorScheme myLightFlexColorScheme = FlexColorScheme.light(
  /// The overall [ColorScheme] based colors for the theme.
  ///
  /// This property provides an alternative way to define custom colors for
  /// [FlexColorScheme] and is available from version 4.2.0. It is useful if
  /// you already have a custom [ColorScheme] based color definition that
  /// you want to use with FlexColorScheme theming and its sub-theming
  /// capabilities, often used with Material 3 based design and its seed
  /// generated color schemes.
  ///
  /// The factories [FlexColorScheme.light] and [FlexColorScheme.dark] provide
  /// convenience factories for also generating M3 based seeded themes using
  /// the built-in [FlexSchemeColor] colors as seed color(s), or using custom
  /// color values you provide as seed colors.
  ///
  /// If you provide both a [ColorScheme] and some individual direct property
  /// values that also exist in a [ColorScheme], the direct property values
  /// will override the corresponding ones in your [ColorScheme].
  ///
  /// If you do not define a [colorScheme], the individual color value
  /// properties and their defaults are used to define your effective
  /// [FlexColorScheme] and its resulting [ColorScheme] and [ThemeData].
  ///
  /// The [FlexColorScheme]'s effective [ColorScheme] can be returned with
  /// [toScheme]. This will always get you a complete color scheme, including
  /// calculated and derived color values,. This can be used when using the
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] factories to compute
  /// schemes with branded or tinted surface colors. The effective [ColorScheme]
  /// of your theme is often needed if you want to create component sub-themes
  /// that should use the colors from the scheme, with its color assignments
  /// computed from the input colors.
  colorScheme: customLightColorScheme,

  /// The density value for specifying the compactness of various UI components.
  ///
  /// Consider using [FlexColorScheme.comfortablePlatformDensity].
  /// It is similar to [VisualDensity.adaptivePlatformDensity], but the
  /// density for desktop and Web is less dense in order to offer a bit larger
  /// touch friendly surfaces, but not quite as large as small touch devices.
  ///
  /// This is the same property as in [ThemeData] factory, it is just
  /// passed along to it. Included for convenience to avoid a copyWith if
  /// to change it.
  ///
  /// Density, in the context of a UI, is the vertical and horizontal
  /// "compactness" of the elements in the UI. It is unit less, since it means
  /// different things to different UI elements. For buttons, it affects the
  /// spacing around the centered label of the button. For lists, it affects the
  /// distance between baselines of entries in the list.
  ///
  /// Typically, density values are integral, but any value in range may be
  /// used. The range includes values from [VisualDensity.minimumDensity] (which
  /// is -4), to [VisualDensity.maximumDensity] (which is 4), inclusive, where
  /// negative values indicate a denser, more compact, UI, and positive values
  /// indicate a less dense, more expanded, UI. If a component doesn't support
  /// the value given, it will clamp to the nearest supported value.
  ///
  /// The default for visual densities is zero for both vertical and horizontal
  /// densities, which corresponds to the default visual density of components
  /// in the Material Design specification.
  ///
  /// As a rule of thumb, a change of 1 or -1 in density corresponds to 4
  /// logical pixels. However, this is not a strict relationship since
  /// components interpret the density values appropriately for their needs.
  ///
  /// A larger value translates to a spacing increase (less dense), and a
  /// smaller value translates to a spacing decrease (more dense).
  ///
  /// Defaults to [VisualDensity.adaptivePlatformDensity].
  visualDensity: VisualDensity.adaptivePlatformDensity,

  /// Blends theme colors into surfaces and backgrounds.
  ///
  /// If defined, used mode overrides the older [surfaceStyle]
  /// property setting. Prefer using [surfaceMode] over [surfaceStyle],
  /// it offers more color branded surface modes and separate control over
  /// the used branding level via the separate [blendLevel] property.
  ///
  /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] can be used to
  /// replace the style that was produced when using old and removed
  /// `FlexColorScheme.surfaceStyle` enum property `FlexSurface` in
  /// [FlexColorScheme.light] and [FlexColorScheme.dark] before version 4.
  ///
  /// The mode [FlexSurfaceMode.highBackgroundLowScaffold] uses the same
  /// design concept as the only style offered via removed `FlexSurface`
  /// in `FlexColorScheme.surfaceStyle` that was in use before version 4,
  /// and deprecated in version 4.2 and removed in version 5.0.0.
  ///
  /// By adjusting the [FlexColorScheme.blendLevel] property and using this
  /// style, you can find a similar visual effect when using
  /// [FlexSurfaceMode.highBackgroundLowScaffold] with the following values
  /// when matching match most prominent blended [ColorScheme.background]
  /// color.
  ///
  /// In light theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    2% : blendLevel = 3...4
  /// * [FlexSurface.medium]   4% : blendLevel = 7
  /// * [FlexSurface.strong]   6% : blendLevel = 10
  /// * [FlexSurface.heavy]    8% : blendLevel = 13...14
  ///
  /// In dark theme mode:
  ///
  /// * [FlexSurface.material] 0% : blendLevel = 0
  /// * [FlexSurface.light]    5% : blendLevel = 8
  /// * [FlexSurface.medium]   8% : blendLevel = 13...14
  /// * [FlexSurface.strong]  11% : blendLevel = 19
  /// * [FlexSurface.heavy]   14% : blendLevel = 23
  ///
  /// Since there it is not the same relationship between background and
  /// surface, when using the older [FlexSurface] based style, that uses
  /// individually tuned relationships. The old and new designs do never
  /// align exactly at any blendLevel. The above values produce visually
  /// similar results for the most prominent background color blend.
  ///
  /// To get elevation overlay color in dark themes on all surfaces used by
  /// [Material], use one of the modes where background and dialog color
  /// equals the blend strength on surface color, like [level],
  /// [levelSurfacesLowScaffold], [highScaffoldLowSurfaces] and
  /// [highScaffoldLowSurfaces]. Other modes will only use
  /// elevation overlay if their background happens to be equal to resulting
  /// colorScheme.surface color. For more information
  /// see issue: https://github.com/flutter/flutter/issues/90353
  ///
  /// When using very strong surface branding in dark mode, having an overlay
  /// elevation color in dark mode is less critical, since the elevation
  /// becomes partially visible via shadows and the surface may even have
  /// another color tint if using e.g. [levelSurfacesLowScaffoldVariantDialog]
  /// or [highScaffoldLowSurfacesVariantDialog].
  ///
  /// If values for the properties [surface], [background],
  /// [dialogBackground] or [scaffoldBackground] are given,
  /// they are used instead of values that would be assigned based
  /// on used [FlexSurfaceMode] via [surfaceMode] or [FlexSurface] in
  /// this [surfaceMode].
  ///
  /// Defaults to using [FlexSurfaceMode.highScaffoldLowSurfaces] when
  /// [blendLevel] > 0.
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,

  /// Sets the blend level strength used by the surface mode.
  ///
  /// The blend level is the integer decimal value of the alpha value
  /// used in the alpha blend function. It mixes one color with another
  /// by using alpha opacity value in the color of a surface put on top of
  /// another surface with opaque color and returns the result as one opaque
  /// color.
  ///
  /// Defaults to 0.
  blendLevel: 0,

  /// Style used to define the themed color of the AppBar background color.
  ///
  /// Defaults to null, which when [useMaterial3] is false results in
  /// [FlexAppBarStyle.primary] which produces the same results
  /// as a Flutter standard M2 light [ThemeData.from] by tying the app bar
  /// color to the primary color. If [useMaterial3] is true it defaults
  /// [FlexAppBarStyle.surface] which is the same as M3 default.
  appBarStyle: FlexAppBarStyle.material,

  /// Themed [AppBar] opacity.
  ///
  /// The opacity is applied to the effective AppBar color, which may be from
  /// used [appBarStyle], that gets its color selection from used [scheme]
  /// or [colors]. Or that color may have been overridden by AppBar sub-theme
  /// and there selected [SchemeColor] based color.
  /// Lastly and with highest priority it may be from here directly supplied
  /// [appBarBackground] color.
  ///
  /// A useful opacity range is from 0.85 to 0.95 when using the [Scaffold]
  /// property [extendBodyBehindAppBar] set to true, to partially show
  /// scrolling content behind the app bar. To use more opacity, in a way
  /// that the AppBar does not become too transparent, you also need to blur
  /// the background to create a frosted glass effect. This cannot
  /// be made with only theming, you need a custom AppBar Widget for that.
  /// Frosted glass UI effect is thus beyond the scope of what
  /// FlexColorScheme can do alone as it only affects ThemeData.
  ///
  /// If null, defaults to 1, fully opaque, no transparency.
  /// If not null, must be from 0 to 1.
  appBarOpacity: 10,

  /// When set to `true`, it makes the status bar on Android the same color as
  /// the rest of the AppBar.
  ///
  /// Defaults to true.
  ///
  /// When true, the AppBar in Android mimics the look of one-toned AppBar's
  /// typically used on iOS. Set to `false`, to revert back and use
  /// Android's default two-toned look. If true the status bar area is
  /// actually also transparent so that if the app bar is also translucent,
  /// content that scrolls behind it, is also visible behind the status
  /// bar area.
  ///
  /// In standard Material 2 this would be false, FCS uses an opinionated
  /// style and sets it true. In Material 3 the style you get when setting
  /// this to true is used by default. In M3 mode FCS will thus not create
  /// an AppBar sub theme to adjust this,if it is true and it is not needed
  /// for any other direct AppBar impacting properties in FlexColorScheme
  /// constructor. In M2 mode an AppBar theme will always be created, also
  /// when not opting in on the actual sub-themes feature, this per its
  /// opinionated and legacy styling for M2 mode.
  transparentStatusBar: true,

  /// The themed elevation for the [AppBar].
  ///
  /// If not defined, defaults to 0 in M2 (FCS opinionated) and to 0 in (M3
  /// spec default).
  ///
  /// The FCS 0dp elevation in M2 is an iOS style influenced opinionated
  /// choice, it can easily be adjusted for the theme with this property.
  appBarElevation: 0,

  /// The themed elevation for the [BottomAppBar].
  ///
  /// If undefined (null), defaults to 3 in M3 mode and to 8 in M2 mode,
  /// both via the defaults for the respective theme mode from Flutter's
  /// default elevation behavior of [BottomAppBar].
  bottomAppBarElevation: 0,

  /// Select preferred style for the default [TabBarTheme].
  ///
  /// By default the TabBarTheme is made to fit with the style of the AppBar.
  /// In M2 mode that is done by defaulting to using
  /// [FlexTabBarStyle.forAppBar] if not defined. In M3 mode it done by
  /// defaulting to using [FlexTabBarStyle.flutterDefault].
  ///
  /// When setting this to [FlexTabBarStyle.forBackground], it will default
  /// to a theme that uses the color scheme and fits on background color,
  /// which typically also on works surface and scaffoldBackground color.
  /// This TabBarTheme style is useful if you primarily intended to use the
  /// TabBar in a Scaffold, Dialog, Drawer or Side panel on their background
  /// colors.
  tabBarStyle: FlexTabBarStyle.universal,

  /// Makes the light theme backgrounds lighter or even white.
  ///
  /// Scaffold background will become white, and other surfaces also get
  /// lighter (8%), if using low blend levels they may become fully white too.
  lightIsWhite: false,

  /// Set to true to automatically swap secondary and tertiary colors, on
  /// built-in color schemes when [useMaterial3] is true, that benefit
  /// from it to better match the Material 3 color system design intent.
  ///
  /// Starting with FlexColorScheme version 6.1.0, built-in color schemes,
  /// defined via [FlexSchemeColor], have a flag [swapOnMaterial3]. When
  /// defined to be true, the scheme will benefit if the [secondary] and
  /// [tertiary] colors, including their containers, are swapped when using
  /// Material 3. Most FlexColorScheme color schemes were designed with
  /// M2 usage in mind, before M3 existed. They may often have their
  /// [swapOnMaterial3] set to true. If this flag is false, it may mean
  /// that its `FlexSchemeColor` was designed for M3 or that it won't
  /// benefit from swapping its secondary and tertiary colors. In the
  /// [Scheme Reference](https://docs.flexcolorscheme.com/scheme_reference),
  /// you can see which schemes have the flag defined to true.
  ///
  /// Using a seed-generated color scheme based on built-in FlexSchemeColor
  /// colors is another way to make them suitable for the M3 Color system.
  /// However, in some cases, the secondary color in their design may not
  /// be in-line with the M3 color system design intent, especially if you
  /// use the config that also uses the hue from the secondary color to
  /// make tonal palettes for it. In some legacy FlexSchemeColor color
  /// designs this can be fixed if we swap the secondary and tertiary colors.
  ///
  /// To make FlexSchemeColor designs color designs that benefit from it
  /// automatically swap secondary and tertiary colors when [useMaterial3]
  /// is set to true, set `swapLegacyOnMaterial3` to true. It defaults to
  /// false, for backward compatibility, but it is recommended to turn
  /// it on when using Material 3 and its color system. If you use
  /// seeded color schemes with Material 2, [useMaterial3] flag is false,
  /// then it may be preferable to keep [swapOnMaterial3] false for more
  /// prominent colors on secondaries.
  ///
  /// This color swap has higher priority than [swapColor], using it will
  /// always happen on the effective result of [swapLegacyOnMaterial3] and
  /// [useMaterial3], and value of [swapOnMaterial3] in currently used
  /// built-in scheme [FlexSchemeColor].
  ///
  /// If a custom [colorScheme] is passed in, or any of the direct color
  /// properties [secondary], [secondaryContainer], [tertiary] or
  /// [tertiaryContainer], then it is assumed a custom scheme or overrides,
  /// are being used and the [swapLegacyOnMaterial3] setting does nothing.
  ///
  /// The Themes Playground app defaults to setting [swapLegacyOnMaterial3]
  /// to ON (true), but allows you to turn it OFF.
  ///
  /// Defaults to false, for backwards compatibility, but prefer setting it
  /// to true if you also set [useMaterial3] to true.
  swapLegacyOnMaterial3: false,

  /// When true, the primary and primaryContainer colors will be swapped with
  /// their secondary counterparts.
  ///
  /// Set this flag to true if you want to make a theme where
  /// your primary and secondary colors are swapped, compared to how they
  /// are defined in the passed in color properties or used pre-defined
  /// color scheme.
  ///
  /// This is useful if you want to do this with the pre-defined
  /// schemes. If you are explicitly defining all your theme colors you can
  /// of course define them in any desired config. Even if you do
  /// that, this feature will still swap whatever colors you defined
  /// for primary and secondary. You can offer this feature as an easy end
  /// user modifiable theme option if you like. One usage possibility is to
  /// set `swapColors` to true only for the dark modem and use your color
  /// scheme the other way around only in dark mode.
  swapColors: false,

  /// When set to true, tooltip background color will match the brightness of
  /// the theme's background color.
  ///
  /// By default Flutter's Material tooltips use a theme where the tooltip
  /// background color brightness is inverted in relation to the overall
  /// theme's background color.
  ///
  /// [FlexColorScheme] allows you to use a single toggle to invert this.
  /// Light tooltips on light background is e.g. the default style on
  /// Windows Desktop toggle. You can use this toggle to use this style,
  /// or use it as a means to create a platform adaptive tooltip style, where
  /// the Material and Flutter style is used on devices and Web, but the
  /// inverted scheme is used on e.g. Windows platform.
  ///
  /// Defaults to false, and uses same background style as Material Design
  /// guide and Flutter.
  ///
  /// Additional tooltip styles when NOT opting in on FlexColorScheme sub
  /// themes are:
  ///
  /// - tooltipsMatchBackground: false
  ///   - none
  ///
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background: Color(0xF0FCFCFC),
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xED444444),
  ///     - text: white
  ///   - Border radius: 4 dp
  ///   - Border: Yes, dividerColor
  ///   - Desktop OS (macOS, Linux, Windows)
  ///     - Font size : 12 dp
  ///   - Mobile OS (iOS, Android, Fuchsia)
  ///     - Font size : 14 dp
  ///
  /// Additional styles when opting in on FlexColorScheme sub themes are:
  ///
  /// - Desktop OS (macOS, Linux, Windows)
  ///   - Font size : 12 dp
  /// - Mobile OS (iOS, Android, Fuchsia)
  ///   - Font size : 14 dp
  /// - Border radius: 8 dp
  /// - Border: Yes, dividerColor
  /// - tooltipsMatchBackground: false
  ///   - light theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 45%) opacity 95%
  ///     - text: white
  ///   - Dark theme:
  ///     - background: Color(0xFFFFFFFF).blendAlpha(primary, 39%) opacity 95%
  ///     - text: black
  /// - tooltipsMatchBackground: true
  ///   - light theme:
  ///     - background:  Color(0xFFFFFFFF).blendAlpha(primary, 4%) opacity 95%
  ///     - text: black
  ///   - Dark theme:
  ///     - background: Color(0xFF111111).blendAlpha(primary, 16%) opacity 95%
  ///     - text: white
  ///
  /// When using additional theming via sub-themes properties, its
  /// properties will if used override background color, text color and
  /// background opacity as well as border radius.
  tooltipsMatchBackground: true,

  /// Activate using FlexColorScheme opinionated component sub-themes by
  /// passing in a default `FlexSubThemesData()`.
  ///
  /// To further configure the sub-themes, change the simple flat value
  /// properties as desired in `FlexSubThemesData()`.
  ///
  /// By default [FlexThemeData.light], [FlexThemeData.dark] and
  /// [FlexColorScheme.toTheme], do as little as they need to just
  /// provide a consistent Material 2 color schemed theme. The additions they
  /// do are described in [FlexColorScheme.toTheme].
  ///
  /// The original purpose of the opinionated sub-themes was to make it easy
  /// to add themed corner radius to all Widgets that support it, and to
  /// provide a consistent look on all buttons, including [ToggleButtons].
  ///
  /// Therefore the sub themes are a convenient way to opt-in on customized
  /// corner radius on Widgets using above themes. By opting in you can set
  /// corner radius for all covered Widgets to same corner radius in one go.
  /// There are also properties to override the global default for each widget
  /// to set different rounding per widget if so desired.
  ///
  /// By default, if a `defaultRadius` is not specified, each widgets corner
  /// radius and some other styling take inspiration from the Material 3 (M3)
  /// specification https://m3.material.io/ and uses its specifications as
  /// defaults when it is possible to do so in Flutter SDK theming, within
  /// its current Material 2 (M2) design limitations.
  ///
  /// Starting from version 5, by opting in via a default [subThemesData] you
  /// get an extensive set of widget component sub themes applied.
  /// They can be customized via the [subThemesData] property, that has
  /// quick and flat sub theme configuration values in the data class
  /// [FlexSubThemesData].
  ///
  /// Opinionated sub themes are provided for:
  ///
  /// * [AppBarTheme] for [AppBar] via [FlexSubThemes.appBarTheme].
  /// * [BottomAppBarTheme] for [BottomAppBar] via
  ///   [FlexSubThemes.bottomAppBarTheme].
  /// * [BottomNavigationBarThemeData] for [BottomNavigationBar] via
  ///   [FlexSubThemes.bottomNavigationBar].
  /// * [BottomSheetThemeData] for [BottomSheet] via
  ///   [FlexSubThemes.bottomSheetTheme].
  /// * [ButtonThemeData] for old deprecated buttons, via
  ///   [FlexSubThemes.buttonTheme].
  /// * [CardTheme] for [Card] via [FlexSubThemes.cardTheme].
  /// * [CheckboxThemeData] for [Checkbox] via [FlexSubThemes.checkboxTheme].
  /// * [ChipThemeData] for [Chip] via [FlexSubThemes.chipTheme].
  /// * [DatePickerThemeData] for [DatePicker] via
  ///   [FlexSubThemes.datePickerTheme].
  /// * [DialogTheme] for [Dialog] via [FlexSubThemes.dialogTheme].
  /// * [DrawerThemeData] for [Drawer] via [FlexSubThemes.drawerTheme].
  /// * [DropdownMenuThemeData] for [DropDownMenu] via
  ///   [FlexSubThemes.dropdownMenuTheme].
  /// * [ElevatedButtonThemeData] for [ElevatedButton] via
  ///   [FlexSubThemes.elevatedButtonTheme].
  /// * [FilledButtonThemeData] for [FilledButton] via
  ///   [FlexSubThemes.filledButtonTheme].
  /// * [FloatingActionButtonThemeData] for [FloatingActionButton] via
  ///   [FlexSubThemes.floatingActionButtonTheme].
  /// * [IconButtonThemeData] for [IconButton] via
  ///   [FlexSubThemes.iconButtonTheme].
  /// * [InputDecorationTheme] for [InputDecoration] via
  ///   [FlexSubThemes.inputDecorationTheme].
  /// * [MenuBarThemeData] for [MenuBar] via [FlexSubThemes.menuBarTheme].
  /// * [MenuButtonThemeData] for [MenuButton] via
  ///   [FlexSubThemes.menuButtonTheme].
  /// * [MenuThemeData] for [MenuBar], [MenuAnchor] and [DropDownMenu] via
  ///   [FlexSubThemes.menuTheme].
  /// * [ListTileThemeData] for [ListTile] via
  ///   [FlexSubThemes.listTileTheme].
  /// * [NavigationBarThemeData] for [NavigationBar] via
  ///   [FlexSubThemes.navigationBarTheme].
  /// * [NavigationDrawerThemeData] for [NavigationDrawer] via
  ///   [FlexSubThemes.navigationDrawerTheme].
  /// * [NavigationRailThemeData] for [NavigationRail] via
  ///   [FlexSubThemes.navigationRailTheme].
  /// * [OutlinedButtonThemeData] for [OutlinedButton] via
  ///   [FlexSubThemes.outlinedButtonTheme].
  /// * [PopupMenuThemeData] for [PopupMenuButton] via
  ///   [FlexSubThemes.popupMenuTheme].
  /// * [RadioThemeData] for [Radio] via [FlexSubThemes.radioTheme].
  /// * [SliderThemeData] for [Slider] via [FlexSubThemes.sliderTheme].
  /// * [SnackBarThemeData] for [SnackBar] via [FlexSubThemes.snackBarTheme].
  /// * [SwitchThemeData] for [Switch] via [FlexSubThemes.switchTheme].
  /// * [TabBarTheme] for [TabBar] via [FlexSubThemes.tabBarTheme].
  /// * [TextButtonThemeData] for [TextButton] via
  ///   [FlexSubThemes.textButtonTheme].
  /// * [TextSelectionThemeData] for [TextField] via
  ///   [FlexSubThemes.textSelectionTheme].
  /// * [TimePickerThemeData] for [TimePickerDialog] via
  ///   [FlexSubThemes.timePickerTheme].
  /// * [ToggleButtonsThemeData] for [ToggleButtons] via
  ///   [FlexSubThemes.toggleButtonsTheme].
  /// * [TooltipThemeData] for [Tooltip] via [FlexSubThemes.tooltipTheme].
  ///
  /// * The custom `ButtonThemeData` even still provides matching styling to
  ///   the deprecated legacy buttons if they are used.
  ///
  /// Defaults to null, resulting in FlexColorScheme not using any extra
  /// sub-theming in addition to those described in [FlexColorScheme.toTheme].
  subThemesData: customFlexSubThemesData,

  /// To use and activate Material 3 color system based [ColorScheme]
  /// defined via key colors for primary, secondary and tertiary colors and
  /// the [TonalPalette] generated by these key color values, pass
  /// in a [FlexKeyColors] to [keyColors].
  ///
  /// By default it is not defined (null), and a traditional manually
  /// configured color scheme will be created based on input property values
  /// or a passed in [colorScheme].
  ///
  /// If a [FlexKeyColors] instance is passed in, the key color seeding
  /// behavior depends on properties defined in the [FlexKeyColors]
  /// instance. The default constructor makes one where
  /// [FlexKyColors.useKeyColors] is true, it will automatically enable usage
  /// of the used light scheme's primary color as key color and to seed
  /// generated a color scheme. The result will by default be equal to using
  /// Flutter SDK `ColorScheme.fromSeed`. With `FlexKeyColors` you can also
  /// use `secondary` and `tertiary` colors as key colors. Currently Flutter
  /// SDK does not support this.
  ///
  /// For more information on Material 3 color system and usage of key colors
  /// to generate tonal palettes and tones, see:
  /// https://m3.material.io/styles/color/the-color-system/key-colors-tones
  keyColors: customFlexKeyColors,

  /// Set to true, to use the new Material 3 error colors.
  ///
  /// If [useMaterial3ErrorColors] is false, the generated [ColorScheme]
  /// and [ThemeData] will use Material 2 default error colors or
  /// error colors as defined by the built in color schemes. Thus using same
  /// error colors as in FlexColorScheme versions before version 5.
  ///
  /// If [useMaterial3ErrorColors] is true, the resulting [ColorScheme]
  /// and [ThemeData] will use the Material 3 design guide error colors.
  ///
  /// Key color seed generated [ColorScheme]s always use the Material 3
  /// design guide error colors, or error colors from its customized
  /// [TonalPalette] generation setup.
  useMaterial3ErrorColors: false,

  /// A configuration class enabling complete customization of
  /// used chroma for [TonalPalette] generation for the used seed [keyColors],
  /// as well as changing which tone in the tonal palettes is used
  /// for which [ColorScheme] color.
  ///
  /// By default a `FlexTones` configuration `FlexTones.material` that
  /// matches what Flutter SDK does with `ColorScheme.fromSeed` is used.
  ///
  /// There are six other built-in definitions that you can use, they can also
  /// serve as an example of how you can make custom `FlexTones`
  /// configurations.
  tones: myLightTones,

  // textTheme:

  // primaryTextTheme:

  /// Configures the hit test size of certain Material widgets.
  ///
  /// Defaults to a [platform]-appropriate size: MaterialTapTargetSize.padded
  /// on mobile platforms, MaterialTapTargetSize.shrinkWrap on desktop
  /// platforms.
  materialTapTargetSize: null,

  /// Default [MaterialPageRoute] transitions per [TargetPlatform].
  ///
  /// [MaterialPageRoute.buildTransitions] delegates to a [platform] specific
  /// [PageTransitionsBuilder]. If a matching builder is not found, a builder
  /// whose platform is null is used.
  ///
  /// This is convenience pass through in FlexColorScheme to avoid a
  /// `copyWith` on `ThemeData` produced by FlexColorScheme.
  pageTransitionsTheme: null,

  /// Defines the appearance of ink splashes produces by [InkWell]
  /// and [InkResponse].
  ///
  /// Providing a [splashFactory] value will override the default one created
  /// by [ThemeData], it will also override any splash settings in
  /// [subThemesData].
  ///
  /// See also:
  ///
  ///  * [InkSplash.splashFactory], which defines the default splash.
  ///  * [InkRipple.splashFactory], which defines a splash that spreads out
  ///    more aggressively than the default.
  ///  * [InkSparkle.splashFactory], which defines a more aggressive and
  ///    organic splash with sparkle effects.
  splashFactory: null,

  /// The platform adaptive widgets adapt to defined target and mechanics,
  /// like scrolling too.
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith to change it.
  ///
  /// Defaults to the current platform, as exposed by [defaultTargetPlatform].
  /// This should be used in order to style UI elements according to platform
  /// conventions.
  ///
  /// Widgets from the material library should use this getter (via
  /// [Theme.of]) to determine the current platform for the purpose of
  /// emulating the platform behavior (e.g. scrolling or haptic effects).
  /// Widgets and render objects at lower layers that try to emulate the
  /// underlying platform platform can depend on [defaultTargetPlatform]
  /// directly, or may require that the target platform be provided as an
  /// argument. The `dart.io.Platform` object should only be used directly
  /// when it's critical to actually know the current platform, without
  /// any overrides possible, e.g. when a system API is about to be called.
  ///
  /// In a test environment, the platform returned is [TargetPlatform.android]
  /// regardless of the host platform. (Android was chosen because the tests
  /// were originally written assuming Android-like behavior, and we added
  /// platform adaptations for other platforms later). Tests can check
  /// behavior for other platforms by setting the [platform] of the [Theme]
  /// explicitly to another [TargetPlatform] value, or by setting
  /// [debugDefaultTargetPlatformOverride].
  ///
  /// When developing applications you can use this property to dynamically
  /// in the application change the used platform and partially test and see
  /// how adaptive widgets and scroll looks and feels on other platforms.
  platform: null,

  /// The color and geometry [TextTheme] values used to configure [textTheme].
  ///
  /// Same property as in [ThemeData] factory.
  /// Included for convenience to avoid a copyWith if it needs to be changed.
  /// Default value deviates from the Flutter standard that uses the old
  /// [Typography.material2014], in favor of newer [Typography.material2018]
  /// as default typography if one is not provided.
  ///
  /// In M3 mode FCS default to [Typography.material2021] and in M2 mode to
  /// older [Typography.material2018], which is correct for M2. Please note
  /// that Flutter ThemeData defaults to even older Typography
  /// [Typography.material2014] when not using M3. This is done for legacy
  /// compatibility reasons, you should use 2018 with M2.
  typography: Typography.material2021(),

  /// Apply a semi-transparent overlay color on Material surfaces to indicate
  /// elevation for dark themes.
  ///
  /// Same property as in [ThemeData] factory. Included for convenience to
  /// avoid a copyWith change it.
  ///
  /// In FlexColorScheme it defaults to true. In Flutter [ThemeData.from] it
  /// also default to true, but in [ThemeData] factory it defaults to false.
  ///
  /// Material drop shadows can be difficult to see in a dark theme, so the
  /// elevation of a surface should be portrayed with an "overlay" in addition
  /// to the shadow. As the elevation of the component increases, the
  /// overlay increases in opacity. The [applyElevationOverlayColor] turns the
  /// application of this overlay on or off for dark themes.
  ///
  /// If true and [brightness] is [Brightness.dark], a
  /// semi-transparent version of [ColorScheme.onSurface] will be
  /// applied on top of [Material] widgets that have a [ColorScheme.surface]
  /// color. The level of transparency is based on [Material.elevation] as
  /// per the Material Dark theme specification.
  ///
  /// If false the surface color will be used unmodified.
  ///
  /// Defaults to false in order to maintain backwards compatibility with
  /// apps that were built before the Material Dark theme specification
  /// was published. New apps should set this to true for any themes
  /// where [brightness] is [Brightness.dark].
  ///
  /// See also:
  ///
  ///  * [Material.elevation], which effects the level of transparency of the
  ///    overlay color.
  ///  * [ElevationOverlay.applyOverlay], which is used by [Material] to apply
  ///    the overlay color to its surface color.
  ///  * <https://material.io/design/color/dark-theme.html>, which specifies
  ///    how the overlay should be applied.
  ///
  /// Known limitations:
  ///
  /// Because of how the overlay color application is implemented in Flutter
  /// SDK, you will only get overlay color applied in dark mode when this
  /// value  is true, if the [Material] surface color being elevated is equal
  /// to [ThemeData.colorScheme] and its [ColorScheme.surface] color property.
  ///
  /// Thus when using color branded surfaces, if you want all [Material]
  /// surfaces in your theme to get an overlay color in dark mode, you must
  /// for dark themes only use background colors that are equal to the surface
  /// color. This when using [FlexColorScheme.dark] use a [FlexSurfaceMode]
  /// that starts with `equal`. That said, if using heavy color branding,
  /// some surfaces may not need any overlay color, so the
  /// lack of it might not be an issue with other modes in such themes.
  /// For more information about this limitation see Flutter SDK issue:
  /// https://github.com/flutter/flutter/issues/90353
  applyElevationOverlayColor: true,

  /// A temporary flag used to opt-in to new SDK Material 3 features.
  ///
  /// Flutter SDK [useMaterial3] documentation:
  /// --------------------------------------------------------
  /// If true, then widgets that have been migrated to Material 3 will
  /// use new colors, typography and other features of Material 3. If false,
  /// they will use the Material 2 look and feel.
  ///
  /// During the migration to Material 3, turning this on may yield
  /// inconsistent look and feel in your app as some widgets are migrated
  /// while others have yet to be.
  ///
  /// Defaults to false. When the Material 3 specification is complete
  /// and all widgets are migrated on stable, we will change this flag to be
  /// true by default. After that change has landed on stable, we will
  /// deprecate this flag and remove all uses of it. At that point, the
  /// `material` library will aim to only support Material 3.
  ///
  /// ## Defaults
  /// If a [ThemeData] is constructed with [useMaterial3] set to true, then
  /// some properties will get updated defaults. Please note that
  /// [ThemeData.copyWith] with [useMaterial3] set to true will
  /// not change any of these properties in the resulting [ThemeData].
  ///
  /// <style>table,td,th { border-collapse: collapse; padding: 0.45em; } td { border: 1px solid }</style>
  ///
  /// | Property        | M3 default                 | M2 default           |
  /// | :-------------- | :------------------------- | :------------------- |
  /// | [colorScheme]   | M3 baseline scheme         | M2 baseline scheme |
  /// | [typography]  | [Typography.material2021]| [Typography.material2014] |
  /// | [splashFactory] | [InkSparkle]* or [InkRipple] | [InkSplash]         |
  ///
  /// \* if the target platform is Android and the app is not
  /// running on the web, otherwise it will fallback to [InkRipple].
  ///
  /// If [brightness] is [Brightness.dark] then the default color scheme will
  /// be either the M3 baseline dark color scheme or the M2 baseline dark
  /// color scheme depending on [useMaterial3].
  ///
  /// ## Affected widgets
  ///
  /// This flag affects styles and components.
  ///
  /// ### Styles
  ///   * Color: [ColorScheme], [Material] (see table above)
  ///   * Shape: (see components below)
  ///   * Typography: [Typography] (see table above)
  ///
  /// ### Components
  ///   * Badges: [Badge]
  ///   * Bottom app bar: [BottomAppBar]
  ///   * Bottom sheets: [BottomSheet]
  ///   * Buttons
  ///     - Common buttons: [ElevatedButton], [FilledButton],
  ///       [OutlinedButton], [TextButton]
  ///     - FAB: [FloatingActionButton], [FloatingActionButton.extended]
  ///     - Icon buttons: [IconButton]
  ///     - Segmented buttons: [SegmentedButton]
  ///   * Cards: [Card]
  ///   * Checkbox: [Checkbox]
  ///   * Chips:
  ///     - [ActionChip] (used for Assist and Suggestion chips),
  ///     - [FilterChip], [ChoiceChip] (used for single select filter chips),
  ///     - [InputChip]
  ///   * Dialogs: [Dialog], [AlertDialog]
  ///   * Divider: [Divider]
  ///   * Lists: [ListTile]
  ///   * Menus: [MenuBar], [DropdownMenu]
  ///   * Navigation bar: [NavigationBar] (replacing [BottomNavigationBar])
  ///   * Navigation drawer: [NavigationDrawer]
  ///   * Navigation rail: [NavigationRail]
  ///   * Progress indicators: [CircularProgressIndicator],
  ///     [LinearProgressIndicator]
  ///   * Radio button: [Radio]
  ///   * Snack bar: [SnackBar]
  ///   * Slider: [Slider]
  ///   * Switch: [Switch]
  ///   * Tabs: [TabBar]
  ///   * TextFields: [TextField] together with its [InputDecoration]
  ///   * Top app bar: [AppBar]
  ///
  /// In addition, this flag enables features introduced in Android 12.
  ///   * Stretch overscroll: [MaterialScrollBehavior]
  ///   * Ripple: `splashFactory` (see table above)
  ///
  /// See also:
  ///
  ///   * [Material 3 specification](https://m3.material.io/)
  useMaterial3: true,
);

ThemeData customLightThemeData = myLightFlexColorScheme.toTheme;
