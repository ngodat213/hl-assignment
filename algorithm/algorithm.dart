import 'dart:math';

void miniMaxSum(List<int> arr) {
  arr.sort();
  int minSum = arr.reduce((a, b) => a + b) - arr.reduce(max);
  int maxSum = arr.reduce((a, b) => a + b) - arr.reduce(min);
  print('$minSum $maxSum');
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5]; // Replace with your input list
  miniMaxSum(arr);
}
