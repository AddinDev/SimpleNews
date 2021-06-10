//
//  SearchNewsView.swift
//  SimpleNews
//
//  Created by addin on 11/05/21.
//

import SwiftUI

struct SearchNewsView: View {
  
  @ObservedObject var presenter: SearchNewsPresenter
  
  @State private var showCancelBtn = false
  
  var body: some View {
    content
      .navigationBarTitle("Search", displayMode: .inline)
  }
  
}

extension SearchNewsView {
  
  var content: some View {
      ScrollView {
        LazyVStack {
          searchBar
          list
        }
      }
    }
  
  var searchBar: some View {
    HStack {
    TextField("Search News", text: $presenter.keyword)
      .padding(8)
      .background(Color(.systemGray6))
      .cornerRadius(7)
      if showCancelBtn {
      Button(action: {
        withAnimation(.linear) {
        presenter.keyword = ""
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        showCancelBtn = false
        }
      }) {
        Text("Cancel")
      }
      }
    }
    .padding()
    .onTapGesture {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1)) {
      showCancelBtn = true
      }
    }
  }
  
  var list: some View {
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
            presenter.linkToDetail(for: news) {
              NewsListItem(news: news)
            }
          }
        }
      }
    }
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
