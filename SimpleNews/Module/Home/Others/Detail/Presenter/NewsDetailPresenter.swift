//
//  NewsDetailPresenter.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI
import Combine

class NewsDetailPresenter: ObservableObject {
  
  private let router = DetailRouter()
  
  private let useCase: NewsDetailUseCase
  
  @Published var news: NewsModel
  @Published var videos: [VideoModel] = []
  @Published var isLoading = false
  @Published var isError = false
  @Published var errorMessage = ""
  @Published var isEmpty = false
  
  private var cancellables: Set<AnyCancellable> = []
  
  init(useCase: NewsDetailUseCase, news: NewsModel) {
    self.useCase = useCase
    self.news = news
  }
  
  func getVideos() {
    self.isLoading = true
    self.useCase.getYoutubeVideos(pageToken: "", topic: cutString(news.title))
      .receive(on: RunLoop.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
          print(error.localizedDescription)
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { videos in
        if videos.count != 0 {
          DispatchQueue.main.async {
            withAnimation {
              self.videos = videos
            }
          }
        } else {
          self.isEmpty = true
        }
      }.store(in: &cancellables)
  }
  
  func cutString(_ string: String) -> String {
    let start = string.startIndex
    let index = string.index(start, offsetBy: 30)
    let word = (String(string[..<index])).replacingOccurrences(of: " ", with: "%20")
    print("word: \(word)")
    return word
  }
  
  func makeYoutube<Content: View>
  (video: VideoModel,
   @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination:
                    router.makeYoutubeView(video)
    ) { content() }
  }
  
  func linkToDetail<Content: View>
  (@ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination:
                    router.makeWebView(news.source, news.url)
    ) { content() }
  }
  
}
