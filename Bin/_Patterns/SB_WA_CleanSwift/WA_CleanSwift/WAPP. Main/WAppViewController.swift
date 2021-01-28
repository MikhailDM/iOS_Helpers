//
//  WAppViewController.swift
//  WA_CleanSwift
//
//  Created by Dmitriev on 25.09.2020
//

import UIKit
import RxSwift

class WAppViewController: UIViewController, WAppViewProtocol, WAppViewLogicProtocol {
    
    //MARK: - Configure
    var interactor: (WAppInteractorLogicProtocol & WAppDataStoreProtocol)?
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
    private let disposeBag = DisposeBag()
    private let searchDelay = 1
    private let animationDelay = 0.5
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDesign()
        subscribeToChangeCityButtonPressed()
        interactor?.interactorRequest(requestType: .requestDefaultWeather)
    }
    
    deinit { print("===== DEINITED: WAppViewController") }
    
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
                self?.interactor?.interactorRequest(requestType: .searchButtonPressed)
            }.disposed(by: disposeBag)
    }
    
}//

