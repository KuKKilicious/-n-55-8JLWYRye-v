

note
    description: "Summary description for {NODE}."
    author: "Sarah Roehricht"
    date: "$Date$"
    revision: "$Revision$"

class
NODE

create
make

feature -- variables

        i: INTEGER
        key_list: ARRAY[KEY]
        null: INTEGER
        comp_key: KEY
        root: BOOLEAN
        has_father:BOOLEAN

feature --

make(max: INTEGER_32)

        do

            null := 0
            create comp_key.make (null)
            create key_list.make_filled (comp_key, 1, max)
            root:=FALSE


        end
set_root
do
root:=TRUE
has_father:=FALSE
end
feature -- Status
 parentNode:detachable NODE

feature -- getter setter parent

set_parentNode(parentNode_input: NODE)
do
        parentNode:= parentNode_input
end

get_parentNode:detachable NODE
do
        Result:= parentNode
end

feature -- getter setter

get_key_list: ARRAY[KEY]
        do
            Result := key_list
        end

add_key(obj: KEY)
        local
        j: INTEGER
            do

            from
                j := 1
            until
                j > key_list.capacity - 1
            loop

            --do
                    if
                        key_list[j].same_type (comp_key)
                    then

                    else
                        key_list.put (obj,j)
                    end
            --end

                j := j + 1
            end
        end


end


