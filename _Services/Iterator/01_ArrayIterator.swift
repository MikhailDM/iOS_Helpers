//
//  VolIDsIterator.swift
//  ekpv2
//
//  Created by Dmitriev on 01.09.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import Foundation

protocol VolIDsIteratorData {
    var eventsIDs: [Int] { get }
    var numberToLoad: Int { get }
    
    init(eventsIDs: [Int], numberToLoad: Int)
    
    mutating func getIDsOnLoad() -> ([Int])
    mutating func getNextIDs() -> [Int]?
    func isAllIDsDownloaded() -> Bool
}

struct VolIDsIterator: VolIDsIteratorData {
    //MARK: - Properties
    
    ///Full array of IDs
    var eventsIDs: [Int]
    ///Count of IDs in downloaded array
    var numberToLoad: Int
    
    ///Already downloaded IDs
    private var loadedIDs: [Int]?
    ///Flag. Is all IDs Already downloaded
    private var isAllListDownloaded = false
    
    
    //MARK: - Init
    
    /// Инициализатор итератора
    /// - Parameters:
    ///   - list: All IDs
    ///   - dataCount: Count of IDs in downloaded array
    init(eventsIDs: [Int], numberToLoad: Int) {
        self.eventsIDs = eventsIDs
        self.numberToLoad = numberToLoad
    }
    
    mutating func getIDsOnLoad() -> [Int] {
        loadedIDs = nil
        isAllListDownloaded = false
        print("ALL IDs - \(eventsIDs)")
        
        //Check if descriptions less than numberToLoad
        if eventsIDs.count <= numberToLoad {
            isAllListDownloaded = true
        }
        print("IS ALL EVENTS DOWNLOAD? - \(isAllListDownloaded)")
        
        //Range of IDs to Load
        let eventsIDsToLoad = Array(eventsIDs.prefix(self.numberToLoad))
        self.loadedIDs = eventsIDsToLoad
        print("IDS TO DOWNLOAD - \(eventsIDsToLoad)")
        return eventsIDsToLoad
    }
    
    mutating func getNextIDs() -> [Int]? {
        guard
            isAllListDownloaded == false,
            let loadedIDsSafe = loadedIDs else { return nil }
        
        //Remain IDs
        let remainIDs = eventsIDs.filter { !loadedIDsSafe.contains($0) }
        let eventsIDsToLoad = Array(remainIDs.prefix(self.numberToLoad))
        self.loadedIDs?.append(contentsOf: eventsIDsToLoad)
        print("IDS TO DOWNLOAD - \(eventsIDsToLoad)")
        
        //Check if remain IDs count less than numOfLoadedCells
        if remainIDs.count <= self.numberToLoad {
            self.isAllListDownloaded = true
        }
        return eventsIDsToLoad
    }
    
    func isAllIDsDownloaded() -> Bool {
        return isAllListDownloaded
    }
}
