With Ada.Integer_Text_IO;
With Ada.Text_IO;

Package Body sort is
	package IIO renames Ada.Integer_Text_IO;
	package TIO renames Ada.Text_IO;

	Procedure print_array(list:array_to_sort) is
	begin
		TIO.Put_Line("The array is: ");
		for i in list'Range loop
			IIO.Put(list(i));
			if i mod 5 = 0 then
				TIO.New_Line;
			end if;
		end loop;
	end print_array;

	Procedure sorter(list:array_to_sort) is
		Procedure split(array_to_split:array_to_sort) is
			middle : Integer := array_to_split'Length / 2;
			first_array : array (1 .. middle) of Integer;
			second_array : array (1 .. middle) of Integer;

			begin
				if list'Length = 2 then
					return merge(list(1), list(2));
				end if;
				for i in 1 .. middle loop
					first_array(i) := list(i);
				end loop;
				for i in 1 .. middle loop
					second_array(i) := list(middle + i);
			end loop;
		end split;
	begin
		split(list);
	end sorter;

	Function get_array return array_to_sort is
	int_file : TIO.File_Type;	
	Index : Integer:=1;
	number : Integer;
	list : array_to_sort;
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

-- Function Body merge return array_to_sort is
-- 	begin
-- 		return null;
-- 	end merge;

end sort;