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
    Group {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else {
        view
      }
    }
  }
  
  var view: some View {
    ScrollView {
      VStack {
        //        HStack {
        //          Text("Articles")
        //            .padding(.bottom, -10)
        //          spacer
        //        }
        //        .padding(.horizontal)
        //        .padding(.vertical, 0)
        list
      }
    }
  }
  
  var list: some View {
    ForEach(presenter.news) { news in
      VStack(alignment: .leading) {
        if presenter.news.firstIndex(of: news) == 0 {
          Text("Articles")
            .padding(.leading, 20)
            .padding(.vertical, 0)
            .padding(.bottom, -10)
        }
        NewsListItem(news: news)
      }
    }
    .listStyle(PlainListStyle())
    .padding(.vertical, 0)
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
