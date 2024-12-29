//
//  MyPushNavigationChild.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import ComposableArchitecture

@Reducer
public struct MyPushNavigationChild {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}
    }

    public enum Action {
        case delegate(Delegate)

        public enum Delegate {
            case nextChildButtonTapped
        }
    }

    public var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .delegate(.nextChildButtonTapped):
                return .none
            }
        }
    }
}
