//
//  HomeView.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    content
      .onAppear {
        if presenter.news.count == 0 {
          presenter.getNews()
        }
      }
  }
  
}

extension HomeView {
  
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
