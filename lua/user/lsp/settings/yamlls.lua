local schemas = {
  -- Kedro
  ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",

  -- Github Workflow
  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",

  -- OpenAPI
  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "docs/*api*/*",

  -- CloudFormation
  ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = ".cloudformation/*",

  -- Kubevela
  ["https://raw.githubusercontent.com/oam-dev/kubevela/master/docs/apidoc/swagger.json"] = "_vela/*",

  -- Fly.io
  ["https://json.schemastore.org/fly.json"] = "_flyio/*",

  -- Kubernetes
  -- ["https://raw.githubusercontent.com/louygan/kubernetes-json-schema_yannh/master/v1.24.0/all.json"] = "_k8s/*",

}

return {
  settings = {
    yaml = {
      schemas = schemas
    }
  }
}
