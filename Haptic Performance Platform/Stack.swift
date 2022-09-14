import Foundation // used for a stack

struct Stack {
    private var items: [Int] = []
    
    func peek() -> Int {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    mutating func pop() -> Int {
        return items.removeFirst()
    }
  
    mutating func push(_ element: Int) {
        items.insert(element, at: 0)
    }
    
    mutating func len() -> Int {
        return items.count
    }
}
