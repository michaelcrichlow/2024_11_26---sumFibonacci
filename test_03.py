def is_fibonacci(n: int) -> bool:
    # guard clauses -----------------------------
    if n < 0:
        return False

    if n == 0 or n == 1:
        return True
    # -------------------------------------------

    local_array = [0, 1]
    while True:
        val = local_array[-1] + local_array[-2]
        local_array.append(val)

        if n > local_array[-1]:
            pass
        elif n == local_array[-1]:
            return True
        elif n < local_array[-1]:
            return False


def sumFibonacci(l: list[int]) -> int:
    total = 0
    for val in l:
        if is_fibonacci(val):
            total += val

    return total


def main() -> None:
    print(sumFibonacci([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))


if __name__ == '__main__':
    main()

# sumFibonacci([1,2,3,4,5,6,7,8,9,10]) => 20
