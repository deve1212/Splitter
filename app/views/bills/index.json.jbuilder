json.array!(@bills) do |bill|
  json.extract! bill, :id, :event, :entry_date, :location, :total_amount
  json.url bill_url(bill, format: :json)
end
