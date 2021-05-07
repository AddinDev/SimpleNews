//
//  ContentView.swift
//  SimpleNews
//
//  Created by addin on 07/05/21.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  
    var body: some View {
      NavigationView {
        HomeView(presenter: homePresenter)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
