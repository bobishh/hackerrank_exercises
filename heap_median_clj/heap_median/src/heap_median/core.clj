(ns heap-median.core)

(defn parent [index]
  (-> (- index 2)
      (/ 2)
      (Math/ceil)
      (int)
   )
  )

(defn left [index]
  (-> (* index 2)
      (+ 1)
   )
  )

(defn right [index]
  (+ (left index) 1)
  )

(defn swap [vector index1 index2]
  (assoc vector index2 (vector index1) index1 (vector index2)))


(defn safe-get [vector index]
  (if (or (>= index (count vector)) (< index 0))
    nil
    (vector index)
    )
  )

(defn smaller-node [vector index]
  (let [left-val (safe-get vector (left index))
        right-val (safe-get vector (right index))]
    (if (not (= right-val nil))
      (min right-val left-val)
      left-val
      )
    )
  )

(defn smaller [vector index]
  (if (= (smaller-node vector index) (safe-get vector (right index)))
    (right index)
    (left index)
    )
  )

(defn nice-parent? [vector index]
  (let [parent-value (safe-get vector index) smaller-value (smaller-node vector index)]
    (or (nil? smaller-value) (< parent-value smaller-value))
    )
  )

(defn heapify-up [vector index]
  (let [parent-index (parent index)]
    (if (< parent-index 0)
      vector
      (if (not (nice-parent? vector parent-index))
        (heapify-up (swap vector index parent-index) parent-index)
        (heapify-up vector parent-index)
        )
      )
    )
  )

(defn heapify-down [vector index]
  (if (> index (count vector))
    vector
    (let [smaller-index (smaller vector index)]
      (if (not (nice-parent? vector index))
        (heapify-down (swap vector index smaller-index) smaller-index)
        (heapify-down vector smaller-index)
        )
      )
    )
  )

(defn << [heap element]
  (let [vec (conj heap element)]
    (heapify-up vec (- (count vec) 1))
    ))

(defn poll [heap]
  (let [swapped (swap heap 0 (- (count heap) 1)) vhead (peek swapped) rest (pop swapped)]
    (list vhead (heapify-down rest 0))
    ))
