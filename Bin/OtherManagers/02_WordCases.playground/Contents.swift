import UIKit

//Склоняем слова в зависимости от числа

//MARK: - ENUMS

private enum StepsCase: String {
    case one = "шаг"
    case several = "шага"
    case multi = "шагов"
}

//MARK: - FUNCTION

/// Возвращает слово "шагов" в правильном склонении
/// - Parameter stepsCount: Число шагов типа Int
/// - Returns: "шаг"/"шага"/"шагов"
func getStepsCase(stepsCount: Int) -> String {
    guard let lastNum = String(stepsCount).compactMap({ $0.wholeNumberValue }).last else { return StepsCase.one.rawValue}
    switch lastNum {
    case 1:
        return StepsCase.one.rawValue
    
    case 2,3,4:
        return StepsCase.several.rawValue
        
    case 5,6,7,8,9,0:
        return StepsCase.multi.rawValue
        
    default:
        return StepsCase.one.rawValue
    }
}

print(getStepsCase(stepsCount: 251))
print(getStepsCase(stepsCount: 252))
print(getStepsCase(stepsCount: 250))
