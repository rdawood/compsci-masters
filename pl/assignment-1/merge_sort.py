from time import time
from random import randint

array_to_sort = [randint(1, 100000) for num in range(1, 1000000)]

start = time()

def not_empty(array):
	if len(array) > 0:
		return True
	else:
		return False

def one_element(array):
	if len(array) == 1:
		return True
	else:
		return False

def two_elements(array):
	if len(array) == 2:
		return True
	else:
		return False

def two_or_more(array):
	if len(array) >= 2:
		return True
	else:
		return False

def more_than_one(array):
	if len(array) > 1:
		return True
	else:
		return False

def is_empty(array):
	if len(array) == 0:
		return True
	else:
		return False

index = 0

def split(array_to_sort):
	global index
	index += 1
	# print("Call to split: {} for {}".format(index, array_to_sort))
	if two_elements(array_to_sort):
		return merge(array_to_sort[0], array_to_sort[1])
	elif one_element(array_to_sort):
		return array_to_sort
	elif two_or_more(array_to_sort):
		mid = len(array_to_sort) // 2

		first_half = array_to_sort[:mid]
		# print("\t\tfirst_half: {}".format(first_half))
		second_half = array_to_sort[mid:]
		# print("\t\tsecond_half: {}".format(second_half))

		return merge(split(first_half), split(second_half))


def merge(left_half, right_half):
	# print("\tCall to merge for arrays: ")
	# print(left_half, right_half)
	results = []
	i, j = 0, 0
	if isinstance(left_half, list) and isinstance(left_half, list):
		while i < len(left_half) and j < len(right_half):
			if left_half[i] <= right_half[j]:
				results.append(left_half[i])
				i += 1
				if i == len(left_half):
					results += right_half[j:]
			else:
				results.append(right_half[j])
				j += 1
				if j == len(right_half):
					results += left_half[i:]
	else:
		if left_half <= right_half:
			results += [left_half, right_half]
		else:
			results += [right_half, left_half]
	# print("results: {}".format(results))
	return results

a = split(array_to_sort)

print("My algorithm: {} seconds".format(time() - start))