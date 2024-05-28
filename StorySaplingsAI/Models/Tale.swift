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
                title: "Os 3 porquinhos",
                cover: URL(string: "https://github.com/didisouzacosta/StorySaplings-AI/blob/main/StorySaplingsAI/Resources/the_three_little_pigs_cover.jpg?raw=true")!,
                history: [
                    .init(
                        text: """
                        Três porquinhos saíram, querendo construir
                        Casas próprias, para nelas poderem residir.
                        O primeiro usou palha, fácil e ligeira,
                        O segundo escolheu madeira, obra passageira.
                        O terceiro, mais sábio, optou por tijolos,
                        Trabalho árduo, mas firme, sem rolos.
                        """,
                        image: URL(string: "https://moralstoryminute.com/wp-content/uploads/2023/11/The-Three-Little-Pigs-Story-with-Moral.jpg")!
                    ),
                    .init(
                        text: """
                        Os dois porquinhos correram, cheios de medo,
                        Para a casa de tijolos, encontrar um segredo.
                        O lobo soprou, com toda a sua energia,
                        Mas a casa de tijolos, firme, resistia.
                        Frustrado e cansado, o lobo desistiu,
                        E para a floresta, sozinho partiu.
                        """,
                        image: URL(string: "https://www.qad.com/blog/wp-content/uploads/2021/02/02.25.2021.png")!
                    ),
                    .init(
                        text: """
                        Os três porquinhos, juntos, celebraram,
                        A força e a coragem que demonstraram.
                        Na casa de tijolos, seguros ficaram,
                        E a importância do trabalho duro valorizaram.
                        Felizes, entenderam a lição do labor,
                        Que esforço e prudência trazem mais valor.
                        """,
                        image: URL(string: "https://artifactsgallery.com/art/20925.jpg")!
                    )
                ],
                isFree: false,
                author: "David Wiesner"
            )
        ]
    }
    
}
