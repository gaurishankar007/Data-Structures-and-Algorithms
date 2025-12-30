import Foundation

let myList = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
let target = 13

let index = binarySearch(myList, target: target)
if index != -1 {
    print("Element found at index \(index)")
} else {
    print("Element not found")
}

func binarySearch(_ arr: [Int], target: Int) -> Int {
    var low = 0
    var high = arr.count - 1

    while low <= high {
        let mid = (low + high) / 2 // Calculate the middle index

        if arr[mid] == target {
            return mid // Element found, return its index
        } else if arr[mid] < target {
            low = mid + 1 // If the target is greater, ignore the left half
        } else {
            high = mid - 1 // If the target is smaller, ignore the right half
        }
    }

    return -1 // Element not found
}