//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Bukhari Muslim on 22/05/25.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
