// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import RxSwift
import RxCocoa
@testable import randomusersDemo

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import RxSwift
import RxCocoa
@testable import randomusersDemo

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - UserServiceProtocol
class UserServiceProtocolMock: UserServiceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    func getUsers(page: Int?, onSuccess: @escaping (([User]) -> Void), onError: @escaping ((AppError) -> Void)) {
        addInvocation(.m_getUsers__page_pageonSuccess_onSuccessonError_onError(Parameter<Int?>.value(`page`), Parameter<([User]) -> Void>.value(`onSuccess`), Parameter<(AppError) -> Void>.value(`onError`)))
		let perform = methodPerformValue(.m_getUsers__page_pageonSuccess_onSuccessonError_onError(Parameter<Int?>.value(`page`), Parameter<([User]) -> Void>.value(`onSuccess`), Parameter<(AppError) -> Void>.value(`onError`))) as? (Int?, @escaping (([User]) -> Void), @escaping ((AppError) -> Void)) -> Void
		perform?(`page`, `onSuccess`, `onError`)
    }


    fileprivate enum MethodType {
        case m_getUsers__page_pageonSuccess_onSuccessonError_onError(Parameter<Int?>, Parameter<([User]) -> Void>, Parameter<(AppError) -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getUsers__page_pageonSuccess_onSuccessonError_onError(let lhsPage, let lhsOnsuccess, let lhsOnerror), .m_getUsers__page_pageonSuccess_onSuccessonError_onError(let rhsPage, let rhsOnsuccess, let rhsOnerror)):
                guard Parameter.compare(lhs: lhsPage, rhs: rhsPage, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnsuccess, rhs: rhsOnsuccess, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOnerror, rhs: rhsOnerror, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getUsers__page_pageonSuccess_onSuccessonError_onError(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    struct Verify {
        fileprivate var method: MethodType

        static func getUsers(page: Parameter<Int?>, onSuccess: Parameter<([User]) -> Void>, onError: Parameter<(AppError) -> Void>) -> Verify { return Verify(method: .m_getUsers__page_pageonSuccess_onSuccessonError_onError(`page`, `onSuccess`, `onError`))}
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func getUsers(page: Parameter<Int?>, onSuccess: Parameter<([User]) -> Void>, onError: Parameter<(AppError) -> Void>, perform: @escaping (Int?, @escaping (([User]) -> Void), @escaping ((AppError) -> Void)) -> Void) -> Perform {
            return Perform(method: .m_getUsers__page_pageonSuccess_onSuccessonError_onError(`page`, `onSuccess`, `onError`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - UsersListViewModelProtocol
class UsersListViewModelProtocolMock: UsersListViewModelProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var users: BehaviorRelay<[User]> {
		get {	invocations.append(.p_users_get); return __p_users ?? givenGetterValue(.p_users_get, "UsersListViewModelProtocolMock - stub value for users was not defined") }
		set {	invocations.append(.p_users_set(.value(newValue))); __p_users = newValue }
	}
	private var __p_users: (BehaviorRelay<[User]>)?





    func loadMoreUsers(first: Bool) {
        addInvocation(.m_loadMoreUsers__first_first(Parameter<Bool>.value(`first`)))
		let perform = methodPerformValue(.m_loadMoreUsers__first_first(Parameter<Bool>.value(`first`))) as? (Bool) -> Void
		perform?(`first`)
    }


    fileprivate enum MethodType {
        case m_loadMoreUsers__first_first(Parameter<Bool>)
        case p_users_get
		case p_users_set(Parameter<BehaviorRelay<[User]>>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_loadMoreUsers__first_first(let lhsFirst), .m_loadMoreUsers__first_first(let rhsFirst)):
                guard Parameter.compare(lhs: lhsFirst, rhs: rhsFirst, with: matcher) else { return false } 
                return true 
            case (.p_users_get,.p_users_get): return true
			case (.p_users_set(let left),.p_users_set(let right)): return Parameter<BehaviorRelay<[User]>>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_loadMoreUsers__first_first(p0): return p0.intValue
            case .p_users_get: return 0
			case .p_users_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func users(getter defaultValue: BehaviorRelay<[User]>...) -> PropertyStub {
            return Given(method: .p_users_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func loadMoreUsers(first: Parameter<Bool>) -> Verify { return Verify(method: .m_loadMoreUsers__first_first(`first`))}
        static var users: Verify { return Verify(method: .p_users_get) }
		static func users(set newValue: Parameter<BehaviorRelay<[User]>>) -> Verify { return Verify(method: .p_users_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func loadMoreUsers(first: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .m_loadMoreUsers__first_first(`first`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

