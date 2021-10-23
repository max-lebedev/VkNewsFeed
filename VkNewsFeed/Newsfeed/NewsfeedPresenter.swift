//
//  NewsfeedPresenter.swift
//  VkNewsFeed
//
//  Created by Максим Лебедев on 23.10.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
    
    switch response {
    
    case .some:
        print(".some presenter")
    case .presentNewsFeed:
        print(".presentNewsFeed presenter")
        viewController?.displayData(viewModel: .displayNewsfeed)
    }
  }
  
}
