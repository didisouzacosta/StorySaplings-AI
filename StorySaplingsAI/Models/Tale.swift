//
//  Tale.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import Foundation

struct Tale: Hashable, Identifiable {
    let id: Int
    let title: String
    let cover: URL
    let history: [StoryPart]
    let isFree: Bool
    let author: String
}

struct StoryPart: Hashable {
    let text: String
    let image: URL
}

extension Tale {
    
    static var tales: [Tale] {
        [
            .init(
                id: 1,
                title: "Frog o bravo",
                cover: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/Histories/frog_the_brave/cover.jpg?raw=true")!,
                history: [
                    .init(
                        text: """
                        Em tempos de honra e valor,
                        Um guerreiro, bravo, lutava sem temor.
                        Ao lado do mestre, em batalha dura,
                        Enfrentou um mago de era futura.
                        """,
                        image: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/Histories/frog_the_brave/page_1.jpg?raw=true")!
                    ),
                    .init(
                        text: """
                        Com feitiço cruel, o mago o transformou,
                        Num sapo frágil, a vida mudou.
                        Recluso em pântano, amigos encontrou,
                        Em duras batalhas, a honra revelou.
                        """,
                        image: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/Histories/frog_the_brave/page_2.jpg?raw=true")!
                    ),
                    .init(
                        text: """
                        Lutando com força, a amizade cresceu,
                        Com novos amigos, o medo morreu.
                        Juntos venceram perigos sem fim,
                        A coragem guiava, o destino, enfim.
                        """,
                        image: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/Histories/frog_the_brave/page_3.jpg?raw=true")!
                    ),
                    .init(
                        text: """
                        O mestre vingou, o mago caiu,
                        Com força e coragem, o bem ressurgiu.
                        Sua real aparência, ao fim, ele recuperou,
                        O bravo guerreiro em glória retornou.
                        """,
                        image: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/Histories/frog_the_brave/page_4.jpg?raw=true")!
                    )
                ],
                isFree: true,
                author: "David Wiesner"
            )
        ]
    }
    
}
