//
//  Patient.swift
//  Assignment1
//
//  Created by Miguel Fuentes on 1/8/25.
//

import Foundation


/**
 The `Patient` class represents a patient in a medical context, including their personal details, health metrics, and medical records.

 - Properties:
    - `medicalRecordNumber`: A unique identifier (UUID) for the patient, generated automatically upon initialization.
    - `firstName`: The first name of the patient.
    - `lastName`: The last name of the patient.
    - `birthDate`: The patient's date of birth.
    - `height`: The height of the patient in meters.
    - `weight`: The weight of the patient in kilograms.
    - `bloodType`: An optional `BloodType` representing the patient's blood type.
    - `medications`: A list of `Medication` objects associated with the patient, defaulting to an empty list if none are provided.
 */
class Patient {
    let medicalRecordNumber: UUID
    let firstName: String
    let lastName: String
    let birthDate: Date
    var height: Double
    var weight: Double
    var bloodType: BloodType?
    var medications: [Medication]
    
    init(firstName: String, lastName: String, birthDate: Date, height: Double, weight: Double, bloodType: BloodType?, medications: [Medication]?) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.height = height
        self.weight = weight
        self.bloodType = bloodType
        self.medications = medications ?? []
        self.medicalRecordNumber = UUID()
    }
    
    /**
     Returns the full name of the patient in "LastName, FirstName (Age in years)" format, where age is calculated based on the patient's `birthDate`.

     - Returns: A `String` containing the last name, first name, and age in years.
     */
    func fullName() -> String {
        let now = Date()
        let components = Calendar.current.dateComponents([.year], from: birthDate, to: now)
        
        return "\(lastName), \(firstName) (\(components.year ?? 0))"
    }
    
    /**
     Returns a sorted list of the patient's ongoing medications. A medication is considered ongoing if it is not marked as completed.

     - Returns: An array of `Medication` objects that are ongoing, sorted by their prescription date in ascending order.
     */
    func ongoingMedications() -> [Medication] {
        let ongoingMedications = medications.filter { !$0.completed }
        return ongoingMedications.sorted { $0.date < $1.date }
    }
    
    /**
     Determines the blood types that can donate to the patient based on their blood type.

     - Returns: A set of `BloodType` values representing the compatible donor blood types. Returns an empty array if the patient's blood type is unknown.
     */
    func bloodDonorTypes() -> Set<BloodType> {
        if bloodType == nil {
            return []
        }
        var donorTypes: Set<BloodType> = [.oNegative]
        switch bloodType! {
        case .aPositive:
            donorTypes.formUnion([.oPositive, .aNegative, .aPositive])
        case .aNegative:
            donorTypes.formUnion([.aNegative])
        case .bPositive:
            donorTypes.formUnion([.oPositive, .bNegative, .bPositive])
        case .bNegative:
            donorTypes.formUnion([.bNegative,])
        case .oPositive:
            donorTypes.formUnion([.oPositive])
        case .oNegative:
            break
        case .abPositive:
            donorTypes.formUnion([.aPositive, .aNegative, .bPositive, .bNegative, .oPositive, .abPositive, .abNegative])
        case .abNegative:
            donorTypes.formUnion([.aNegative, .bNegative, .abNegative])
        }
        return donorTypes
    }
}
