// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Per MD3 docs this changed from xxsmal, xsmall, small, large,
// medium, large, xlarge, xxlarge, and xxxlarge to
// compact, medium, and expanded.
// see
// https://m3.material.io/foundations/layout/understanding-layout/overview
enum WindowSize { xxsmall, xsmall, small, medium, large, xlarge, xxlarge, xxxlarge }

// See
// https://m3.material.io/foundations/layout/canonical-layouts/overview
enum LayoutClass {
  listDetail,
  supportingPane,
  feed
}

// Probably cannot do it this way of MD2 as columns move to panes
// and how window class and layouts work changes per the flutter adaptive 
// scaffold package. So instead need a flexible way to 
// get screen sizes and other MediaQuery stuff to use 
// at the adaptive shared scaffold layer and new canonical layouts layers
class Breakpoints {}
