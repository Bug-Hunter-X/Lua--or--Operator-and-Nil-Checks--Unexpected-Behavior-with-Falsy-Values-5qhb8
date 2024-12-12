# Lua 'or' Operator and Nil Checks: Unexpected Behavior with Falsy Values

This repository demonstrates a subtle but potentially problematic difference between using Lua's `or` operator for defaulting values and explicitly checking for `nil`. While both approaches might seem equivalent for simple cases, the `or` operator's behavior with falsy values can lead to unexpected results.

## The Problem

Lua's `or` operator returns its first operand if it's considered "truthy"; otherwise, it returns the second operand.  An empty table `{}` is considered falsy in Lua.  This can inadvertently overwrite an empty table passed as an argument to a function when using `or` for defaulting.

## The Solution

Explicitly checking for `nil` using `if t == nil then` provides greater control and avoids unexpected overwriting of falsy values.  This ensures that empty tables are not replaced with the default value.

## How to Reproduce

1. Clone this repository.
2. Run `bug.lua` to see the unexpected behavior of using the `or` operator with an empty table.
3. Run `bugSolution.lua` to observe the corrected behavior using explicit `nil` checks.
