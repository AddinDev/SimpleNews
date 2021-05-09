//
//  TopNewsRouter.swift
//  SimpleNews
//
//  Created by addin on 09/05/21.
//

import SwiftUI

class TopNewsRouter {
  
  func makeDetailView(_ news: NewsModel) -> some View {
    let useCase = Injection.init().provideNewsDetail()
    let presenter = NewsDetailPresenter(useCase: useCase, news: news)
    return NewsDetailView(presenter: presenter)
  }
  
}
