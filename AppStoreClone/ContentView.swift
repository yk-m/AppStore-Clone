//
//  ContentView.swift
//  AppStoreClone
//
//  Created by sci01725 on 2019/10/10.
//  Copyright © 2019 Yuka Matsuo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Today")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("today")
                        Text("Today")
                    }
                }
                .tag(0)
            Text("Games")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("games")
                        Text("Games")
                    }
                }
                .tag(0)
            Text("Apps")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("apps")
                        Text("Apps")
                    }
                }
                .tag(0)
            Text("Arcade")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("arcade")
                        Text("Arcade")
                    }
                }
                .tag(0)
            Text("Search")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("search")
                        Text("Search")
                    }
                }
                .tag(0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
