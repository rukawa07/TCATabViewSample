//
//  MyScrollView.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

struct MyScrollView: View {
    @Bindable var store: StoreOf<MyScroll>

    init(store: StoreOf<MyScroll>) {
        self.store = store
    }

    var body: some View {
        ScrollView {
            ForEach(0..<100) { i in
                Text("Item \(i)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .id(i)
            }
        }
        .scrollPosition($store.position)
    }
}

#Preview {
    MyScrollView(store: Store(initialState: MyScroll.State()) {
        MyScroll()
    })
}
