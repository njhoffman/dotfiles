local tree = require("bstree")

do
    local t = tree:new()
    assert(t:contains("a") == false)

    t:insert("a")
    assert(t:contains("a") == true)

    t:insert("c")
    assert(t:contains("a") == true)
    assert(t:contains("c") == true)

    t:insert("X")
    assert(t:contains("X") == true)
    assert(t:contains("a") == true)
    assert(t:contains("c") == true)
end

do
    local t = tree:new()

    t:insert("a")
    local popped = t:remove("a")

    assert(popped == "a")
    assert(t:contains("a") == false)
end

do
    local t = tree:new()

    t:insert(10)
    t:insert(50)
    t:insert(99)

    local popped = t:remove(50)

    assert(popped == 50)
    assert(t:contains(10) == true)
    assert(t:contains(50) == false)
    assert(t:contains(99) == true)
end

do
    local t = tree:new()

    t:insert(10)
    t:insert(5)
    t:insert(1)

    local popped = t:remove(5)

    assert(popped == 5)
    assert(t:contains(10) == true)
    assert(t:contains(5) == false)
    assert(t:contains(1) == true)
end

do
    local t = tree:new()

    t:insert(10)
    t:insert(5)
    t:insert(50)

    local popped = t:remove(10)

    assert(popped == 10)
    assert(t:contains(10) == false)
    assert(t:contains(5) == true)
    assert(t:contains(50) == true)
end
