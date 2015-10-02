with Ada.Text_IO; 
with sort;

procedure progmain is
	package TIO renames Ada.Text_IO;
	use sort;
	first_array : array_to_sort (1..SIZE) := (others => 0);

	procedure runTasks is

	begin
		null;
	end runTasks;
-- task Sum is
-- 	null;
-- end Sum;

-- task Printer is
-- 	null;
-- end Printer;

begin
	first_array := get_array;
	TIO.Put_Line("Read in unsorted array.");
	print_array(first_array);
	TIO.New_Line;
	sorter(first_array);
end progmain;

