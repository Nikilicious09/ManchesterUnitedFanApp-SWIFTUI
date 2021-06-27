//
//  MainState.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 06/06/21.
//

import SwiftUI

class MainStateModel: ObservableObject {
  // Input
  @Published var isHome = true
    
}

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
