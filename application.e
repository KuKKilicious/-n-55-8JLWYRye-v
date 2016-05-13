
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

            do
                create comp_key.make (0)
                rol := FALSE
                max := 3
                create node_input.make(max)
                --create k.make(node_input, rol)
                create k.make (2)
        real_add(k, node_input)
        io.put_string ("hallo")
        print(node_input.get_key_list.item (1))


            end
feature
real_add(key_to_add:KEY node:NODE)
        local
            changed: BOOLEAN
            added: BOOLEAN
        do
            from
                count:=1
            until
                count= node.get_key_list.capacity+1 or added
            loop
                if
                    node.get_key_list.at (count).get_is_real

                then
                    print(node.get_key_list.at (count).get_is_real)
                    if
                        key_to_add.get_value <node.get_key_list[count].get_value
                    then
                        print("key_to_add.get_value<node.....")
                        from
                        array_count:= node.get_key_list.capacity-1
                        until
                        array_count=node.get_key_list[count].get_value
                        loop
                        node.get_key_list.put (node.get_key_list[array_count],array_count+1)
                        array_count:= array_count-1
                        end -- loop
                        node.get_key_list.put (key_to_add,count)
                        key_to_add.set_is_real (true)
                        changed:=true
                    end -- then

                --when not is real then add
                else
                    node.get_key_list.at (count):=key_to_add
                    key_to_add.set_is_real (true)
                end -- then
                count:=count+1
            end -- loop
        if
            changed=false
        then
            node.get_key_list.put (key_to_add,node.get_key_list.capacity)
        end -- then
        if
            node.get_key_list[node.get_key_list.capacity].is_real
        then
            switch(node)
        end
        end -- do

feature
switch(current_node:NODE)
local
        parent_node:detachable NODE
        middle_key: KEY
        node:NODE
        node2:NODE
        count1:INTEGER
        do
                middle_key :=current_node.get_key_list[middlekey(current_node)]
                parent_node:= current_node.get_parentnode -- möglicherweise hier fehler da parentnode leer sein kann
                if
                    current_node.has_father = FALSE
                    then
                    create node.make (max)
                    create node2.make (max)
                    from
                        count1:=1
                    until
                        count1 = middlekey(current_node)
                    loop
                        node.get_key_list.put (current_node.get_key_list[count1],count1)
                        current_node.get_key_list.put (comp_key, count1)
                    end
                end
        end
feature -- gibt Mittleren Key zurück
middlekey(current_node:NODE):INTEGER
        local

        capacity: INTEGER_32
        lol:REAL_64
        do
            capacity:= current_node.get_key_list.capacity
        if
                    capacity//2 =0
                then
                    lol:=  capacity/2
                    Result:= lol.rounded
                else
                    capacity :=capacity+1
                    lol:= capacity/2
                    Result:= lol.rounded
                end
        end
feature{NONE}
search(number: INTEGER_32 node: NODE): BOOLEAN
local
	key_list: ARRAY[KEY]
	i: INTEGER_32
	do
		key_list:=node.get_key_list
		from
		 i:=1
		until
		i>key_list.capacity-1
		loop
	if
	key_list[i].get_is_real
	then
		if
		number<key_list[i].get_value
		then
			if
			key_list[i].has_left_node
			then
			search(number, key_list[i].get_left_node)
			end--if-then
		elseif
			number>key_list[key_list.capacity-1].get_value
		then
			if
				key_list[key_list.capacity-1].has_left_node
			then
				search(number, key_list[key_list.capacity-1].get_right_node)
			end--if-then
		elseif
			number=key_list[i]
		then
			Result:=TRUE
		else
			Result:=FALSE
		end--if-then-elseif..
		i:=i+1
	end--if-then
	end--loop
	end--do
--searches the node and all sub-nodes for number(INTEGER_32) and returns a NODE

feature{NONE}
search_return_node(number: INTEGER_32 node: NODE): NODE
	local
	key_list: ARRAY[KEY]
	i: INTEGER_32

	do
		key_list:=node.get_key_list
		from
		 i:=1
		until
		i>key_list.capacity-1
		loop
			if
				key_list[i].get_is_real
			then
				if
				number<key_list[i].get_value
				then
					if
					key_list[i].has_left_node
					then
					search(number, key_list[i].get_left_node)

					end

				elseif
				number>key_list[key_list.capacity-1].get_value
				then
					if
					key_list[key_list.capacity-1].has_left_node
					then
					search(number, key_list[key_list.capacity-1].get_right_node)
					end
				elseif
				number=key_list[i].get_value
				then
				else
				Result:=node
				end
			i:=i+1
			end--if
	end--loop
end--do
end--class
