local function foo(a, b)
  if a == nil then a = 0 end
  if b == nil then b = 0 end
  return a + b
end

print(foo(nil, 10)) -- Output: 10
print(foo(5, nil)) -- Output: 5
print(foo(nil, nil)) -- Output: 0

local function bar(a, b)
  a = a or 0
  b = b or 0
  return a + b
end

print(bar(nil, 10)) -- Output: 10
print(bar(5, nil)) -- Output: 5
print(bar(nil, nil)) -- Output: 0

--The difference between using the 'or' operator versus explicitly checking for nil is subtle, but can lead to unexpected behaviour when dealing with values that are considered 'falsy' in Lua.
--Consider a function that takes a table as an argument:

local function processTable(t)
  t = t or {}
  -- ... process t ...
end

processTable(nil) -- t will be an empty table {}

--This works as expected. However, if we pass an empty table:

processTable({}) -- t will be {}!

--This is because an empty table is considered a 'falsy' value in Lua, and thus it's replaced by the default {} value. In cases where you want to maintain the original empty table, we have to use the nil check.
local function processTable2(t)
  if t == nil then
     t = {}
  end
  -- ... process t ...
end

processTable2(nil) -- t will be an empty table {}
processTable2({}) -- t will still be an empty table {}
