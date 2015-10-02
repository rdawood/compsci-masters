Package sort is
	SIZE : constant Integer := 40;
	Type array_to_sort is array (Natural Range <>) of Integer;
	Procedure sorter(list:array_to_sort);
	Function split(array_to_split:array_to_sort) Return array_to_sort;
	Function merge(left_side, right_side: array_to_sort) Return array_to_sort;
	Procedure print_array(list:array_to_sort);
	Function get_array return array_to_sort;
	-- Function merge return array_to_sort;
end sort;
