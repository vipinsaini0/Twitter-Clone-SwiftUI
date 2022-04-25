//
//  TweetRowViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Vipin Saini on 25/04/22.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIsUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
}
