//
//  AppRouter.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

typealias AppTab = AppRouter.State.Tab

@Reducer
struct AppRouter {
    @ObservableState
    struct State: Equatable {
        public init() {}

        var pushNavigation = MyPushNavigation.State()
        var scroll = MyScroll.State()

        var selectedTab = Tab.pushNavigation

        enum Tab: Equatable {
            case pushNavigation
            case scroll
        }
    }

    enum Action {
        case pushNavigation(MyPushNavigation.Action)
        case scroll(MyScroll.Action)
        case selectedTabChanged(State.Tab) // タブ切り替え用アクション
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .pushNavigation:
                return .none
            case .scroll:
                return .none
            case let .selectedTabChanged(nextTab):
                // 現在表示しているタブと同じ場合
                if nextTab == state.selectedTab {
                    switch nextTab {
                    case .pushNavigation:
                        return MyPushNavigation().reduce(into: &state.pushNavigation, action: .toRoot)
                            .map(Action.pushNavigation)
                    case .scroll:
                        return MyScroll().reduce(into: &state.scroll, action: .scrollToTop)
                            .map(Action.scroll)
                    }
                } else {
                    state.selectedTab = nextTab
                    return .none
                }
            }
        }
        Scope(state: \.pushNavigation, action: \.pushNavigation) {
            MyPushNavigation()
        }
        Scope(state: \.scroll, action: \.scroll) {
            MyScroll()
        }
    }
}
