//
//  KeychainTests.swift
//  KeychainTests
//
//  Created by Gabriel Bretschner on 14.09.16.
//  Copyright © 2016 Gabriel Bretschner. All rights reserved.
//

import XCTest
@testable import Keychain

class KeychainTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testKeychainSet(){
      let setKey = Keychain.set("foo", value: "test")
      let getKey = Keychain.get("foo") as! String
      
      XCTAssertTrue(setKey, "set keychain value with string")
      XCTAssertNotNil(getKey, "retrieve keychain value with key")
      XCTAssertEqual(getKey, "test", "retrieved keychain value matches raw string")
    }
  
}
