//
//  MyPushNavigationView.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

struct MyPushNavigationView: View {
    @Bindable var store: StoreOf<MyPushNavigation>

    init(store: StoreOf<MyPushNavigation>) {
        self.store = store
    }

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                Text("Root")
                Button("to Child") {
                    store.send(.toChild)
                }
            }
        } destination: { store in
            switch store.case {
            case .child(let store):
                MyPushNavigationChildView(store: store)
            }
        }
    }
}

#Preview {
    MyPushNavigationView(store: Store(initialState: MyPushNavigation.State()) {
        MyPushNavigation()
    })
}
