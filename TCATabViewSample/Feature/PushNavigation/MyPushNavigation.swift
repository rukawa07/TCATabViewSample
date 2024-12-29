//
//  MyPushNavigation.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import ComposableArchitecture

@Reducer
public struct MyPushNavigation {
    public init() {}

    @Reducer
    public enum Path {
        case child(MyPushNavigationChild)
    }

    @ObservableState
    public struct State: Equatable {
        public init() {}
        var path = StackState<Path.State>()
    }

    public enum Action {
        case path(StackActionOf<Path>)  // Child reducerのアクションを検知するためのアクション
        case toChild
        case toRoot
    }

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .path(.element(id: _, action: .child(.delegate(.nextChildButtonTapped)))):
                state.path.append(.child(MyPushNavigationChild.State()))
                return .none
            case .path:
                return .none
            case .toChild:
                state.path.append(.child(MyPushNavigationChild.State()))
                return .none
            case .toRoot:
                state.path.removeAll()
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
extension MyPushNavigation.Path.State: Equatable {}
