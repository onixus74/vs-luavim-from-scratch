local schemas = {

  -- Kubernetes
  ["kubernetes"] = "infra*/**/*",

  -- Kedro
  ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",

  -- Github Workflow
  ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",

  -- Swagger 2.0
  -- ["https://json.schemastore.org/swagger-2.0.json"] = "docs/*api*/**/*",

  -- OpenAPI 3.0
  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "docs/*api*/**/*",

  -- CloudFormation
  ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = ".cloudformation/*",

  -- Kubevela
  ["https://raw.githubusercontent.com/oam-dev/kubevela/master/docs/apidoc/swagger.json"] = "/*vela/**/*",

  -- Fly.io
  ["https://json.schemastore.org/fly.json"] = "*fly/**/*"
}

return {
  settings = {
    yaml = {
      schemas = schemas
      -- schemas = require('schemastore').json.schemas(),
      -- format = { enable = true },
      -- validate = { enable = true }
    }
  }
}
