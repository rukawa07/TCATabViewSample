//
//  MyPushNaivigationChildView.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

struct MyPushNavigationChildView: View {
    @Bindable var store: StoreOf<MyPushNavigationChild>

    init(store: StoreOf<MyPushNavigationChild>) {
        self.store = store
    }

    var body: some View {
        VStack {
            Text("Child")
            Button("to Child") {
                store.send(.delegate(.nextChildButtonTapped))
            }
        }
    }
}

#Preview {
    MyPushNavigationChildView(store: Store(initialState: MyPushNavigationChild.State()) {
        MyPushNavigationChild()
    })
}
