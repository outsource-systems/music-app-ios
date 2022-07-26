//
//  ApiRequestModule.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/08.
//
import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON

func apiFetch<T: Decodable>(_ url: String, completion: @escaping ([T]) -> Void) {
    AF.request(url)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            switch response.result {
                case .success(let data):
                    let jsonObject = try? JSONDecoder.init().decode([T].self, from: data)
                    completion(jsonObject ?? [T]())
                case .failure(let error):
                     print("error:\(error)")
            }
        }
}
