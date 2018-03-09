require "./versioned_text_document_identifier"
require "./text_document_content_change_event"

module LSP::Protocol
  struct DidChangeTextDocumentParams
    JSON.mapping({
      text_document:   {type: VersionedTextDocumentIdentifier, key: "textDocument"},
      content_changes: {type: Array(TextDocumentContentChangeEvent), key: "contentChanges"},
    }, true)
  end
end
