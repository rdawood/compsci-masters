with Ada.Text_IO; 
with sort;

procedure progmain is
	package TIO renames Ada.Text_IO;
	use sort;
	results : array_to_sort (1..SIZE) := (others => 0);
	first_array : array_to_sort (1..SIZE) := get_array;
	middle : Integer := (first_array'Length / 2) + Integer'Pos(first_array'First);
	left_side : array_to_sort (first_array'First..middle) := first_array(first_array'First..middle);
	right_side : array_to_sort (middle+1..first_array'Last) := first_array(middle+1..first_array'Last);

	Procedure runMergeSort is
		task left_split;
		task right_split;
		task sum;
		task printer;

		task body printer is
		begin
			print_array(first_array);
		end printer;

		task body left_split is
		begin
			left_side := mergeSort(left_side);
			TIO.Put("Task left_split complete.");
			print_array(left_side);
		end left_split;

		task body right_split is 
		begin
			right_side := mergeSort(right_side);
			TIO.Put("Task right_split complete.");
			print_array(right_side);
		end right_split;

		task body sum is
		begin
			declare
				total : Integer := 0;
			begin
				for i in first_array'Range loop
					total := total + first_array(i);
				end loop;
			end;
		end sum;
	
		begin
			null;
		end runMergeSort;

begin
	runMergeSort;
	results := merge(left_side, right_side);
	print_array(results);
end progmain;

