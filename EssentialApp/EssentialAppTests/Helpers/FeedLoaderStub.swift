//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Bukhari Muslim on 28/05/25.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
   private let result: FeedLoader.Result
   
   init(result: FeedLoader.Result) {
       self.result = result
   }
   
   func load(completion: @escaping (FeedLoader.Result) -> Void) {
       completion(result)
   }
}
