//
//  SafeArray+Extension.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 24/05/24.
//

import Foundation

extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else {
            return nil
        }

        return self[index]
    }
    
}
