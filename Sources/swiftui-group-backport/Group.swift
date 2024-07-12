import SwiftUI

public struct VariadicForEach<Base: View, Content: View>: View {

  private struct _MultiViewRoot: _VariadicView_MultiViewRoot {

    let makeContent: (_VariadicView.Children.Element) -> Content

    func body(children: _VariadicView.Children) -> some View {
      ForEach(children) { child in
        makeContent(child)
      }
    }
  }

  private let tree: _VariadicView.Tree<_MultiViewRoot, Base>

  public init(subviews view: Base, content: @escaping (_VariadicView.Children.Element) -> Content) {
    self.tree = _VariadicView.Tree.init(_MultiViewRoot(makeContent: content)) {
      view
    }
  }

  public var body: some View {
    tree
  }

}

#if DEBUG

#Preview {
  VariadicForEach(subviews: Group {
    Text("A")
    Text("A")
    Text("A")
  }, content: { v in
    HStack {
      Text(">")
      v
    }
  })
}

#endif
