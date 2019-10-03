module LSP::Protocol
  struct InitializeResult
    JSON.mapping(
      capabilities: ServerCapabilities
    )

    def initialize(@capabilities)
    end
  end
end
