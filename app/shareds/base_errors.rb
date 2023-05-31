# frozen_string_literal: true

module BaseErrors
  def message_fail(prefix: 'activerecord', sufix: nil, args: nil)
    I18n.t("#{prefix}.errors.messages.#{sufix}", args:)
  end

  def add_errors(attribute, sufix)
    errors.add(attribute, message_fail(sufix:))
  end
end
