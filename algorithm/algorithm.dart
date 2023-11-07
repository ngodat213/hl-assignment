import 'dart:math';

void miniMaxSum(List<int> arr) {
  arr.sort();
  int minSum = arr.reduce((a, b) => a + b) - arr.reduce(max);
  int maxSum = arr.reduce((a, b) => a + b) - arr.reduce(min);
  print('$minSum $maxSum');
}

void countTotal(List<int> arr) {
  int total = arr.length;
  print('Count: $total');
}

void findMin(List<int> arr) {
  int min = arr.reduce((a, b) => a < b ? a : b);
  print('Min value: $min');
}

void findMax(List<int> arr) {
  int max = arr.reduce((a, b) => a > b ? a : b);
  print('Max value: $max');
}

void findEven(List<int> arr) {
  List<int> evenElements = arr.where((element) => element % 2 == 0).toList();
  print('Even value in the array: $evenElements');
}

void findOdd(List<int> arr) {
  List<int> oddElements = arr.where((element) => element % 2 != 0).toList();
  print('Odd value in the array: $oddElements');
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5]; // Replace with your input list

  miniMaxSum(arr);

  // Bonus
  countTotal(arr);
  findMin(arr);
  findMax(arr);
  findEven(arr);
  findOdd(arr);
}
