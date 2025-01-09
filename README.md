# Assignment 1 - Swift, Xcode, and Basic Setup

## Medication

For the `Medication` type, I created 2 files:
* [Medication.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1/Medication.swift): Source code file with the Medication struct.
* [MedicaionTests.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1Tests/MedicationTests.swift): Unit tests file.

### Additional Functionality
* Added `dateCompleted` and `completed` properties to track when the medication treatment was completed. In a real application, it would be useful to track patient treatments.
* Added a custom description variable that is used in print statements. Having a human-readable descripion of the medication instance would be helpful for debugging.

## Blood Type

For the `BloodType`, I created 2 files:
* [BloodType.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1/BloodType.swift): Source code file with the BloodType enum.
* [BloodTypeTests.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1Tests/BloodTypeTests.swift): Unit tests file.

### Additional Functionality
* Added a custom description for each blood type in the enum so that we get a human-readable description of the blood types.

## Patient

For the `Patient` type, I created 2 files:
* [Patient.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1/Patient.swift): Source code file with the Patient class.
* [PatientTests.swift](https://github.com/MiguelAFH/CS342-Assignment1/blob/main/Assignment1Tests/PatientTests.swift): Unit tests file.

### Additional Functionality
* Added the `bloodDonorTypes()` method that returns a set of the blood types the current patient can receive transfusions from.
