require "./server_capabilities"

module LSP::Protocol
  struct InitializeResult
    JSON.mapping(
      capabilities: ServerCapabilities
    )

    def initialize
      @capabilities = ServerCapabilities.new
    end
  end
end
