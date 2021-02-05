import Foundation

struct DataIterator<T: Equatable> {
    
    //MARK: - Properties
    private var input: [T]
    private var membersCountToPassing: Int
    private var passedMembers = [T]()
    
    //MARK: - Init
    init(input: [T], membersCountToPassing: Int) {
        self.input = input
        self.membersCountToPassing = membersCountToPassing
    }
    
    //MARK: - Logic
    mutating func getNextMembers() -> [T] {
        let remainMembers = input.filter { member in !passedMembers.contains(member) }
        let membersToPassing = Array(remainMembers.prefix(membersCountToPassing))
        passedMembers.append(contentsOf: membersToPassing)
        
        guard !membersToPassing.isEmpty else { return [] }
        return membersToPassing
    }
    
    mutating func clearPassedMembers() {
        passedMembers = []
    }
}

print("===== Iterator Int")
let inputInt = [1,2,3,4,5,6,7]
var iteratorInt = DataIterator(input: inputInt, membersCountToPassing: 2)
print(iteratorInt.getNextMembers())
print(iteratorInt.getNextMembers())
print(iteratorInt.getNextMembers())
print(iteratorInt.getNextMembers())
print(iteratorInt.getNextMembers())
iteratorInt.clearPassedMembers()
print(iteratorInt.getNextMembers())


print("===== Iterator String")
let inputStr = ["A","B","C","D","E","F","G"]
var iteratorStr = DataIterator(input: inputStr, membersCountToPassing: 2)
print(iteratorStr.getNextMembers())
print(iteratorStr.getNextMembers())
print(iteratorStr.getNextMembers())
print(iteratorStr.getNextMembers())
print(iteratorStr.getNextMembers())
iteratorStr.clearPassedMembers()
print(iteratorStr.getNextMembers())
print(iteratorStr.getNextMembers())


print("===== Iterator Models")
struct SomeNewModel: Equatable, CustomStringConvertible {
    var name: String
    static func == (lhs: SomeNewModel, rhs: SomeNewModel) -> Bool {
        return lhs.name == rhs.name
    }
    public var description: String {
        return name
    }
}

let inputModels = [SomeNewModel(name: "111"), SomeNewModel(name: "222"), SomeNewModel(name: "333"), SomeNewModel(name: "444")]
var iteratorModels = DataIterator(input: inputModels, membersCountToPassing: 2)
print(iteratorModels.getNextMembers())
print(iteratorModels.getNextMembers())
print(iteratorModels.getNextMembers())
