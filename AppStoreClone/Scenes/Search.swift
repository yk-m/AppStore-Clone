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
            SearchViewControllerWrapper()
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
