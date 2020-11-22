class CoordinateVR{
    var direction: Direction = Direction.Latitude
    
    var degrees: Int  = 0
    var minutes: UInt = 0
    var seconds: UInt = 0

    var median_d: Int
    var median_m: UInt
    var median_s: UInt
    
    init?(degrees: Int, minutes: UInt, seconds: UInt) {

        if direction != self.direction{     // This doesn't work since direction is not changable (between Latitude and Longitude)
            return nil                      // No say in the assignment and I didn't bother (sorry)
        }

        self.median_d = (degrees + self.degrees) / 2    // I'm not 100% sure how to correctly determine median coordinate
        self.median_m = (minutes + self.minutes) / 2    // So I just guessed and devided all by 2 
        self.median_s = (seconds + self.seconds) / 2    

        self.degrees = degrees
        self.minutes = minutes
        self.seconds = seconds

        check_correct()
        show_coordinates_dms()
        show_coordinates_ddd()
        show_median()
    }

    func check_correct(){
        if direction == Direction.Longitude{
            if degrees < -180 || degrees > 180 {
                print("Incorrect degrees value")        
            }
        }
        else if direction == Direction.Latitude{
            if degrees < -90 || degrees > 90 {
                print("Incorrect degrees value")                 
            }
        }
        if minutes < 0 || minutes > 59 {
            print("Incorrect minutes value")        
        }
        if seconds < 0 || seconds > 59 {
            print("Incorrect seconds value")        
        }
    }


    func determine_direction() -> String {
        if degrees < 0 {
            switch (direction) {
                case .Latitude: return "S"
                case .Longitude: return "W"
            }
        }
        else{
            switch (direction) {
                case .Latitude: return "N"
                case .Longitude: return "E"
            }
        }
    }

    func show_coordinates_dms(){
        let dms: String = String(degrees) + "°" + String(minutes)  + "′" + String(seconds) + "″ " + String(determine_direction())
        print(dms)
    }
    func show_coordinates_ddd(){            
        let ddd: Float = Float(degrees) + Float(minutes) / 60 + Float(seconds) / 3600 // Convertation from DDMMSS into DD.DDDD
        let res = String(ddd) + " " + String(determine_direction())
        print(res)
    }
    func show_median(){
        let dms_median: String = String(median_d) + "°" + String(median_m)  + "′" + String(median_s) + "″ " + String(determine_direction())
        print("Median Coordinate:", dms_median, "\n")
    }

}

enum Direction {
    case Latitude, Longitude
}

let coordinate = CoordinateVR(degrees: 80, minutes: 26, seconds: 27)
let coordinate1 = CoordinateVR(degrees: -40, minutes: 10, seconds: 58)
let coordinate2 = CoordinateVR(degrees: 190, minutes: 61, seconds: 60)

