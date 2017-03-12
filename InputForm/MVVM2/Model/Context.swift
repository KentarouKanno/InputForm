
import Foundation

open class Context {
    
    static let defaultContext = Context() // Singleton
    
    var paybacks = [Payback]()
    
    func addPayback(_ payback: Payback) {
        paybacks.insert(payback, at: 0)
    }
    
    func editPayback(_ index: Int, firstName: String, lastname: String, amount: Double, updated: Date) {
        let payback = paybacks[index]
        payback.firstName = firstName
        payback.lastName = lastname
        payback.amount = amount
        payback.updatedAt = updated
    }
    
    func removePayback(_ index: Int) {
        paybacks.remove(at: index)
    }
    
}
