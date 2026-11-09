public import Buffer
public import Buffer_Linear_Primitive
public import CSS_HTML_Rendering
public import CSS_Standard
public import Dictionary_Ordered
import HTML_Rendering
public import Hash_Indexed_Primitive
public import Hash_Table_Primitive
public import Layout
public import Memory
public import Memory_Allocator
public import Ownership_Shared_Primitive
public import Storage
import WHATWG_HTML_Grouping

extension HTML.Layout.Grid {
    public struct Lazy<Content: HTML.View>: HTML.View {
        public let columns: Breakpoints
        public let content: Content
        public let horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap?
        public let verticalSpacing: W3C_CSS_Flexbox.RowGap?

        public init(
            columns: Breakpoints,
            horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap? = nil,
            verticalSpacing: W3C_CSS_Flexbox.RowGap? = nil,
            @HTML.Builder content: () -> Content
        ) {
            self.columns = columns
            self.horizontalSpacing = horizontalSpacing
            self.verticalSpacing = verticalSpacing
            self.content = content()
        }

        public init(
            columns: Columns,
            horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap? = nil,
            verticalSpacing: W3C_CSS_Flexbox.RowGap? = nil,
            @HTML.Builder content: () -> Content
        ) {
            var dict = Breakpoints()
            dict.set(nil as CSS_Standard::Media?, columns)
            self.columns = dict
            self.horizontalSpacing = horizontalSpacing
            self.verticalSpacing = verticalSpacing
            self.content = content()
        }

    }
}

extension HTML.Layout.Grid.Lazy: Sendable where Content: Sendable {}

extension HTML.Layout.Grid.Lazy {

    public typealias Columns = LayoutRaw<W3C_CSS_Values.Length, CSSSpace>.Grid<Content>.Lazy.Columns

    public typealias Breakpoints = __DictionaryOrdered<
        Ownership.Shared<
            Hash.Entry<CSS_Standard::Media?, Columns>,
            Hash.Indexed<Buffer<Storage<Memory.Allocator<Memory.Heap>>.Contiguous<Hash.Entry<CSS_Standard::Media?, Columns>>>.Linear>
        >
    >

    /// One `grid-template-columns` rule per breakpoint: the entry without a
    /// media query applies unconditionally (one column when there is none),
    /// and each other entry applies inside its media query.
    public var body: some HTML.View {
        var baseColumns: Columns = .count(1)
        var responsiveColumns: [(media: CSS_Standard::Media, columns: Columns)] = []
        columns.forEach { media, value in
            if let media = copy media {
                responsiveColumns.append((media, copy value))
            } else {
                baseColumns = copy value
            }
        }
        let columnGap = horizontalSpacing == .zero ? .zero : horizontalSpacing
        let rowGap = verticalSpacing == .zero ? .zero : verticalSpacing

        var grid = HTML.AnyView(
            HTML.ContentDivision.Element { content }
                .css
                .width(.percent(100))
                .display(.grid)
                .inlineStyle("grid-template-columns", baseColumns.cssGridTemplateColumns)
                .columnGap(columnGap)
                .rowGap(rowGap)
        )
        let context = HTML.Style.Rule.Context.current
        for responsive in responsiveColumns {
            grid = HTML.AnyView(
                HTML.Styled(
                    grid,
                    StringProperty("grid-template-columns", responsive.columns.cssGridTemplateColumns),
                    atRule: HTML.AtRule.Media(responsive.media),
                    selector: context.selector,
                    pseudo: context.pseudo
                )
            )
        }
        return grid
    }
}

extension Layout.Grid.Lazy.Columns where Scalar == W3C_CSS_Values.Length {

    var cssGridTemplateColumns: String {
        switch self {
        case .count(let n):
            return "repeat(\(n), minmax(0, 1fr))"

        case .fractions(let values):
            return values.map { "minmax(0, \($0))" }.joined(separator: " ")

        case .autoFill(let minWidth):
            return "repeat(auto-fill, minmax(\(minWidth), 1fr))"

        case .autoFit(let minWidth):
            return "repeat(auto-fit, minmax(\(minWidth), 1fr))"
        }
    }
}
