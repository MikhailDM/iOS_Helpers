//
//  MainModels.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Main {
    //MARK: - Actions
    
    enum Model {
        struct Request {
            enum RequestType {
                case getExamplesCells
            }
        }
        struct Response {
            enum ResponseType {
                case presentExamplesCells(sections: [MainViewModel.Section])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayExamplesCells(viewModel: MainViewModel)
            }
        }
    }
    
    
}//


//MARK: - ViewModel

struct MainViewModel {
    var sections: [Section]
    
    struct Section {
        let title: String
        var cells: [Cell]
        
        struct Cell {
            let title: String
            let description: String
            let routeType: CellRouteType
            
            enum CellRouteType {
                case addCell
                case customCell
                case fulscreenCell
                case calculatingCell
                case addingNumbers
                case weatherApp
            }
        }
    }
}

extension MainViewModel {
    static func getAllCells() -> [Section] {
        return [
            Section(title: "UITableView",
                    cells: [
                        Section.Cell(title: "UITableView. Add cells/Show alert",
                                     description: "Add test cells to list and show alert on tap",
                                     routeType: .addCell),
                        Section.Cell(title: "UITableView. Custom cells",
                                     description: "Create list from custom cells\nExpand last cell to free empty space",
                                     routeType: .customCell),
                        Section.Cell(title: "UITableView. Fullscreen cell",
                                     description: "Expand cell to fullscreen",
                                     routeType: .fulscreenCell),
                        Section.Cell(title: "UITableView. Calculating cell",
                                     description: "Calculate cell height if another cell height had changed",
                                     routeType: .calculatingCell),
                    ]),
            Section(title: "RxAlamofire",
                    cells: [
                        Section.Cell(title: "Weather App",
                                     description: "Fetch data with RxAlamofire",
                                     routeType: .weatherApp),
                    ]),
            Section(title: "Simple",
                    cells: [
                        Section.Cell(title: "Adding numbers",
                                     description: "Three fields to add",
                                     routeType: .addingNumbers),
                    ]),
        ]
    }
}

