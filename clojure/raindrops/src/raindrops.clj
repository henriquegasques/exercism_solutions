(ns raindrops)

(defn- pling [n] (if (zero? (mod n 3)) "Pling" nil))
(defn- plang [n] (if (zero? (mod n 5)) "Plang" nil))
(defn- plong [n] (if (zero? (mod n 7)) "Plong" nil))

(defn convert [n]
  (if-let [result (not-empty (str (pling n) (plang n) (plong n)))]
    result
    (str n)))
