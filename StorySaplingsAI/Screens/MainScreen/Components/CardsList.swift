//
//  Cards.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import SwiftUI

struct CardsList: View {
    
    let tales: [Tale]
    let handler: (Tale) -> Void
    
    var body: some View {
        TabView {
            ForEach(tales, id: \.self) { tale in
                Card(tale: tale) {
                    handler(tale)
                }
                .tag(tale.id)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    CardsList(tales: Tale.tales) { _ in }
}
