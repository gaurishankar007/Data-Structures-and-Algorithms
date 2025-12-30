import Foundation

// In this example, the makeChange function takes a list of available coin denominations (coins) and an amount for which change needs to be made.
// It sorts the coins in descending order and iterates through them.
// At each step, it greedily selects the largest coin denomination that is less than or equal to the remaining amount and adds it to the result.
// This process continues until the entire amount is accounted for.
// Finally, it returns the list of coins used to make the change.

func makeChange(coins: [Int], amount: Int) -> [Int] {
    var result: [Int] = []
    let sortedCoins = coins.sorted(by: >) // Sort coins in descending order
    var remainingAmount = amount
    
    for coin in sortedCoins {
        while remainingAmount >= coin {
            result.append(coin)
            remainingAmount -= coin
        }
    }
    
    return result
}

let coins = [25, 10, 5, 1] // Available coin denominations
let amount = 63 // Amount to make change for

let change = makeChange(coins: coins, amount: amount)
print("Change for \(amount) cents: \(change)")
