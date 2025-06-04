//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 27/05/25.
//

import Foundation


public final class FeedImagePresenter {
    
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
