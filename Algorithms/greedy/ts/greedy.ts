// In this example, the makeChange function takes a list of available coin denominations (coins) and an amount for which change needs to be made.
// It sorts the coins in descending order and iterates through them.
// At each step, it greedily selects the largest coin denomination that is less than or equal to the remaining amount and adds it to the result.
// This process continues until the entire amount is accounted for.
// Finally, it returns the list of coins used to make the change.

function makeChange(coins: number[], amount: number): number[] {
  const result: number[] = [];
  coins.sort((a, b) => b - a); // Sort coins in descending order

  for (const coin of coins) {
    while (amount >= coin) {
      result.push(coin);
      amount -= coin;
    }
  }

  return result;
}

const coins: number[] = [25, 10, 5, 1]; // Available coin denominations
const amount: number = 63; // Amount to make change for

const change: number[] = makeChange(coins, amount);
console.log(`Change for ${amount} cents: [${change.join(", ")}]`);
