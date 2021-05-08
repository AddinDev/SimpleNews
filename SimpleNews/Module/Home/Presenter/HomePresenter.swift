//
//  HomePresenter.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private let useCase: HomeUseCase
  private let router = HomeRouter()
  
  @Published var news: [NewsModel] = []
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  init(useCase: HomeUseCase) {
    self.useCase = useCase
  }
  
  private var cancellables: Set<AnyCancellable> = []
  
  func getNews() {
    self.isLoading = true
    self.useCase.getNews()
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { news in
        self.news = news
      }.store(in: &cancellables)
  }
  
  func linkToTopic<Content: View>
  (for topic: String,
   @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination:
                    router.makeTopNewsView(topic)
    ) { content() }
  }
  
  func linkToDetail<Content: View>
  (for news: NewsModel,
   @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination:
                    router.makeDetailView(news)
    ) { content() }
    
  }
  
}
