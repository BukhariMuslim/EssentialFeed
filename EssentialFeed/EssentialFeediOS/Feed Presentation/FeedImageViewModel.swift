//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Bukhari Muslim on 22/05/25.
//

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
