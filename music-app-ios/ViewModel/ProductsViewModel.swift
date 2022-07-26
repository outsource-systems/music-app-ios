/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation
import Combine

final class ProductsViewModel: ObservableObject {
    @Published var items: [Product] = [Audio]()
    @Published var headerTitle: String = "Top Songs"
    var page: Int = 1
    var per: Int = 10
    let rightLinkText: String = "See All"

    init() {
        getItems()
    }
    
    func getItems() {
        apiFetch("\(ApiUrl)/api/v1/items?page=\(self.page)&per=\(self.per)") { res in
            self.items += res
        }
    }
    
    func getMoreItems(_ count: Int = 25) {
        self.page += 1
        self.per = 25
        getItems()
    }
}
