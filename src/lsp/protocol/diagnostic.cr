module LSP::Protocol
  enum DiagnosticSeverity
    Error       = 1
    Warning     = 2
    Information = 3
    Hint        = 4
  end

  # Represents a diagnostic, such as a compiler error or warning.
  # Diagnostic objects are only valid in the scope of a resource.
  # See: https://github.com/Microsoft/language-server-protocol/blob/master/protocol.md#diagnostic
  struct Diagnostic
    JSON.mapping({
      range:    Range,
      severity: Int32,
      source:   String,
      message:  String,
    }, true)

    @filename = ""

    # `uri` and `@filename` aren't part of Diagnostic interface of LSP,
    # however They're useful to group failures by file.
    def uri
      if @filename.starts_with?("untitled:")
        @filename
      else
        "file://#{@filename}"
      end
    end

    def initialize(file : String, line : Int32 | Nil, column : Int32 | Nil, size : Int32 | Nil, @message : String, @source : String)
      @filename = file
      line = line || 0
      size = size || 1
      @range = Range.new(
        Position.new(line - 1, column - 1),
        Position.new(line - 1, column + size - 1)
      )
      @severity = DiagnosticSeverity::Error.value
    end
  end
end
