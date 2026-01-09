import 'stack.dart';

void main() {
  /// Check if a string containing various types of brackets
  /// (parentheses, square brackets, and curly braces) is balanced.
  String balancedString = "{[()]()}";
  String unbalancedString = "{[(])}";

  print("Is '$balancedString' balanced? ${isBalanced(balancedString)}"); // Output: true
  print("Is '$unbalancedString' balanced? ${isBalanced(unbalancedString)}"); // Output: false
}

bool isBalanced(String input) {
  // Create a stack to store opening brackets
  Stack<String> stack = Stack<String>();

  // Map to store the matching pairs of brackets
  Map<String, String> bracketPairs = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  // Loop through each character in the input string
  for (int i = 0; i < input.length; i++) {
    String currentChar = input[i];

    // If the current character is an opening bracket, push it onto the stack
    if (bracketPairs.containsValue(currentChar)) {
      stack.push(currentChar);
    }
    // If the current character is a closing bracket
    else if (bracketPairs.containsKey(currentChar)) {
      // If the stack is empty or the top of the stack does not match the current closing bracket,
      // then the string is not balanced
      if (stack.isEmpty || stack.peek() != bracketPairs[currentChar]) {
        return false;
      }
      // If the top of the stack matches the current closing bracket, pop it from the stack
      stack.pop();
    }
  }

  // If the stack is empty after processing all characters, the string is balanced
  return stack.isEmpty;
}
