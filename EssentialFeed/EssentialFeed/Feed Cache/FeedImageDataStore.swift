//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 28/05/25.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
