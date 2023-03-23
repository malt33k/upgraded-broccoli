func getCard(at index: Int, from stack: [Int]) -> Int {
  return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  if stack.indices.contains(index) {
    var newStack = stack
    newStack[index] = newCard
    return newStack
  }
  return stack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  var newStack = stack
  newStack.append(newCard)
  return newStack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  if stack.indices.contains(index) {
    var newStack = stack
    newStack.remove(at: index)
    return newStack
  }
  return stack
}

func removeTopCard(_ stack: [Int]) -> [Int] {
  return stack.dropLast()
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
  var newStack = stack
  newStack.insert(newCard, at: 0)
  return newStack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
  return [Int](stack.dropFirst())
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  stack.count == size ? true : false
}

func evenCardCount(_ stack: [Int]) -> Int {
  return stack.reduce(0) { if $1.isMultiple(of: 2) { return $0 + 1 } else { return $0 } }
}
