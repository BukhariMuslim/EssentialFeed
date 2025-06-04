//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 27/05/25.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
