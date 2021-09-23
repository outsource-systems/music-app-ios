/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation
import Combine

final class AudiosViewModel: ObservableObject {
    @Published var audios: [Audio] = [Audio]()
    
    init() {
        self.audios = load("audiosData.json")
    }
}
