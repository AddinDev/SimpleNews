//
//  TopNewsView.swift
//  SimpleNews
//
//  Created by addin on 08/05/21.
//

import SwiftUI

struct TopNewsView: View {
  
  @ObservedObject var presenter: TopNewsPresenter
  
  var body: some View {
    content
      .navigationBarTitle(title)
      .onAppear {
        if presenter.news.count == 0 {
          presenter.getNews()
        }
      }
  }
  
}

extension TopNewsView {
  
  var content: some View {
    Group {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else {
        list
      }
    }
  }
  
  var list: some View {
    List(presenter.news) { news in
      NewsListItem(news: news)
    }
    .listStyle(PlainListStyle())
  }
  
  var title: String {
    presenter.topic
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
