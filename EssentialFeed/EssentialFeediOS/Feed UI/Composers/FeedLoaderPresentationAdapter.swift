//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Bukhari Muslim on 23/05/25.
//

import EssentialFeed

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedloader: FeedLoader
    var presenter: FeedPresenter?
    
    init(feedloader: FeedLoader) {
        self.feedloader = feedloader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        feedloader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)
                
            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }
    }
}
