//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 14/05/25.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
