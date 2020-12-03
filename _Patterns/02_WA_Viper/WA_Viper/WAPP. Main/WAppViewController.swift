//
//  WAppViewController.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class WAppViewController: UIViewController, WAppViewProtocol {
    //MARK: - Configure
    var presenter: WAppPresenterProtocol?
    var configurator = WAppConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var deegreeLabel: UILabel!
    @IBOutlet weak var changeCityButton: UIButton!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        presenter?.presenterRequest(requestType: .requestDefaultWeather)
    }
    
    deinit { print("DEINITED - WAppViewController") }
    
    
    //MARK: - Display
    func display(displayType: WApp.Action.Display.DisplayType) {
        switch displayType {
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
        UIView.animate(withDuration: 0.5) { [weak self] in
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
    
    private func configureDesign() {
        fadeLabels()
        navigationController?.navigationBar.isHidden = true
        changeCityButton.layer.borderWidth = 1
        changeCityButton.layer.borderColor = UIColor.white.cgColor
        changeCityButton.layer.cornerRadius = changeCityButton.frame.height / 6
    }
    
    
    //MARK: - Rx
    
}//
