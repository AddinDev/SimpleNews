//
//  NewsDetailPresenter.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI

class NewsDetailPresenter: ObservableObject {
  
  private let router = DetailRouter()
    
  @Published var news: NewsModel
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  init(news: NewsModel) {
    self.news = news
  }
  
  func linkToDetail<Content: View>
  (@ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination:
                    router.makeWebView(news.source, news.url)
    ) { content() }
  }
  
}
