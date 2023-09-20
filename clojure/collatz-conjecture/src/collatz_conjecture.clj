(ns collatz-conjecture)

(defn collatz
  ([num] (collatz num 0))
  ([num step] {:pre [(pos? num)]}
              (if-not (= 1 num)
                (collatz (if (even? num) (quot num 2) (inc (* num 3))) (inc step))
                step)))
