//
//  TaleScreenView.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 23/05/24.
//

import SwiftUI
import NukeUI

struct TaleScreenView: View {
    @Environment(\.dismiss) private var dismiss
    
    let tale: Tale
    
    @State private var position: Int? = 0
    
    private var showControls: Bool {
        guard let position else { return false }
        return position >= 1 && position < (tale.history.count + 1)
    }
    
    private var pageDescription: String {
        "\(position ?? 0) / \(tale.history.count)"
    }
    
    private func prev() {
        withAnimation {
            position? -= 1
        }
    }
    
    private func next() {
        withAnimation {
            position? += 1
        }
    }
    
    var body: some View {
        ZStack {
            LazyImage(url: tale.cover) { phase in
                phase.image?.resizable()
                    .scaledToFill()
            }
            .blur(radius: 60, opaque: true)
            .ignoresSafeArea()
            .containerRelativeFrame([.horizontal, .vertical])
            
            VStack(spacing: 16) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        VStack(spacing: 16) {
                            Spacer()
                            
                            LazyImage(url: tale.cover) { phase in
                                phase.image?
                                    .resizable()
                                    .aspectRatio(1, contentMode: .fit)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 8, y: 8)
                            
                            VStack {
                                Text(tale.title)
                                    .font(.title)
                                    .fontWeight(.heavy)
                                Text(tale.author)
                                    .font(.caption)
                            }
                            .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Button {
                                next()
                            } label: {
                                Text("Começar")
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .background {
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(.white)
                            }
                        }
                        .containerRelativeFrame(.horizontal)
                        .id(0)
                        
                        ForEach(Array(zip(tale.history.indices, tale.history)), id: \.0) { index, part in
                            VStack(spacing: 32) {
                                Spacer()
                                
                                Rectangle()
                                    .overlay {
                                        LazyImage(url: part.image) { phase in
                                            phase.image?
                                                .resizable()
                                                .scaledToFill()
                                        }
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .shadow(radius: 8, y: 8)
                                
                                Spacer()
                                
                                HStack {
                                    Text(part.text)
                                        .padding()
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.center)
                                    
                                    Spacer()
                                }
                                .containerRelativeFrame(.horizontal)
                                
                                Spacer()
                            }
                            .id(index + 1)
                        }
                        
                        VStack(spacing: 16) {
                            Spacer()
                            
                            Text("Fim")
                                .font(.title)
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("Fechar")
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                            .padding(.horizontal, 32)
                            .padding(.vertical, 8)
                            .background {
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(.white)
                            }
                        }
                        .containerRelativeFrame(.horizontal)
                        .id(tale.history.count + 1)
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $position)
                
                HStack(spacing: 32) {
                    Button {
                        prev()
                    } label: {
                        Text("Anterior")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(.white)
                    }
                    
                    Text(pageDescription)
                        .foregroundStyle(.white)
                    
                    Button {
                        next()
                    } label: {
                        Text("Próximo")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundStyle(.black)
                    }
                    .padding(.horizontal, 28)
                    .padding(.vertical, 8)
                    .background {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(.white)
                    }
                }
                .opacity(showControls ? 1 : 0)
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    TaleScreenView(tale: Tale.tales[0])
}
