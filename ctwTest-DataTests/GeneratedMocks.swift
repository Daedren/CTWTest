// MARK: - Mocks generated from file: ctwTest-Data/Interfaces/Network/NetworkDispatcher.swift at 2019-08-25 21:19:59 +0000

//
//  NetworkDispatcher.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Cuckoo
@testable import ctwTest_Data

import Foundation
import RxSwift


public class MockNetworkDispatcher: NetworkDispatcher, Cuckoo.ProtocolMock {
    
    public typealias MocksType = NetworkDispatcher
    
    public typealias Stubbing = __StubbingProxy_NetworkDispatcher
    public typealias Verification = __VerificationProxy_NetworkDispatcher

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkDispatcher?

    public func enableDefaultImplementation(_ stub: NetworkDispatcher) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func execute<T: APIRequest>(request: T) -> Single<T.Response> {
        
    return cuckoo_manager.call("execute(request: T) -> Single<T.Response>",
            parameters: (request),
            escapingParameters: (request),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.execute(request: request))
        
    }
    

	public struct __StubbingProxy_NetworkDispatcher: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func execute<M1: Cuckoo.Matchable, T: APIRequest>(request: M1) -> Cuckoo.ProtocolStubFunction<(T), Single<T.Response>> where M1.MatchedType == T {
	        let matchers: [Cuckoo.ParameterMatcher<(T)>] = [wrap(matchable: request) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkDispatcher.self, method: "execute(request: T) -> Single<T.Response>", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_NetworkDispatcher: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func execute<M1: Cuckoo.Matchable, T: APIRequest>(request: M1) -> Cuckoo.__DoNotUse<(T), Single<T.Response>> where M1.MatchedType == T {
	        let matchers: [Cuckoo.ParameterMatcher<(T)>] = [wrap(matchable: request) { $0 }]
	        return cuckoo_manager.verify("execute(request: T) -> Single<T.Response>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class NetworkDispatcherStub: NetworkDispatcher {
    

    

    
    public func execute<T: APIRequest>(request: T) -> Single<T.Response>  {
        return DefaultValueRegistry.defaultValue(for: (Single<T.Response>).self)
    }
    
}

