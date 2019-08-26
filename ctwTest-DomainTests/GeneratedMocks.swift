// MARK: - Mocks generated from file: ctwTest-Domain/Gateways/GeoSuggestionGateway.swift at 2019-08-26 00:39:34 +0000

//
//  GeoSuggestionGateway.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Cuckoo
@testable import ctwTest_Domain

import Foundation
import RxSwift


public class MockGeoSuggestionGateway: GeoSuggestionGateway, Cuckoo.ProtocolMock {
    
    public typealias MocksType = GeoSuggestionGateway
    
    public typealias Stubbing = __StubbingProxy_GeoSuggestionGateway
    public typealias Verification = __VerificationProxy_GeoSuggestionGateway

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GeoSuggestionGateway?

    public func enableDefaultImplementation(_ stub: GeoSuggestionGateway) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]> {
        
    return cuckoo_manager.call("getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]>",
            parameters: (query),
            escapingParameters: (query),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getSuggestionFrom(query: query))
        
    }
    

	public struct __StubbingProxy_GeoSuggestionGateway: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getSuggestionFrom<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.ProtocolStubFunction<(SuggestionQueryModel), Single<[GeoSuggestion]>> where M1.MatchedType == SuggestionQueryModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SuggestionQueryModel)>] = [wrap(matchable: query) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGeoSuggestionGateway.self, method: "getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_GeoSuggestionGateway: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getSuggestionFrom<M1: Cuckoo.Matchable>(query: M1) -> Cuckoo.__DoNotUse<(SuggestionQueryModel), Single<[GeoSuggestion]>> where M1.MatchedType == SuggestionQueryModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SuggestionQueryModel)>] = [wrap(matchable: query) { $0 }]
	        return cuckoo_manager.verify("getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class GeoSuggestionGatewayStub: GeoSuggestionGateway {
    

    

    
    public func getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[GeoSuggestion]>).self)
    }
    
}


// MARK: - Mocks generated from file: ctwTest-Domain/Gateways/LocationGateway.swift at 2019-08-26 00:39:34 +0000

//
//  LocationGateway.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Cuckoo
@testable import ctwTest_Domain

import Foundation
import RxSwift


public class MockLocationGateway: LocationGateway, Cuckoo.ProtocolMock {
    
    public typealias MocksType = LocationGateway
    
    public typealias Stubbing = __StubbingProxy_LocationGateway
    public typealias Verification = __VerificationProxy_LocationGateway

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LocationGateway?

    public func enableDefaultImplementation(_ stub: LocationGateway) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func getCurrentLocation() -> Single<[Location]> {
        
    return cuckoo_manager.call("getCurrentLocation() -> Single<[Location]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCurrentLocation())
        
    }
    
    
    
    public func geocode(address: String) -> Single<[Location]> {
        
    return cuckoo_manager.call("geocode(address: String) -> Single<[Location]>",
            parameters: (address),
            escapingParameters: (address),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.geocode(address: address))
        
    }
    

	public struct __StubbingProxy_LocationGateway: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getCurrentLocation() -> Cuckoo.ProtocolStubFunction<(), Single<[Location]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationGateway.self, method: "getCurrentLocation() -> Single<[Location]>", parameterMatchers: matchers))
	    }
	    
	    func geocode<M1: Cuckoo.Matchable>(address: M1) -> Cuckoo.ProtocolStubFunction<(String), Single<[Location]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationGateway.self, method: "geocode(address: String) -> Single<[Location]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_LocationGateway: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getCurrentLocation() -> Cuckoo.__DoNotUse<(), Single<[Location]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCurrentLocation() -> Single<[Location]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func geocode<M1: Cuckoo.Matchable>(address: M1) -> Cuckoo.__DoNotUse<(String), Single<[Location]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: address) { $0 }]
	        return cuckoo_manager.verify("geocode(address: String) -> Single<[Location]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class LocationGatewayStub: LocationGateway {
    

    

    
    public func getCurrentLocation() -> Single<[Location]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Location]>).self)
    }
    
    public func geocode(address: String) -> Single<[Location]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Location]>).self)
    }
    
}


// MARK: - Mocks generated from file: ctwTest-Domain/Use Cases/GetCurrentLocationInteractor.swift at 2019-08-26 00:39:34 +0000

//
//  GetCurrentLocationInteractor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Cuckoo
@testable import ctwTest_Domain

import Foundation
import RxSwift


public class MockGetCurrentLocationInteractor: GetCurrentLocationInteractor, Cuckoo.ClassMock {
    
    public typealias MocksType = GetCurrentLocationInteractor
    
    public typealias Stubbing = __StubbingProxy_GetCurrentLocationInteractor
    public typealias Verification = __VerificationProxy_GetCurrentLocationInteractor

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GetCurrentLocationInteractor?

    public func enableDefaultImplementation(_ stub: GetCurrentLocationInteractor) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    public override var gateway: LocationGateway {
        get {
            return cuckoo_manager.getter("gateway",
                superclassCall:
                    
                    super.gateway
                    ,
                defaultCall: __defaultImplStub!.gateway)
        }
        
        set {
            cuckoo_manager.setter("gateway",
                value: newValue,
                superclassCall:
                    
                    super.gateway = newValue
                    ,
                defaultCall: __defaultImplStub!.gateway = newValue)
        }
        
    }
    

    

    
    
    
    public override func execute() -> Single<[Location]> {
        
    return cuckoo_manager.call("execute() -> Single<[Location]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.execute()
                ,
            defaultCall: __defaultImplStub!.execute())
        
    }
    

	public struct __StubbingProxy_GetCurrentLocationInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var gateway: Cuckoo.ClassToBeStubbedProperty<MockGetCurrentLocationInteractor, LocationGateway> {
	        return .init(manager: cuckoo_manager, name: "gateway")
	    }
	    
	    
	    func execute() -> Cuckoo.ClassStubFunction<(), Single<[Location]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGetCurrentLocationInteractor.self, method: "execute() -> Single<[Location]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_GetCurrentLocationInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var gateway: Cuckoo.VerifyProperty<LocationGateway> {
	        return .init(manager: cuckoo_manager, name: "gateway", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func execute() -> Cuckoo.__DoNotUse<(), Single<[Location]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("execute() -> Single<[Location]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class GetCurrentLocationInteractorStub: GetCurrentLocationInteractor {
    
    
    public override var gateway: LocationGateway {
        get {
            return DefaultValueRegistry.defaultValue(for: (LocationGateway).self)
        }
        
        set { }
        
    }
    

    

    
    public override func execute() -> Single<[Location]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[Location]>).self)
    }
    
}


// MARK: - Mocks generated from file: ctwTest-Domain/Use Cases/GetGeoSuggestionFromQueryInteractor.swift at 2019-08-26 00:39:34 +0000

//
//  GetGeoSuggestionFromQueryInteractor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Cuckoo
@testable import ctwTest_Domain

import Foundation
import RxSwift


public class MockGetGeoSuggestionFromQueryInteractor: GetGeoSuggestionFromQueryInteractor, Cuckoo.ClassMock {
    
    public typealias MocksType = GetGeoSuggestionFromQueryInteractor
    
    public typealias Stubbing = __StubbingProxy_GetGeoSuggestionFromQueryInteractor
    public typealias Verification = __VerificationProxy_GetGeoSuggestionFromQueryInteractor

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: GetGeoSuggestionFromQueryInteractor?

    public func enableDefaultImplementation(_ stub: GetGeoSuggestionFromQueryInteractor) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
    public override var gateway: GeoSuggestionGateway {
        get {
            return cuckoo_manager.getter("gateway",
                superclassCall:
                    
                    super.gateway
                    ,
                defaultCall: __defaultImplStub!.gateway)
        }
        
        set {
            cuckoo_manager.setter("gateway",
                value: newValue,
                superclassCall:
                    
                    super.gateway = newValue
                    ,
                defaultCall: __defaultImplStub!.gateway = newValue)
        }
        
    }
    

    

    
    
    
    public override func execute(for input: SuggestionQueryModel) -> Single<[GeoSuggestion]> {
        
    return cuckoo_manager.call("execute(for: SuggestionQueryModel) -> Single<[GeoSuggestion]>",
            parameters: (input),
            escapingParameters: (input),
            superclassCall:
                
                super.execute(for: input)
                ,
            defaultCall: __defaultImplStub!.execute(for: input))
        
    }
    

	public struct __StubbingProxy_GetGeoSuggestionFromQueryInteractor: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var gateway: Cuckoo.ClassToBeStubbedProperty<MockGetGeoSuggestionFromQueryInteractor, GeoSuggestionGateway> {
	        return .init(manager: cuckoo_manager, name: "gateway")
	    }
	    
	    
	    func execute<M1: Cuckoo.Matchable>(for input: M1) -> Cuckoo.ClassStubFunction<(SuggestionQueryModel), Single<[GeoSuggestion]>> where M1.MatchedType == SuggestionQueryModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SuggestionQueryModel)>] = [wrap(matchable: input) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetGeoSuggestionFromQueryInteractor.self, method: "execute(for: SuggestionQueryModel) -> Single<[GeoSuggestion]>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_GetGeoSuggestionFromQueryInteractor: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var gateway: Cuckoo.VerifyProperty<GeoSuggestionGateway> {
	        return .init(manager: cuckoo_manager, name: "gateway", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func execute<M1: Cuckoo.Matchable>(for input: M1) -> Cuckoo.__DoNotUse<(SuggestionQueryModel), Single<[GeoSuggestion]>> where M1.MatchedType == SuggestionQueryModel {
	        let matchers: [Cuckoo.ParameterMatcher<(SuggestionQueryModel)>] = [wrap(matchable: input) { $0 }]
	        return cuckoo_manager.verify("execute(for: SuggestionQueryModel) -> Single<[GeoSuggestion]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class GetGeoSuggestionFromQueryInteractorStub: GetGeoSuggestionFromQueryInteractor {
    
    
    public override var gateway: GeoSuggestionGateway {
        get {
            return DefaultValueRegistry.defaultValue(for: (GeoSuggestionGateway).self)
        }
        
        set { }
        
    }
    

    

    
    public override func execute(for input: SuggestionQueryModel) -> Single<[GeoSuggestion]>  {
        return DefaultValueRegistry.defaultValue(for: (Single<[GeoSuggestion]>).self)
    }
    
}

