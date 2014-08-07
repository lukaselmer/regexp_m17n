module RegexpM17N
  def self.non_empty?(str)
    str = str.force_encoding(Encoding::UTF_8) if str.encoding.dummy?
    str.encode(Encoding::UTF_8) =~ /^.+$/
  end
end