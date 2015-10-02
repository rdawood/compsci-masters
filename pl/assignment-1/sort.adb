With Ada.Integer_Text_IO;
With Ada.Text_IO;

Package Body sort is
	package IIO renames Ada.Integer_Text_IO;
	package TIO renames Ada.Text_IO;

	Procedure print_array(list:array_to_sort) is
	begin
		TIO.Put_Line("The array is: ");
		TIO.New_Line;
		for i in list'Range loop
			IIO.Put(list(i));
			if i mod 5 = 0 then
				TIO.New_Line;
			end if;
		end loop;
		TIO.New_Line;
	end print_array;

	Procedure sorter(list:array_to_sort) is
		sorted_array : array_to_sort (1..SIZE) := (others => 0);

	begin
		sorted_array := split(list);
	end sorter;

	Function get_array return array_to_sort is
	int_file : TIO.File_Type;	
	Index : Integer:=1;
	number : Integer;
	list : array_to_sort (1..SIZE) := (others => 0);
	begin
		TIO.Open(int_file, TIO.In_File, "input.txt");

		while not TIO.End_Of_File(int_file) loop
			IIO.Get(int_file, number);
			list(Index) := number;
			Index := Index + 1;
		end loop;

		TIO.Close(int_file);
		return list;

	end get_array;

	function merge (left_side, right_side : array_to_sort) return array_to_sort is
		total_length : Integer := left_side'Length + right_side'Length;
		results : array_to_sort (1..total_length) := (others => 0);
		left_pointer : Integer := left_side'First;
		right_pointer : Integer := right_side'First;
		result_pointer : Integer := results'First;
		
		begin
			while left_pointer <= left_side'Last and right_pointer <= right_side'Last loop
				if left_side(left_pointer) <= right_side(right_pointer) then
					results(result_pointer) := left_side(left_pointer);
					left_pointer := left_pointer + 1;
				else
					results(result_pointer) := right_side(right_pointer);
					right_pointer := right_pointer + 1;
				end if;
				result_pointer := result_pointer + 1;
				-- If all of the elements weren't assigned through the loop,
				-- then we've exhausted either the left_side or right_side, meaning
				-- we need to assign the rest of the list to the rest of left or 
				-- right.
			end loop;
			if left_pointer <= left_side'Last then
				results(result_pointer..results'Last) := left_side(left_pointer..left_side'Last);
			end if;
			if right_pointer <= right_side'Last then
				results(result_pointer..results'Last) := right_side(right_pointer..right_side'Last);
			end if;
			TIO.New_Line;
			TIO.Put("Results: ");
			print_array(results);
			return results;
		end merge;

	function split(array_to_split:array_to_sort) Return array_to_sort is
		middle : Integer;
		len : Integer;
		mid : Integer;
		sorted : array_to_sort (array_to_split'Range) := (others => 0);
		right_side_mid : Integer;
		begin
			TIO.Put("Array to split is: ");
			TIO.New_Line;
			print_array(array_to_split);
			if array_to_split'Length <= 1 then
				IIO.Put(array_to_split'first);
				TIO.Put("Registered true, returning");
				TIO.New_Line;
				print_array(array_to_split);
				TIO.New_Line;
				return array_to_split;
			else
				len := array_to_split'Last;
				middle := (array_to_split'Length / 2) + Integer'Pos(array_to_split'First);
				mid := Integer'Val(middle);
				right_side_mid := Integer'Val(middle);
				TIO.New_Line;
				TIO.Put("Middle is");
				IIO.Put(mid);
				if middle = 1 then
					right_side_mid := 0;
				end if;
				declare
					left_side : array_to_sort (array_to_split'First..mid-1) := array_to_split(array_to_split'First..mid-1);
					right_side : array_to_sort (mid..len) := array_to_split(mid..len);
					begin
						TIO.New_Line;
						print_array(left_side);
						print_array(right_side);
						TIO.Put("left_side length:");
						IIO.Put(left_side'Length);
						left_side := split(left_side);
						right_side := split(right_side);
						sorted := merge(left_side, right_side);
					end;
				return sorted;
			end if;
		end split;


-- Function Body merge return array_to_sort is
-- 	begin
-- 		return null;
-- 	end merge;

end sort;