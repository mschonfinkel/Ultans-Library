namespace Parsing

open System.IO
open System
open System.ComponentModel

module LoanPayments = 
    let readLines (filePath : string) = 
        File.ReadAllLines filePath

    printfn "pwd: %s" __SOURCE_DIRECTORY__

    let lines = 
        System.IO.Path.Combine(__SOURCE_DIRECTORY__, @"DATA/Loan_payments_data.csv")        
        |> readLines
        |> Array.distinct
        |> Array.map (fun s -> s.Split(','))

    let header =
        lines
        |> Array.take 1

    let data =
        lines
        |> Array.skip 1

    [<Measure>]type dollar
    [<Measure>]type terms
    [<Measure>]type age
    [<Measure>]type days

    type LoanStatus = 
        | PaidOff of PaidOffTime : DateTime
        | Collection of PastDueDays : int<days>
        | CollectionPaidOff of PaidOffTime : DateTime * PastDueDays : int<days>

    type Education =
        | HighSchoolOrBelow
        | College
        | MasterOrAbove

    type Gender =
        | Male
        | Female

    let transformToLoanStatus (status, paidOffTime, pastDueDays) =
        match status with
        | "PAIDOFF" -> PaidOff(DateTime.Parse paidOffTime)
        | "COLLECTION" -> Collection((Int32.Parse(pastDueDays)) * 1<days>)
        | "COLLECTION_PAIDOFF" -> CollectionPaidOff(DateTime.Parse paidOffTime, (Int32.Parse(pastDueDays))*1<days>)
        | unknown -> failwith (sprintf "Unrecognized Loan Status: '%s' " unknown)

    let transformToEducation = function
        | "High School or Below" -> HighSchoolOrBelow
        | "Bechalor"
        | "college" -> College
        | "Master or Above" -> MasterOrAbove
        | unknown -> failwith (sprintf "Unrecognized Education: '%s'" unknown)

    let transformToGender = function
        | "male" -> Male
        | "female" -> Female
        | unknown -> failwith (sprintf "Unrecognized Gender: '%s'" unknown)

    type LoanPaymentData =
        {
            LoanId : string
            LoanStatus : LoanStatus
            Principal : int<dollar>
            Terms : int<terms>
            EffectiveDate : DateTime
            DueDate : DateTime
            Age : int<age>
            Education : Education
            Gender : Gender
        }
      
    let transformToLoanPaymentData (data : string array) : LoanPaymentData =
        {
            LoanId = data.[0]
            LoanStatus = transformToLoanStatus (data.[1], data.[6], data.[7])
            Principal = Int32.Parse(data.[2]) * 1<dollar>
            Terms = Int32.Parse(data.[3]) * 1<terms>
            EffectiveDate = DateTime.Parse(data.[4])
            DueDate = DateTime.Parse(data.[5])
            Age = Int32.Parse(data.[8]) * 1<age>
            Education = data.[9] |> transformToEducation
            Gender = data.[10] |> transformToGender
        }

    let paymentData =
        data
        |> Array.map transformToLoanPaymentData

    printfn "%A" paymentData