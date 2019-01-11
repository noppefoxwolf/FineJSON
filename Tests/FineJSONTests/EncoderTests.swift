import XCTest
import FineJSON

class EncoderTests: XCTestCase {
    struct A : Codable {
        var a: Int
        var b: String
        var c: B
    }
    
    struct B : Codable {
        var a: [Int]
    }
    
    func test1() throws {
        let a = A(a: 1,
                  b: "b",
                  c: B(a: [2, 3]))
        
        let encoder = FineJSONEncoder()
        let data = try encoder.encode(a)
        let json = String(data: data, encoding: .utf8)!
        
        let expect = """
{
  "a": 1,
  "b": "b",
  "c": {
    "a": [
      2,
      3
    ]
  }
}

"""
        XCTAssertEqual(json, expect)
    }
}