Feature: An authorized client can authenticate as a permitted role

  Scenario: Authenticate as a Pod.
    Given I login to authn-k8s as "pod/inventory-pod"
    Then I can authenticate with authn-k8s as "pod/inventory-pod"

  Scenario: Authenticate as a Namespace.
    Given I can login to pod matching "app=inventory-pod" to authn-k8s as "*/*"
    Then I can authenticate pod matching "pod/inventory-pod" with authn-k8s as "*/*"

  Scenario: Authenticate as a ServiceAccount.
    Given I can login to pod matching "app=inventory-pod" to authn-k8s as "service_account/inventory-pod-only"
    Then I can authenticate pod matching "pod/inventory-pod" with authn-k8s as "service_account/inventory-pod-only"

  @k8s_1.3_skip
  Scenario: Authenticate as a Deployment.
    Given I login to authn-k8s as "deployment/inventory-deployment"
    Then I can authenticate with authn-k8s as "deployment/inventory-deployment"

  @k8s_1.3_skip
  Scenario: Authenticate as a StatefulSet.
    Given I login to authn-k8s as "stateful_set/inventory-stateful"
    Then I can authenticate with authn-k8s as "stateful_set/inventory-stateful"
