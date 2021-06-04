//
//  HomeView.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  @State var keyword = ""
  var rows: [GridItem] = [
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 2 - 20)),
    .init(.flexible(minimum: 50, maximum: UIScreen.main.bounds.width / 2 - 20))
  ]
  
  private let topics: [String] = ["Bitcoin", "Mudik", "Corona"]
  
  var body: some View {
    content
      .navigationBarTitle("News")
      .onAppear {
        if presenter.news.count == 0 {
          presenter.getNews()
        }
      }
  }
  
}

extension HomeView {
  
  var content: some View {
    ScrollView {
      LazyVStack {
        topic
        articles
      }
    }
  }
  
  //  var searchBar: some View {
  //    Button(action: {
  //      withAnimation {
  //        isSearching = true
  //      }
  //    }) {
  //      HStack {
  //        TextField("Search News", text: $keyword)
  //          .padding(7)
  //          .background(Color(.systemGray6))
  //          .cornerRadius(7)
  //          .padding(.horizontal)
  //          .padding(.vertical, 10)
  //        if isSearching {
  //          spacer
  //          Button(action: {
  //            withAnimation {
  //              keyword = ""
  //              isSearching = false
  //              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  //            }
  //          }) {
  //            Image(systemName: "xmark")
  //              .padding(.trailing)
  //          }
  //        }
  //      }
  //    }
  //  }
  
  var topic: some View {
    Group {
      topicSection
      LazyVGrid(columns: rows, spacing: 10) {
        ForEach(topics, id: \.self) { topic in
          presenter.linkToTopic(for: topic) {
            TopicBlockItem(topic: topic,
                           imageUrl: "https://img.pngio.com/doge-bread-doge-head-png-1024_1024.png")
          }
        }
        presenter.linkToSearch {
          TopicBlockItem(topic: "Search",
                         imageUrl: "https://vignette.wikia.nocookie.net/dogelore/images/2/26/Walter.png")
        }
      }
    }
    //    HStack {
    //      TopicBlockItem(topic: "Orang Sakit", imageUrl: "https://img.pngio.com/doge-bread-doge-head-png-1024_1024.png")
    //      TopicBlockItem(topic: "Kopit Karena Cina", imageUrl: "https://img.pngio.com/-doge-head-png-400_400.png")
    //    }
    //    .padding(.bottom)
  }
  
  var articles: some View {
    Group {
      if presenter.isLoading {
        spacer
        loadingIndicator
        spacer
      } else if presenter.isError {
        spacer
        errorIndicator
        spacer
      } else {
        ForEach(presenter.news) { news in
          VStack(alignment: .leading) {
            if presenter.news.firstIndex(of: news) == 0 {
              articleSection
            }
            presenter.linkToDetail(for: news) {
              NewsListItem(news: news)
            }
          }
        }
      }
    }
  }
  
  var topicSection: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("Popular Topics")
          .fontWeight(.medium)
        Text("These are the popular topics for now.")
      }
      spacer
    }
    .padding(.vertical, 0)
    .padding(.horizontal, 20)
  }
  
  var articleSection: some View {
    Text("Articles")
      .font(.callout)
      .bold()
      .padding(.leading, 20)
      .padding(.vertical, 0)
      .padding(.top, 7)
      .padding(.bottom, -10)
    
  }
  
  var spacer: some View {
    Spacer()
  }
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
  
  var errorIndicator: some View {
    VStack {
      Text("Error")
        .bold()
        .foregroundColor(.red)
      Text(presenter.errorMessage)
    }
  }
  
}
