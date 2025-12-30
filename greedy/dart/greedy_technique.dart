void main() {
  // In this example, the makeChange function takes a list of available coin denominations (coins) and an amount for which change needs to be made.
  // It sorts the coins in descending order and iterates through them.
  // At each step, it greedily selects the largest coin denomination that is less than or equal to the remaining amount and adds it to the result.
  // This process continues until the entire amount is accounted for.
  // Finally, it returns the list of coins used to make the change.

  List<int> coins = [25, 10, 5, 1]; // Available coin denominations
  int amount = 63; // Amount to make change for

  List<int> change = makeChange(coins, amount);
  print("Change for $amount cents: $change");
}

List<int> makeChange(List<int> coins, int amount) {
  List<int> result = [];
  coins.sort((a, b) => b - a); // Sort coins in descending order

  for (int coin in coins) {
    while (amount >= coin) {
      result.add(coin);
      amount -= coin;
    }
  }

  return result;
}
