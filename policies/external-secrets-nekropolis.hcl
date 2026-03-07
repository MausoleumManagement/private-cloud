path "kv/data/nekropolis/*" {
  capabilities = ["read"]
}

path "kv/metadata/nekropolis/*" {
  capabilities = ["list", "read"]
}

path "kv/data/underdark/*" {
  capabilities = ["read"]
}

path "kv/metadata/underdark/*" {
  capabilities = ["list", "read"]
}
