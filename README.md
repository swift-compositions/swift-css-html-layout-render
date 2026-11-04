# swift-css-html-layout-render

Use this package when you build HTML views and want to lay them out in rows, columns and grids instead of writing flexbox and grid CSS by hand. Start from `HTML.Layout.VStack`, `HTML.Layout.HStack`, `HTML.Layout.Spacer` and `HTML.Layout.Grid.Lazy`. A `Layout<W3C_CSS_Values.Length, CSSSpace>.Stack` from swift-layout also renders as an `HTML.View` once you import this package. If you only need to set CSS properties on views, use swift-css-html-render.

## Laws

- Every container renders as a single div with inline CSS. Nothing else is added to the document.
- `HTML.Layout.HStack` is a row flex container and `HTML.Layout.VStack` a column flex container. With no spacing given, the gap between children is 1rem. A spacing of zero gives a zero gap.
- `HTML.Layout.HStack` stretches its children and aligns them to the middle by default, and never grows taller than its parent. `HTML.Layout.VStack` stretches its children by default and never grows wider than its parent.
- `HTML.Layout.Spacer` takes all free space along its stack's axis. Outside a flex container it has no effect.
- `HTML.Layout.Grid.Lazy` always fills the full width. Each column is `minmax(0, ...)` wide, so long content can't widen a column. Auto-fill and auto-fit columns are at least their minimum width and share the rest equally.
- `HTML.Layout.Grid.Lazy` renders only the first column setting in its breakpoints. Its media query is ignored, and later breakpoints are not rendered. With no breakpoints the grid has one column.
- A `Layout<W3C_CSS_Values.Length, CSSSpace>.Stack` renders as a row along its primary axis and as a column otherwise, with its spacing as the gap. Leading and trailing alignment map to flex-start and flex-end, and fill maps to stretch.
