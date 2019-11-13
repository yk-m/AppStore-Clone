//
//  Search.swift
//  AppStoreClone
//
//  Created by sci01725 on 2019/10/17.
//  Copyright © 2019 Yuka Matsuo. All rights reserved.
//

import SwiftUI

struct Search: UIViewControllerRepresentable {

    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: UIViewControllerRepresentableContext<Search>) -> Search.UIViewControllerType {
        return UINavigationController(rootViewController: SearchRouter.assembleModules())
    }

    func updateUIViewController(_ uiViewController: Search.UIViewControllerType, context: UIViewControllerRepresentableContext<Search>) {
        uiViewController.navigationBar.prefersLargeTitles = true
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
