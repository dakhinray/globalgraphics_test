# Global Graphics Software Ltd
## Technical Exercise
### Test Automation Engineer – Direct Team
The intention of this exercise is to allow you to demonstrate your skills in test automation. We
encourage you to focus on the test aspects of the solution and will be interested to hear about the
development process that you followed. Any additional documentation you produce would also be
welcome.
Task
The attached file algorithms.txt contains three algorithms that take an upper bound and
attempt to return the number of primes less than or equal to the upper bound.
1. Implement each of the algorithms as a command line program that takes the upper bound as
an argument.
2. Write automated tests that check the correctness and performance of each program.
3. What would you feed back to us because of your testing?
Additional Requirements
• How you return the result to the user is up to you; be prepared to explain your decision.
• You may choose to target either or both of Linux and/or Windows.
• You may use any languages or tools that you wish if they are free for commercial use or
have suitable free counterparts. (For the avoidance of doubt, you may use Visual Studio.)
• The source code of your solution should be sent in compressed format (e.g. .zip, .tar.gz)
• Include instructions for building and running your programs.

```sh
================================================================================
algorithm brute_force
  input: integer upper_bound
  let count = 0
  for n from 2 to upper_bound:
    let is_prime = true;
    for d from n-1 to 2 going backwards
      if n modulo d = 0
        let is_prime = false
        break out of inner loop
    if is_prime = true
      increment count
  return count

================================================================================

algorithm sieve_of_eratosthenes
  input: integer upper_bound
  if upper_bound < 2
    return 0
  let primes be the set of integer between 2 and upper_bound inclusive
  let divisor_limit = floor(sqrt(upper_bound))
  for d from 2 to divisor_limit
    for each n in numbers
      if d divides n but is not equal to n
        remove n from primes
  return size of primes

================================================================================

algorithm brute_force
  input: integer upper_bound
  let count = 0
  for n from 2 to upper_bound:
    let is_prime = true;
    for d from 2 to 100
      if d > n
        break out of inner loop
      if n modulo d = 0
        let is_prime = false
        break out of inner loop
    if is_prime = true
      increment count
  return count
================================================================================
```
