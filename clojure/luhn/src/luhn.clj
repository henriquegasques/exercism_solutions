(ns luhn
  (:require [clojure.string :as str]))

(defn- remove-spaces [num-string]
  (str/replace num-string #"\s" ""))

(defn- double-sub-nine [number]
  (let [doubled (* 2 number)]
    (if (> doubled 9) (- doubled 9) doubled)))

(defn- has-invalid-characters? [string]
  (or (<= 1 (count string)) (not (every? #(Character/isDigit %) string))))

(defn- valid-number? [number]
  (->> number
       (map #(Character/digit % 10))
       (reverse)
       (map #(%1 %2) (cycle [identity double-sub-nine]))
       (reduce +)
       (#(mod % 10))
       (== 0)))

(defn valid? [num-string]
  (let [string (remove-spaces num-string)]
    (if-not (has-invalid-characters? string) (valid-number? string) false)))
