//
//  TopNewsPresenter.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI
import Combine

class TopNewsPresenter: ObservableObject {
  
  private let useCase: TopNewsUseCase
  let topic: String
  private let router = TopNewsRouter()
  
  @Published var news: [NewsModel] = []
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  
  init(useCase: TopNewsUseCase, topic: String) {
    self.useCase = useCase
    self.topic = topic
  }
  
  private var cancellables: Set<AnyCancellable> = []
  
  func getNews() {
    self.isLoading = true
    self.useCase.getTopNews(topic)
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
        DispatchQueue.main.async {
          withAnimation {
            self.news = news
          }
        }
      }.store(in: &cancellables)
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
