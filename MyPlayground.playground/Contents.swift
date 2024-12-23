import Foundation

// MARK: - #1 Method

@propertyWrapper
struct DateString {
    private var date: Date
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    public init(wrappedValue: Date) {
        self.date = wrappedValue
    }
    
    var wrappedValue: Date {
        get { date }
        set { date = newValue }
    }
    
    var formattedCurrentDateString: String {
        dateFormatter.string(from: date)
    }
    
    //$access
    var projectedValue: DateString {
        self
    }
}

// Using Case
struct Testing {
    @DateString var taskDate: Date
    
    init(taskDate: Date) {
        self._taskDate = DateString(wrappedValue: taskDate)
    }
}

let date = Date()
let test = Testing(taskDate: date)
print("Formatted Date String: \(test.$taskDate.formattedCurrentDateString)")


//MARK: - #2
let pes = Date()
print(pes.toString(format: "MM/dd"))



