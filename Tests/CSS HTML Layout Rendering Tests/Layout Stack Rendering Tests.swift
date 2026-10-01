import CSS_HTML_Layout_Rendering
import CSS_Standard
import HTML_Rendering
import Testing

@Suite
struct `Layout stack rendering` {
    private static func css(_ document: some HTML.View) throws -> String {
        String(try String(HTML.Document { document }).filter { $0 != " " })
    }

    @Test
    func `an HStack renders a row flex container with the default gap`() throws {
        let css = try Self.css(HTML.Layout.HStack { HTML.Layout.Spacer() })
        #expect(css.contains("flex-direction:row"), "\(css)")
        #expect(css.contains("column-gap:1rem"), "\(css)")
        #expect(css.contains("display:flex"), "\(css)")
    }

    @Test
    func `a VStack renders a column flex container`() throws {
        let css = try Self.css(HTML.Layout.VStack { HTML.Layout.Spacer() })
        #expect(css.contains("flex-direction:column"), "\(css)")
    }

    @Test
    func `a zero spacing renders a zero gap`() throws {
        let css = try Self.css(HTML.Layout.HStack(spacing: 0) { HTML.Layout.Spacer() })
        #expect(css.contains("column-gap:0"), "\(css)")
        #expect(!css.contains("column-gap:1rem"), "\(css)")
    }
}
