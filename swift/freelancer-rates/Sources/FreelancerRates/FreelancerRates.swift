func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate * 8)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let monthlyRate = dailyRate * 22.0
    return monthlyRate - (monthlyRate * (discount / 100.0)).rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let dailyDiscount = dailyRate * (discount / 100.0)
    return (budget / (dailyRate - dailyDiscount)).rounded(.down)
}
