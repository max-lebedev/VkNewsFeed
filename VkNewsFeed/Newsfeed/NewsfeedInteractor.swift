//
//  NewsfeedInteractor.swift
//  VkNewsFeed
//
//  Created by Максим Лебедев on 23.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
    
        case .getNewsFeed:
            service?.getFeed(completion: { [ weak self ] (revealPostIds, feed) in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealPostIds: revealPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [ weak self ] (user) in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: user))
            })
        case .revealPostIds(postId: let postId):
            service?.revealPostIds(forPostId: postId, completion: { [ weak self ] revealPostId, feed in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealPostIds: revealPostId))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: .presentFooterLoader)
            service?.getNextBatch(completion: { revealPostIds, feed in
                self.presenter?.presentData(response: .presentNewsfeed(feed: feed, revealPostIds: revealPostIds))
            })
        }
    }
}
