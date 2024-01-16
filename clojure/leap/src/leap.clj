(ns leap)

(defn- divisible-by? [number year]
  (== 0 (mod year number)))

(defn leap-year? [year]
  (and (divisible-by? 4 year)
    (or (not (divisible-by? 100 year)) (divisible-by? 400 year))))

