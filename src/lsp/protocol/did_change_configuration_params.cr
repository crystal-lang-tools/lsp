module LSP::Protocol
  struct DidChangeConfigurationParams
    JSON.mapping({
      settings: JSON::Any,
    }, true)
  end
end
