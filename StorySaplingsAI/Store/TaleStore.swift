//
//  TaleStore.swift
//  StorySaplingsAI
//
//  Created by ProDoctor on 22/05/24.
//

import Foundation

@Observable
class TaleStore {
    
    // MARK: - Public Variables
    
    private(set) var isLoading = false
    private(set) var tales = Tale.tales
    
}
