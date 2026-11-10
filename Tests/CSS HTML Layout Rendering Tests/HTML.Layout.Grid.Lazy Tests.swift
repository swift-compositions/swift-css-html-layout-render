import CSS_HTML_Layout_Rendering
import CSS_Standard
import Dictionary_Ordered
import Dictionary_Ordered_Primitive
import HTML_Rendering
import Layout
import Testing

enum `HTML.Layout.Grid.Lazy Tests` {}

extension `HTML.Layout.Grid.Lazy Tests` {
    @Suite
    struct `Responsive columns` {
        private static func css(_ document: some HTML.View) throws -> String {
            String(try String(HTML.Document { document }).filter { $0 != " " })
        }

        private static func grid<Content: HTML.View>(
            @HTML.Builder _ content: () -> Content
        ) -> HTML.Layout.Grid.Lazy<Content> {
            var breakpoints = HTML.Layout.Grid.Lazy<Content>.Breakpoints()
            breakpoints.set(
                nil as CSS_Standard::Media?,
                HTML.Layout.Grid.Lazy<Content>.Columns.count(1)
            )
            breakpoints.set(
                CSS_Standard::Media.desktop as CSS_Standard::Media?,
                HTML.Layout.Grid.Lazy<Content>.Columns.count(3)
            )
            return HTML.Layout.Grid.Lazy(columns: breakpoints, content: content)
        }

        private static func emptyGrid<Content: HTML.View>(
            @HTML.Builder _ content: () -> Content
        ) -> HTML.Layout.Grid.Lazy<Content> {
            HTML.Layout.Grid.Lazy(
                columns: HTML.Layout.Grid.Lazy<Content>.Breakpoints(),
                content: content
            )
        }

        @Test
        func `every breakpoint renders its own column template`() throws {
            let css = try Self.css(Self.grid { HTML.Layout.Spacer() })
            #expect(css.contains("grid-template-columns:repeat(1,minmax(0,1fr))"), "\(css)")
            #expect(css.contains("@mediaonlyscreenand(min-width:832px)"), "\(css)")
            #expect(css.contains("grid-template-columns:repeat(3,minmax(0,1fr))"), "\(css)")
        }

        @Test
        func `empty breakpoints render one column`() throws {
            let css = try Self.css(Self.emptyGrid { HTML.Layout.Spacer() })
            #expect(css.contains("grid-template-columns:repeat(1,minmax(0,1fr))"), "\(css)")
        }
    }
}
