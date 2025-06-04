//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 04/06/25.
//

import Foundation

public final class ImageCommentsPresenter {
    public static var title: String {
        NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
                          tableName: "ImageComments",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the image comments view")
    }
    
    public static func map(_ feed: [FeedImage]) -> FeedViewModel {
        FeedViewModel(feed: feed)
    }
}
