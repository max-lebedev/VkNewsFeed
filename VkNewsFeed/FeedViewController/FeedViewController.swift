//
//  FeedViewController.swift
//  VkNewsFeed
//
//  Created by Максим Лебедев on 22.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        fetcher.getFeed { feedResponse in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
        
    }
}
