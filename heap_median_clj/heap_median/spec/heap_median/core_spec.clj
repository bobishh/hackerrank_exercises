(ns heap-median.core-spec
  (:require [speclj.core :refer :all]
            [heap-median.core :refer :all]))

(describe "#left"
  (it "returns left node index for index"
    (should= 3 (left 1))))

(describe "#right"
  (it "returns right node index for index"
    (should= 4 (right 1))))

(describe "#parent"
  (it "returns parent node index for index"
      (should= 0 (parent 1))
      (should= -1 (parent 0))
  ))

(describe "swap"
  (it "swaps elements in vector"
    (should= [1 3 2] (swap [1 2 3] 2 1))
    (should= [1 3 4 2] (swap [1 3 2 4] 2 3))
    ))

(describe "smaller-node"
  (it "returns smaller node value"
    (should= 6 (smaller-node [1 2 3 4 5 6 7] 2))
    (should= 4 (smaller-node [1 2 3 4 5 6 7] 1))
    (should= 2 (smaller-node [1 2 3 4 5 6 7] 0))
    ))

(describe "smaller"
  (it "returns smaller node index"
    (should= 5 (smaller [1 2 3 4 5 6 7] 2))
    (should= 3 (smaller [1 2 3 4 5 6 7] 1))
    (should= 1 (smaller [1 2 3 4 5 6 7] 0))))

(describe "nice-parent?"
  (it "returns true if parent smaller than any node"
    (should= true (nice-parent? [1 2 3 4 5] 0))
    )
  (it "returns false if parent bigger than some node"
    (should= false (nice-parent? [20 2 1 3 4] 0))
    )
  (it "works when parent has no node"
    (should= true (nice-parent? [0] 0))
    )
  )

(describe "safe-get"
  (it "returns number if index is ok"
    (should= 3 (safe-get [1 2 3] 2))
    )
  (it "returns nil if index out of bounds"
    (should= nil (safe-get [0] 1))
    )
  )

(describe "<<"
  (it "adds number to heap"
    (should= [1 3 2] (<< [2 3] 1))
    ))

(describe "poll"
  (it "removes number from root and reorganizes heap"
    (should= '(1 [2 3])  (poll [1 2 3]))
    ))

(def heap (into (vector) (reduce #(<< %2 %1) (range 1 30) [])))

(describe "sorted"
  (it "returns sorted array from a heap"
      (should= (sort heap) (sorted heap []))
      ))

(def sorted-heap [1 2 3 4 5 6 7 8 9 10])

(describe "median"
  (it "returns median of a heap"
    (should= 5.5 (median sorted-heap))))

(describe "get-middle"
          (it "returns middle elements"
              (should= 1 (get-middle [2 1 3]))
              (should= '[1 2] (get-middle [0 1 2 3]))
              ))
