//
//  WAppViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 25.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


//MARK: - Protocol. DisplayLogic
protocol WAppDisplayLogic: class {
    func displayData(viewModel: WApp.Model.ViewModel.ViewModelData)
}


class WAppViewController: UIViewController, WAppDisplayLogic {
    //MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var deegreeLabel: UILabel!
    
    @IBOutlet weak var changeCityButton: UIButton!
    
    
    //MARK: - Properties
    var interactor: WAppBusinessLogic?
    var router: (NSObjectProtocol & WAppRoutingLogic & WAppDataPassing)?
    lazy var configurator: WAppConfiguratorProtocol = WAppConfigurator()
    private let disposeBag = DisposeBag()
    
    private let searchDelay = 1
    private let animationDelay = 0.5
    
    
    //MARK: - Init
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        subscribeToChangeCityButtonPressed()
        interactor?.makeRequest(request: .requestDefaultWeather)
    }
    
    deinit {
        print("DEINITED - WAppViewController")
    }
    
    
    //MARK: - Display data
    func displayData(viewModel: WApp.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayWeather(viewModel: let viewModel):
            cityLabel.text = viewModel.cityNameText
            temperatureLabel.text = viewModel.temperatureText
            weatherIcon.image = viewModel.conditionImage
            animateUpdatedWeather()
        }
    }
    
    
    //MARK: - Private
    private func animateUpdatedWeather() {
        fadeLabels()
        UIView.animate(withDuration: animationDelay) { [weak self] in
            guard let self = self else { return }
            self.cityLabel.alpha = 1
            self.temperatureLabel.alpha = 1
            self.weatherIcon.alpha = 1
            self.celsiusLabel.alpha = 1
            self.deegreeLabel.alpha = 1
        }
    }
    
    private func fadeLabels() {
        cityLabel.alpha = 0
        temperatureLabel.alpha = 0
        weatherIcon.alpha = 0
        celsiusLabel.alpha = 0
        deegreeLabel.alpha = 0
    }
    
    private func setupDesign() {
        fadeLabels()
        navigationController?.navigationBar.isHidden = true
        changeCityButton.layer.borderWidth = 1
        changeCityButton.layer.borderColor = UIColor.white.cgColor
        changeCityButton.layer.cornerRadius = changeCityButton.frame.height / 6
    }
    
    
    //MARK: - Rx
    private func subscribeToChangeCityButtonPressed() {
        changeCityButton.rx.tap
            .subscribe { [weak self] _ in
                self?.subscribeToSelectedCityOnSearch()
            }.disposed(by: disposeBag)
    }
    
    private func subscribeToSelectedCityOnSearch() {
        router?.routeToSearch()
            .debug("===== SELECT CITY")
            .subscribe(onNext: { [weak self] city in
                self?.interactor?.makeRequest(request: .requestWeatherByCity(cityName: city))
            }).disposed(by: disposeBag)
    }
    
}//

