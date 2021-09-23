//
//  ImageLoader.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let url: URL
    private var cache: ImageCache?
    private var cancellables = Set<AnyCancellable>()
    
    private(set) var isLoading = false
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
        
        self.image = cache?[url as AnyObject]
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
    
    private func fetchImage(url: URL) -> Future<UIImage, Never> {
        return Future<UIImage, Never> { promise in
            URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .handleEvents(
                    receiveSubscription: { [weak self] _ in
                        self?.onStart()
                    },
                    receiveCompletion: { [weak self] _ in
                        self?.onFinish()
                    }
                )
                .sink(receiveValue: {
                    promise(.success($0!))
                })
                .store(in: &self.cancellables)
        }
    }
    
    private func addCache(_ image: UIImage?) {
        image.map { cache?[url as AnyObject] = $0 }
    }
    
    func load() {
        guard !isLoading else { return }
        
        if cache?[url as AnyObject] != nil { return }
        
        fetchImage(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                self.image = $0
                self.addCache($0)
            })
            .store(in: &cancellables)
    }
}
