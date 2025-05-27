//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 27/05/25.
//

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
