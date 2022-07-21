//
//  TestCustomRequestBodyCreator.swift
//  Apollo
//
//  Created by Kim de Vos on 02/10/2019.
//  Copyright © 2019 Apollo GraphQL. All rights reserved.
//

import NewApollo
import NewApolloAPI

struct TestCustomRequestBodyCreator: RequestBodyCreator {

  var stubbedRequestBody: JSONEncodableDictionary = ["TestCustomRequestBodyCreator": "TestBodyValue"]

  func requestBody<Operation: GraphQLOperation>(
    for operation: Operation,
    sendQueryDocument: Bool, autoPersistQuery: Bool
  ) -> JSONEncodableDictionary {
    stubbedRequestBody
  }
}
