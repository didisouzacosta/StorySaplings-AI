//
//  Card.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import SwiftUI
import NukeUI

struct Card: View {
    let tale: Tale
    let handler: () -> Void
    
    private var freemiumDescription: String {
        tale.isFree ? "Free" : "Premium"
    }
    
    private var freemiumColor: Color {
        tale.isFree ? .white : .yellow
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .overlay {
                    LazyImage(url: tale.cover, transaction: .init(animation: .easeInOut)) { state in
                        state.image?
                            .resizable()
                            .scaledToFill()
                    }
                }
            
            Rectangle()
                .fill(LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom))
                .containerRelativeFrame(.vertical) { size, _ in
                    size / 2
                }
            
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(tale.title)
                        .fontWeight(.heavy)
                        .font(.title2)
                    
                    HStack {
                        Text(tale.author)
                            .font(.footnote)
                        Spacer()
                        Text(freemiumDescription)
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.black)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(freemiumColor)
                            }
                    }
                }
                .padding()
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black.opacity(0.9))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 48)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 16)
        .padding(.vertical, 0)
        .onTapGesture {
            handler()
        }
    }
}

#Preview {
    Card(tale: Tale.tales[0]) {}
}
