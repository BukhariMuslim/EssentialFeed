//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 14/05/25.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
