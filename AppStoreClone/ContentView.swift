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
                    Image(systemName: "calendar")
                    Text("Today")
                }
                .tag(0)
            Text("Games")
                .font(.title)
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Games")
                }
                .tag(1)
            Text("Apps")
                .font(.title)
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Apps")
                }
                .tag(2)
            Text("Arcade")
                .font(.title)
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Arcade")
                }
                .tag(3)
            Search()
                .font(.title)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
