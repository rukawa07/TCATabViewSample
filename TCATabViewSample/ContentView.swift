//
//  ContentView.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    @Bindable var store = StoreOf<AppRouter>(initialState: AppRouter.State()) {
        AppRouter()
            ._printChanges()
    }

    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.selectedTabChanged)) {
            Tab(value: .pushNavigation) {
                MyPushNavigationView(store: store.scope(state: \.pushNavigation, action: \.pushNavigation))
            } label: {
                Image(systemName: store.selectedTab == .pushNavigation ? "text.page.fill" : "apple.logo")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Push")
            }

            Tab(value: .scroll) {
                MyScrollView(store: store.scope(state: \.scroll, action: \.scroll))
            } label: {
                Image(systemName: store.selectedTab == .scroll ? "scroll.fill" : "apple.logo")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("Scroll")
            }
        }
    }
}

#Preview {
    ContentView()
}
