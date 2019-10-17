//
//  Search.swift
//  AppStoreClone
//
//  Created by sci01725 on 2019/10/17.
//  Copyright © 2019 Yuka Matsuo. All rights reserved.
//

import SwiftUI

struct Search: View {
    var body: some View {
        NavigationView() {
            VStack {
                Text("見つける")
                Text("あなたにおすすめ")
            }
            .navigationBarTitle("Search", displayMode: .large)
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
