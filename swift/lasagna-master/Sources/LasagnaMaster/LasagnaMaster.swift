func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    let noodlesPerLayer = 3
    let saucePerLayer = 0.2
    
    // Starting at zero, if we find a sauce layer, add the necessary amount of sauce to our total so far.
    // Exercism analysis requires us to format our starting result as `0.0` so it does not infer the returning type to be an Int
    let sauceNeeded = layers.reduce(0) { resultSoFar, layerStr in
        if layerStr == "sauce" {
            return resultSoFar + saucePerLayer
        } else {
            return resultSoFar
        }
    }
    
    // Again, starting at zero, add the necessary noodles when we find a noodle layer
    let noodlesNeeded = layers.reduce(0) { resultSoFar, layerStr in
        if layerStr == "noodles" {
            return resultSoFar + noodlesPerLayer
        } else {
            return resultSoFar
        }
    }

    return (noodlesNeeded, sauceNeeded)
}

func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
    // Multiply the sauce which is in liters by 33.814 to convert to fluid ounces
    amount = (amount.noodles, amount.sauce * 33.814)
}

func redWine(layers: String...) -> Bool {
    // Count up the mozzarella, ricotta, and béchamel layers
    let mozzRicAndBech = layers.reduce(0) { sumSoFar, layerStr in
        if layerStr == "mozzarella" || layerStr == "ricotta" || layerStr == "béchamel" {
            return sumSoFar + 1
        } else {
            return sumSoFar
        }
    }

    // Count up the meat and sauce layers
    let meatAndSauce = layers.reduce(0) { sumSoFar, layerStr in
        if layerStr == "meat" || layerStr == "sauce" {
            return sumSoFar + 1
        } else {
            return sumSoFar
        }
    }

    // If we have more mozzarella, ricotta, and béchamel return false, else, return true
    return mozzRicAndBech > meatAndSauce ? false : true
}

