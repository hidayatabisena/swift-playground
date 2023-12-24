import UIKit
import Foundation
import Network

struct SpeedTest {
    let url: URL
    var testData: Data
    
    init(url: URL) {
        self.url = url
        self.testData = Data(count: 1 * 1024 * 1024) // 1MB of random data
    }
    
    // Download Speed Test
    func downloadSpeedTest() async throws -> Double {
        let start = Date()
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            fatalError("Failed to get HTTP response.")
        }
        let timeElapsed = Date().timeIntervalSince(start)
        return Double(data.count) / timeElapsed
    }
    
    // Upload Speed Test
    func uploadSpeedTest() async throws -> Double {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let start = Date()
        let (_, response) = try await URLSession.shared.upload(for: request, from: testData)
        guard let httpResponse = response as? HTTPURLResponse else {
            fatalError("Failed to get HTTP response.")
        }
        let timeElapsed = Date().timeIntervalSince(start)
        return Double(testData.count) / timeElapsed
    }
}

// USAGE
let tester = SpeedTest(url: URL(string: "http://ipv4.ikoula.testdebit.info/1M.iso")!)

Task {
    do {
        let downloadSpeedInBytesPerSecond = try await tester.downloadSpeedTest()
        let downloadSpeedInMegabytesPerSecond = downloadSpeedInBytesPerSecond / (1024 * 1024)
        let uploadSpeedInBytesPerSecond = try await tester.uploadSpeedTest()
        let uploadSpeedInMegabytesPerSecond = uploadSpeedInBytesPerSecond / (1024 * 1024)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        if let formattedDownloadSpeed = formatter.string(from: NSNumber(value: downloadSpeedInMegabytesPerSecond)),
           let formattedUploadSpeed = formatter.string(from: NSNumber(value: uploadSpeedInMegabytesPerSecond)) {
            print("Download Speed: \(formattedDownloadSpeed) MB/s")
            print("Upload Speed: \(formattedUploadSpeed) MB/s")
        }
    } catch {
        print("Failed with error: \(error)")
    }
}

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("Password is good!")
} catch {
    print("You can't use that password.")
}




