//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 27/05/25.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
