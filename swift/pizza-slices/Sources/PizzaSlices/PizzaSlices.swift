func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    // Unwrap diameter and slices
    if let diameter = diameter, let slices = slices {
        if diameter < 0 || slices < 1 {
            return nil
        }

        let pizzaRadius = diameter / 2.0
        let pizzaArea: Double = .pi * pizzaRadius * pizzaRadius

        return pizzaArea / Double(slices)
    }
    return nil
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let diameterADouble = Double(diameterA)
    let slicesAInt = Int(slicesA)
    let slicesAArea = sliceSize(diameter: diameterADouble, slices: slicesAInt)
    let diameterBDouble = Double(diameterB)
    let slicesBInt = Int(slicesB)
    let slicesBArea = sliceSize(diameter: diameterBDouble, slices: slicesBInt)

    switch (slicesAArea, slicesBArea) {
        case (.some, .none):
        return "Slice A is bigger"
        case (.none, .some):
        return "Slice B is bigger"
        case (.none, .none):
        return "Neither slice is bigger"
        case (.some(let sliceAArea), .some(let sliceBArea)):
        if sliceAArea > sliceBArea {
            return "Slice A is bigger"
        }

        if sliceBArea > sliceAArea {
            return "Slice B is bigger"
        }
    }
    return "Neither slice is bigger"
}
