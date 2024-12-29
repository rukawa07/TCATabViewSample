//
//  MyScroll.swift
//  TCATabViewSample
//
//  Created by rukawa on 2024/12/29.
//

import SwiftUI
import ComposableArchitecture

@Reducer
public struct MyScroll {
    public init() {}

    @ObservableState
    public struct State: Equatable {
        public init() {}

        var position = ScrollPosition(edge: .top)
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case scrollToTop
    }

    public var body: some Reducer<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .scrollToTop:
                withAnimation {
                    state.position.scrollTo(edge: .top)
                }
                return .none
            }
        }
    }
}
