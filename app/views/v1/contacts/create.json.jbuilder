# frozen_string_literal: true

json.data do
  json.contact do
    json.partial! 'v1/contacts/contact', contact: @contact
  end
end
