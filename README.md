PicoMite BASIC

Written on a ClockworkPi PicoCalc using either a Pico or a Pico2 processer. 

https://beastacademy.com/all-ten

Uses the EXECUTE feature of PicoMite/MMBASIC to build an equation in a string and then execute it

The outer loops calculate the 24 permutations of the 4 numbers

For each of the permutations, we check every combination of operators, +, -, *, /, and concatenation

For each combination, we check all configurations of paratheses

We avoid divide by zero errors by checking if a number is divided by a difference (subtraction) contained in paratheses. Because the four numbers are positive integers, we can only get zero through subtraction, and we can't get zero without parentheses

For concatenation we need to insert a * for numbers touching a paratheses

Doesn't currently try to suppress equations equivalent e.g. through the commutative property
