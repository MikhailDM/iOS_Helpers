import Foundation

protocol IteratorService {
    init(input: [Int], membersCountToPassing: Int)
    mutating func getNextMembers() -> [Int]
}

struct DataIterator: IteratorService {
    
    //MARK: - Properties
    private var input: [Int]
    private var membersCountToPassing: Int
    private var passedMembers = [Int]()
    
    //MARK: - Init
    init(input: [Int], membersCountToPassing: Int) {
        self.input = input
        self.membersCountToPassing = membersCountToPassing
    }
    
    mutating func getNextMembers() -> [Int] {
        let remainMembers = input.filter { !passedMembers.contains($0) }
        let membersToPassing = Array(remainMembers.prefix(membersCountToPassing))
        passedMembers.append(contentsOf: membersToPassing)
        
        guard !membersToPassing.isEmpty else { return [] }
        return membersToPassing
    }
}

let inputInt = [1,2,3,4,5,6,7]
let inputStr = ["A","B","C","D","E","F","G"]
var iterator: IteratorService = DataIterator(input: inputInt, membersCountToPassing: 2)
print(iterator.getNextMembers())
print(iterator.getNextMembers())
print(iterator.getNextMembers())
print(iterator.getNextMembers())
print(iterator.getNextMembers())
