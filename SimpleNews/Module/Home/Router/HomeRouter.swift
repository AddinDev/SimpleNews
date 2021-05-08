//
//  HomeRouter.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI

class HomeRouter {
  
  func makeTopNewsView(_ topic: String) -> some View {
    let useCase = Injection.init().provideTopNews()
    let presenter = TopNewsPresenter(useCase: useCase, topic: topic)
    return TopNewsView(presenter: presenter)
  }
  
  func makeDetailView(_ news: NewsModel) -> some View {
    let presenter = NewsDetailPresenter(news: news)
    return NewsDetailView(presenter: presenter)
  }
  
}
