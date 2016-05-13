
note
    description : "BTREE application root class"
    date        : "$Date$"
    revision    : "$Revision$"

class
APPLICATION

inherit
ARGUMENTS

create
make

feature -- Variables
        rol: BOOLEAN
        max: INTEGER_32
        count: INTEGER_32
        array_count:INTEGER_32
        comp_key: KEY -- um standart key in arrays zu füllen

feature

make
local
        node_input: NODE
        k: KEY
        k2:KEY
        k3:KEY
            do
                create comp_key.make (0)
                rol := FALSE
                max := 3
                create node_input.make(max)
                --create k.make(node_input, rol)
                create k.make (3)
                create k2.make (7)
                create k3.make (4)
        real_add(k, node_input)
        real_add (k2, node_input)
        real_add (k3, node_input)
        print(node_input.get_key_list.item (1))
        print(node_input.get_key_list.item (2))
        print(node_input.get_key_list.item (3))


            end
feature
real_add(key_to_add:KEY node:NODE)
        local
            changed: BOOLEAN
            added: BOOLEAN
            temp_key:KEY
            counter2:INTEGER
        do
            from
                count:=1
            until
                count= node.get_key_list.capacity+1 or added
            loop
                    if--if2 is real
                        node.get_key_list.at (count).get_is_real
                    then
                        print("is real")
                        if--if3 value_to_add_ <
                            key_to_add.get_value <node.get_key_list[count].get_value
                        then
                            print("value <")
                                from
                                    counter2:=node.get_key_list.capacity
                                until
                                    counter2=1
                                loop
                                print("%Nloop%N")
                                print((node.get_key_list.capacity))
                                print("%N")
                                    node.get_key_list.at (counter2):=node.get_key_list.at (counter2-1)
                                    --moves all elements
                                    counter2:=counter2-1
                                end
                                node.get_key_list.at (1):=key_to_add
                                key_to_add.set_is_real (true)
                                added:=true
                        elseif    --if3 value >
                        key_to_add.get_value >node.get_key_list[count].get_value
                        then
                        print("value >")
                        count:=count+1
                        end -- if3
                    else --if2 when not is real then add
                        print("not real")
                        print(key_to_add.get_value)
                        node.get_key_list.at (count):=key_to_add
                        key_to_add.set_is_real (true)
                        added:=true
                    end -- if2
                end--loop
        --if --if5
        --    changed=false
        --then
        --    node.get_key_list.put (key_to_add,node.get_key_list.capacity)
        --end -- if5
        --if --if6
        --    node.get_key_list[node.get_key_list.capacity].is_real
        --then
        --    switch(node)
        --end --if6
        end -- do


        --searches the tree for number starting from given node(usually root_node) returns boolean
feature{NONE}
search(number: INTEGER_32 node: NODE): BOOLEAN
local
key_list: ARRAY[KEY]
i: INTEGER_32
do
        key_list:=node.get_key_list --array to compare on
        from --goes through array until second last position, (a balanced tree is expected)
        i:=1
        until
        i>key_list.capacity-1
        loop
if
key_list[i].get_is_real --if Key on position key_list[i] is a real key with a value to compare
then
        if
        number<key_list[i].get_value --if the number this function is looking for is smaller than the value of the key at position I
        then
            if
            key_list[i].get_has_left_node --if the Key at position i has a left node
            then
            Result:=search(number, key_list[i].get_left_node) --the result boolean is the recursive search of key's left node
            end--if-then
        elseif
            number>key_list[key_list.capacity-1].get_value --else if the number is greater than the key value at the second last position of the array
        then
            if
                key_list[key_list.capacity-1].get_has_left_node --and the key at the second last position of the array has a left node
            then
                Result:=search(number, key_list[key_list.capacity-1].get_right_node) --the result boolean is the recursive search of key's right node on the second last position of the current Array.
            end--if-then
        elseif
            number=key_list[i].get_value --if the number is found,
        then
            Result:=TRUE--return true
        end--if-then-elseif..
        i:=i+1
end--if-then
Result:=FALSE--else return false

end--loop
end--do
--searches the node and all sub-nodes for number(INTEGER_32) and returns a NODE

feature{NONE}
search_return_node(number: INTEGER_32 node: NODE): NODE
local
key_list: ARRAY[KEY] --Array to work with.
i: INTEGER_32
test_node: NODE
do
        key_list:=node.get_key_list --gets array from current node
        from
        i:=1                        --loop until second last position
        until
        i>key_list.capacity-1
        loop
            if
                key_list[i].get_is_real--checks if Key at position 'i' is real
            then
                if
                number<key_list[i].get_value --gets value: INTEGER of Key at position 'i'
                then
                    if
                    key_list[i].get_has_left_node --gets boolean if key has a left node
                    then
                    test_node:=search_return_node(number, key_list[i].get_left_node) --uses test node to use the search_return_node function recursively with the number and the left node of key at position 'i' as input params

                    end

                elseif
                number>key_list[key_list.capacity-1].get_value
                then
                    if
                    key_list[key_list.capacity-1].get_has_left_node
                    then
                    test_node:=search_return_node(number, key_list[key_list.capacity-1].get_right_node) --uses test node to use the search_return_node function recursively with the number and the right node of key at second last position as input params
                    end
                elseif
                number=key_list[i].get_value
                then
                else
                Result:=node --returns current node
                end
                i:=i+1 --increases i: i+=1
            end--if
end--loop
Result:=node
end--do








feature
switch(current_node:NODE) -- method to change the current Node to 2 Nodes and save the Middle key to recursively call real_add
local
        parent_node:detachable NODE
        middle_key: KEY
        node:NODE
        node2:NODE
        count1:INTEGER
        count2: INTEGER


        do
                middle_key :=current_node.get_key_list[middlekey(current_node)]
                parent_node:= current_node.get_parentnode
                create node.make (max) -- new Node for the keys with lower values than the middle key
                count2:=1

                    from
                        count1:=1
                    until
                        count1 < middlekey(current_node)
                    loop
                        node.get_key_list.put (current_node.get_key_list[count1],count1) -- new Keys are put to the new Node
                        current_node.get_key_list.put (comp_key, count1) -- write default values to copied keys
                        node.set_parentnode (current_node.get_parentnode) -- parent node is set for the new node
                        count:= count+1
                    end

                    from
                        count1:= current_node.get_key_list.capacity
                    until
                        count1> middlekey(current_node)
                    loop
                        current_node.get_key_list.put (current_node.get_key_list[count1],count2) -- current node sorts the keys with bigger values than middle to the start of the array
                        current_node.get_key_list.put (comp_key,count1) -- the keys with lower values than middle_key become default
                        count2:= count2+1
                        count1:= count1-1 -- parentnode stays the same
                    end

            if
                current_node.has_father = FALSE -- ist current_node Root??

            then
                create node2.make (max)
                    node2.get_key_list.put (middle_key, 1)
                    middle_key.set_left_node (node)
                    middle_key.set_right_node (current_node)
                    node2.set_root :=true -- Node is created,value,right,leftNode is set, isRoot is set true
                    node.set_parentnode (node2)
                    current_node.set_parentnode (node2) -- right and leftnode of root get their parent

            end
            if
                current_node.has_father -- if current_node has father we have to put the middle key in the Parent node Array
            then
                if
                    middle_key.get_value < current_node.get_parentnode.get_key_list[1].get_value-- if middle key_position is first of parent array
                then
                    middle_key.set_left_node (node1)                                -- the left/right nodes are set
                    middle_key.set_right_node (current_node)
                    current_node.get_parentnode.get_key_list[1].set_left_node (current_node) -- one key of parent-array gets new leftnode
                end
                if -- is middle_key-value the highest of parent-array
                    true
                then

                from
                    count1:= current_node.get_parentnode.get_key_list[current_node.get_parentnode.get_key_list.capacity]
                until
                    current_node.get_parentnode.get_key_list[count1].get_is_real
                loop
                    if
                        current_node.get_parentnode.get_key_list[count1].get_is_real and
                        middle_key.get_value> current_node.get_parentnode.get_key_list[current_node.get_parentnode.get_key_list.capacity]
                    then
                        middle_key.set_left_node (node1)
                        middle_key.set_right_node (current_node)   -- middle key gets new right/liftnode
                        current_node.get_parentnode.get_key_list[count1].set_right_node (node1) -- one Key of Parent-array gets new right node

                    end
                end
                else
                    -- key gets set in the middle of the Array
                end

            end

            add_real(middle_key,current_node.get_parentnode) -- recursive call to check the parentnode for changes
end

end
