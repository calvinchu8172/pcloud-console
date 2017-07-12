module FieldsHelper
  def field_id(field)
    case field
    when '權限'
      'group_ids'
    else
      field
    end
  end
end

World FieldsHelper
