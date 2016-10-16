(ns heap-median.core)

(defn- parent [index]
  (Math/abs (Math/ceil (/ (- index 2) 2))
            )
  )

(defn left [index]
  (+ (* index 2) 1)
  )

(defn- right [index]
  (+ (left index) 1)
  )

(defn- swap [vector index1 index2]
  (assoc vector index2 (vector index1) index1 (vector index2)))


(defn- safe-get [vector index]
  (if (>= index (count vector))
    nil
    (vector index)
    )
  )

(defn nice-parent? [vector index]
  (let [right (safe-get vector (right index))
        left (safe-get vector (right index))
        (not (> parent (smaller-val index)))
    )
  )

(defn smaller-val [vector index]
  (let [left-val (safe-get vector (left index))
        right-val (safe-get vector (right index))]
    (if (not (= right-val nil))
      (min right-val left-val)
      )
    )
  )

(defn smaller [index]
  (if (= (smaller-val vector index) (safe-get vector (right index)))
    (right index)
    (left index)
    )
  )

(defprotocol Heap
             (organize [vector])
             (heapify-up [vector index])
             (heapify-down [vector index])
             (pop [vector])
             (<< [vector element])
             )

(deftype MinHeap [vector]
  Heap
  (heapify-up [vector index]
    (if (>= index (count vector))
             vector
             (when (not (nice-parent? vector index))
               (swap vector index (parent index))
               (heapify-up vector (parent index)))
             )
    )
  (heapify-down [vector index]
    ((if (<= index 0)
       vector
       (if (not (nice_parent? vector index)
                (swap vector index (smaller vector index))
                (heapify-down vector )
                )
         )
       ))
    )
  (organize [vector] (heapify-up (heaipify-down vector 0) (count vector)))
  (<< [vector element] (let [vec (conj vector element)])
      (heapify-down vec 0)
      )
  (pop [vector] (let [vhead (peek vector) (vec (pop vector))]
                  (list vhead (heapify-up vec (- (count vec) 1)))
                 ))
  )
