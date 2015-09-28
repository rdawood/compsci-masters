with Ada.Text_IO;
with Ada.Integer_Text_IO;

Procedure body print_array(list:array_to_sort) is

		begin
			for i in list'Range loop
				IIO.Put(list(i));
			end loop;
		end print_array;