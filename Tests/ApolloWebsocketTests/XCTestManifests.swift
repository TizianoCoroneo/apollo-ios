#if !canImport(ObjectiveC)
import XCTest

extension MockWebSocketTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__MockWebSocketTests = [
        ("testLocalErrorUnknownId", testLocalErrorUnknownId),
        ("testLocalMissingSubscription", testLocalMissingSubscription),
        ("testLocalSingleSubscription", testLocalSingleSubscription),
    ]
}

extension SplitNetworkTransportTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SplitNetworkTransportTests = [
        ("testGettingSplitClientNameWithDifferentNames", testGettingSplitClientNameWithDifferentNames),
        ("testGettingSplitClientNameWithTheSameNames", testGettingSplitClientNameWithTheSameNames),
        ("testGettingSplitClientVersionWithDifferentVersions", testGettingSplitClientVersionWithDifferentVersions),
        ("testGettingSplitClientVersionWithTheSameVersions", testGettingSplitClientVersionWithTheSameVersions),
    ]
}

extension StarWarsSubscriptionTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StarWarsSubscriptionTests = [
        ("testConcurrentConnectAndCloseConnection", testConcurrentConnectAndCloseConnection),
        ("testConcurrentSubscribing", testConcurrentSubscribing),
        ("testConcurrentSubscriptionAndConnectionClose", testConcurrentSubscriptionAndConnectionClose),
        ("testConcurrentSubscriptionCancellations", testConcurrentSubscriptionCancellations),
        ("testMultipleSubscriptions", testMultipleSubscriptions),
        ("testSubscribeMultipleReviews", testSubscribeMultipleReviews),
        ("testSubscribeReviewAnyEpisode", testSubscribeReviewAnyEpisode),
        ("testSubscribeReviewDifferentEpisode", testSubscribeReviewDifferentEpisode),
        ("testSubscribeReviewJediEpisode", testSubscribeReviewJediEpisode),
        ("testSubscribeThenCancel", testSubscribeThenCancel),
    ]
}

extension StarWarsWebSocketTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__StarWarsWebSocketTests = [
        ("testCreateReviewForEpisode", testCreateReviewForEpisode),
        ("testDroidDetailsWithFragmentQueryDroid", testDroidDetailsWithFragmentQueryDroid),
        ("testDroidDetailsWithFragmentQueryHuman", testDroidDetailsWithFragmentQueryHuman),
        ("testHeroAndFriendsNamesQuery", testHeroAndFriendsNamesQuery),
        ("testHeroAppearsInQuery", testHeroAppearsInQuery),
        ("testHeroDetailsFragmentConditionalInclusion", testHeroDetailsFragmentConditionalInclusion),
        ("testHeroDetailsInlineConditionalInclusion", testHeroDetailsInlineConditionalInclusion),
        ("testHeroDetailsQueryDroid", testHeroDetailsQueryDroid),
        ("testHeroDetailsQueryHuman", testHeroDetailsQueryHuman),
        ("testHeroDetailsWithFragmentQueryDroid", testHeroDetailsWithFragmentQueryDroid),
        ("testHeroDetailsWithFragmentQueryHuman", testHeroDetailsWithFragmentQueryHuman),
        ("testHeroFriendsOfFriendsNamesQuery", testHeroFriendsOfFriendsNamesQuery),
        ("testHeroNameConditionalBoth", testHeroNameConditionalBoth),
        ("testHeroNameConditionalBothSeparate", testHeroNameConditionalBothSeparate),
        ("testHeroNameConditionalExclusion", testHeroNameConditionalExclusion),
        ("testHeroNameConditionalInclusion", testHeroNameConditionalInclusion),
        ("testHeroNameQuery", testHeroNameQuery),
        ("testHeroNameQueryWithVariable", testHeroNameQueryWithVariable),
        ("testHeroNameTypeSpecificConditionalInclusion", testHeroNameTypeSpecificConditionalInclusion),
        ("testHeroParentTypeDependentFieldDroid", testHeroParentTypeDependentFieldDroid),
        ("testHeroParentTypeDependentFieldHuman", testHeroParentTypeDependentFieldHuman),
        ("testHeroTypeDependentAliasedFieldDroid", testHeroTypeDependentAliasedFieldDroid),
        ("testHeroTypeDependentAliasedFieldHuman", testHeroTypeDependentAliasedFieldHuman),
        ("testHumanQueryWithNullMass", testHumanQueryWithNullMass),
        ("testHumanQueryWithNullResult", testHumanQueryWithNullResult),
        ("testStarshipCoordinates", testStarshipCoordinates),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MockWebSocketTests.__allTests__MockWebSocketTests),
        testCase(SplitNetworkTransportTests.__allTests__SplitNetworkTransportTests),
        testCase(StarWarsSubscriptionTests.__allTests__StarWarsSubscriptionTests),
        testCase(StarWarsWebSocketTests.__allTests__StarWarsWebSocketTests),
    ]
}
#endif
