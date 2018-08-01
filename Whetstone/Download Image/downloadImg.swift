////
////  downloadImg.swift
////  Whetstone
////
////  Created by Peter Fong on 7/25/18.
////  Copyright © 2018 Peter Fong. All rights reserved.
////
//
//import Foundation
///* Create an image-fetcher that handles fetches of images when given URLs.
// You are given two objects to use in your implementation:
// 1. a cache to store the images in memory
// 2. a url-request-client to request images
// Assume these two objects are already implemented.
// 
// Your image-fetcher must handle repeated fetches for the same URL
// such that the url-request-client is not called more than necessary.
//
// Note: Everything should be on the main thread. */
//
//// =========== url-request-client (given) =================================
//protocol DBImageURLRequestClientDelegate: class {
//    func didDownloadImage(_ image: UIImage, forURL url: URL)
//}
//
//class DBImageURLRequestClient {
//    weak var delegate: DBImageURLRequestClientDelegate?
//    init() {}
//    func downloadImage(atURL url: URL) {}
//}
//
//// =========== cache (given) =================================
//class DBImageCache<Key: Hashable> {
//    init() {}
//    func setImage(_ image: UIImage, forKey key: Key) {}
//    func image(forKey key: Key) -> UIImage? {}
//}
//
//// =========== image fetcher (please implement) =================================
//public class DBImageFetcher: DBImageURLRequestClientDelegate {
//    public typealias DBImageFetcherBlock = (UIImage) -> ()
//
//    public static let sharedInstance = DBImageFetcher()
//
//    private let client = DBImageURLRequestClient()
//    private let cache = DBImageCache<URL>()
//
//    var returnBlockDict : [Key: [DBImageFetcherBlock]]
//    var returnBlock: DBImageFetcherBlock
//
//    private init() {
//        client.delegate = self
//    }
//
//    public func fetchImageForURL(url: URL, onSuccess: DBImageFetcherBlock) {
//        if let cacheImage = cache.image(key: url) {
//            onSucess(cacheImage)
//        } else {
//            client.downloadImage(url:url)
//            returnBlock = onSuccess
//        }
//    }
//
//    public func didDownloadImage(_ image: UIImage, forURL url: URL) {
//        cahce.setImage(image: image forkey: url)
//        returnBlock(image)
//    }
//}
