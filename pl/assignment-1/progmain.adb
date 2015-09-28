with Ada.Text_IO; 
with sort;

procedure progmain is
package TIO renames Ada.Text_IO;
use sort;
first_array : array_to_sort;

-- task Reader is
-- 	null;
-- end Reader;

-- task Sum is
-- 	null;
-- end Sum;

-- task Printer is
-- 	null;
-- end Printer;

begin
	-- read in array;
	-- sort array
	-- once sorted
	-- 	merge array, then
	-- 	print array
	-- 	print sum of array
	first_array := get_array;
	TIO.Put_Line("Read in unsorted array.");
	print_array(first_array);
	TIO.New_Line;
	sorter(first_array);
end progmain;

