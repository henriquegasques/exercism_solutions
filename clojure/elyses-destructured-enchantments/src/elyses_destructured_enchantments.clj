(ns elyses-destructured-enchantments)

(defn first-card [deck]
  (first deck))

(defn second-card [deck]
  (first (rest deck)))

(defn swap-top-two-cards [deck]
    (let [[first second & rest-of-deck] deck]
      (flatten [second first (filter some? rest-of-deck)])))

(defn discard-top-card [deck]
  (let [[top & rest-of-deck] deck]
    [top rest-of-deck]))

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards [deck]
  (let [[top & rest-of-deck] deck]
    (flatten (filter some? [top face-cards rest-of-deck]))))
