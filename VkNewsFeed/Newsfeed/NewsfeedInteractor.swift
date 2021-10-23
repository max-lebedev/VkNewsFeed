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
    
    case .some:
        print(".some interactor")
    case .getFeed:
        print(".getFeed interactor")
        presenter?.presentData(response: .presentNewsFeed)
    }
  }
  
}
