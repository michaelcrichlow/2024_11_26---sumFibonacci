package test

import "core:fmt"
import "core:sys/windows"
import "core:time"
print :: fmt.println

main :: proc() {

	windows.SetConsoleOutputCP(windows.CODEPAGE.UTF8)
	start: time.Time = time.now()

	// code goes here
	print(sumFibonacci([]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}))

	elapsed: time.Duration = time.since(start)
	print("Odin took:", elapsed)

	// OUTPUT:
	// 19
	// Odin took: 71µs
}

sumFibonacci :: proc(l: []int) -> int {
	total := 0
	for val in l {
		if is_fibonacci(val) {
			total += val
		}
	}

	return total
}


is_fibonacci :: proc(n: int) -> bool {
	// guard clauses -----------------------------
	if n < 0 do return false
	if n == 0 || n == 1 do return true
	// -------------------------------------------

	local_array := make([dynamic]int)
	defer delete(local_array)

	append(&local_array, 0, 1)

	val := 0
	for {
		val = local_array[len(local_array) - 1] + local_array[len(local_array) - 2]
		append(&local_array, val)

		if n > local_array[len(local_array) - 1] do continue
		else if n == local_array[len(local_array) - 1] do return true
		else if n < local_array[len(local_array) - 1] do return false
	}

	return false
}
