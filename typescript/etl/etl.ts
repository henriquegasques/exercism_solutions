type OldPointsMapping = { [pointsValue: string]: string[] };
type NewPointsMapping = { [letter: string]: number };

export function transform(oldMapping: OldPointsMapping) {
  let newPointsMapping: NewPointsMapping = {};

  for (const pointsValue in oldMapping) {
    oldMapping[pointsValue].forEach(letter => {
      newPointsMapping[letter.toLowerCase()] = parseInt(pointsValue);
    });
  }

  return newPointsMapping;
}
