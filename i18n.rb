def _(msg_id)
  MESSAGE[msg_id] || msg_id
end

def load_message(lang)
  begin
    require lang
  rescue LoadError
    Object.const_set(:MESSAGE, {})
  end
end
