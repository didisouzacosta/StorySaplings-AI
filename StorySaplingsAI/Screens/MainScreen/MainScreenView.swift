//
//  MainScreenView.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import SwiftUI

struct MainScreenView: View {
    @Environment(TaleStore.self) private var store
    
    @State private var selectedTale: Tale?
    
    var body: some View {
        Group {
            if store.isLoading {
                ProgressView()
            } else {
                VStack(spacing: 16) {
                    Spacer()
                    
                    Text("Story Saplings")
                        .font(.title3)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    CardsList(tales: store.tales) { tale in
                        selectedTale = tale
                    }
                }
            }
        }
        .fullScreenCover(item: $selectedTale) { tale in
            TaleScreenView(tale: tale)
        }
    }
}

#Preview {
    MainScreenView()
        .environment(TaleStore())
}

