json.array! @core_words do |item|
  json.extract! item, :id, :expression, :meaning, :audio, :image, :iknowid, :iknowtype
end