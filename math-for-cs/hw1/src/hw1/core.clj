(ns hw1.core
  (:gen-class))

(use '(incanter core))

;; Question 1-A
(def A-squared-equals-negative-I
  "Explanation:
    A must be a matrix where the matrix A times columns 1 of A is the vector [0, 1]
    and the matrix A times column 2 of A is the vector [0, 1]. Since the outputs are
    1s and 0s, the input must be some combination of 1s and 0s as well."
  (let [A (matrix [[0 1]
                   [1 0]])]
    (mmult A A)))

;; #<Matrix [[1 ,0],
;;           [0 ,1]]>
