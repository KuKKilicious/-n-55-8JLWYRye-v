note
    description: "Summary description for {KEY}."
    author: ""
    date: "$Date$"
    revision: "$Revision$"

class
KEY

create
make

feature-- Initialization

--make(node_input: NODE rol: BOOLEAN)
--        do
--            if rol = FALSE
--            then
--                set_left_node(node_input)
--            else
--                set_right_node(node_input)
--            end
--        end

make(value_input: INTEGER)
        do
        set_value(value_input)
        end

feature-- Status

value: INTEGER -- value of key
left_node:detachable NODE --node which contains smaller values than value
right_node:detachable NODE --node which contains bigger values than value
is_real:BOOLEAN



feature -- Access

        set_right_node(right_node_input: NODE)
            -- sets the right node of key object, which contains bigger key values than this key
        do
            right_node:=right_node_input
        end

        set_left_node(left_node_input: NODE)
            -- sets the left node of key object, which contains smaller key values than this key
        do
            left_node:=left_node_input
        end

        set_value(value_input: INTEGER)
        do
        value:=value_input
        end
        get_value : INTEGER
        do
        Result:= value
        end
        set_is_real(how:BOOLEAN)
        do
            is_real:=how
        end
        get_is_real:BOOLEAN
        do
        Result:= is_real
        end
end


