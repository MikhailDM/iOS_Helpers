//
//  MedLastTVCellCalculator.swift
//  ekpv2
//
//  Created by Dmitriev on 08.09.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit


struct MedLastTVCellCalculator {
    
    //MARK: - Properties
    
    private var cellsHeights: [CGFloat]?
    private var lastCellInitialHeight: CGFloat?
    private var tableViewHeight: CGFloat?
    
    
    //MARK: - Functions
    
    /// Return last UITableView cell height if avaliable epmty space
    /// - Parameters:
    ///   - tableViewHeight: TV  Height
    ///   - cellsHeights: Array of presentinc cells height
    ///   - lastCellInitialHeight: Las cell initial height
    /// - Returns: Last cell height as CGFloat
    mutating func calculateLastCellHeight(tableViewHeight: CGFloat, cellsHeights: [CGFloat], lastCellInitialHeight: CGFloat) -> CGFloat? {
        //Charge Values
        self.cellsHeights = cellsHeights
        if self.lastCellInitialHeight == nil {
            self.lastCellInitialHeight = lastCellInitialHeight
        }
        if self.tableViewHeight == nil {
            self.tableViewHeight = tableViewHeight
        }
        
        //Unwrap Values
        guard
            let tableViewHeightSafe = self.tableViewHeight,
            let cellsHeightsSafe = self.cellsHeights,
            let lastCellInitialHeightSafe = self.lastCellInitialHeight else { return nil }
        
        //If only one cell
        switch cellsHeightsSafe.count {
        case 1:
            return lastCellInitialHeightSafe < tableViewHeightSafe ? tableViewHeightSafe : nil

        //If multiples cells
        default:
            let maxCellsHeight = Array(cellsHeightsSafe.dropLast()).reduce(0){ $0 + $1 } + lastCellInitialHeightSafe
            let emptyHeight = tableViewHeightSafe - maxCellsHeight

            guard maxCellsHeight < tableViewHeightSafe else { return nil }
            return emptyHeight > 0 ? (emptyHeight + lastCellInitialHeightSafe) : nil
        }
    }
    
    
}//
