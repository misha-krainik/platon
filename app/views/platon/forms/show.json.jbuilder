json.form do
  json.url @service.form_prop[:url]
  json.method @service.form_prop[:method]

  json.fields @service.fields do |field|
    unless field[:value].nil?
      json.type field[:type]
      json.name field[:name]
      json.value field[:value]
    end
  end
end