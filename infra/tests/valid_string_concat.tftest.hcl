# valid_string_name.tftest.hcl

variables {
  cluster_name = "test-name"
}

run "valid_string_concat" {

  command = plan

  assert {
    condition     = module.ecs.cluster_name == "test-name"
    error_message = "Cluster name did not match expected"
  }

}
