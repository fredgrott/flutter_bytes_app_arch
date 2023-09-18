// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of Material3 Layout package
// Copyright 2023 Egor Taqbula
// BSD-clause-3 license.
// see https://github.com/egortabula/material3_layout

/// Enum representing the possible layout modes for the app.
enum LayoutsEnum {
  /// Single pane layout where only one page is displayed at a time.
  singlePane,

  /// Two pane layout where two pages are displayed side by side.
  /// First pane is fixed and second pane is flexible
  twoPane,

  /// Split pane layout where two equal pages are displayed with a divider between them.
  splitPane,
}
