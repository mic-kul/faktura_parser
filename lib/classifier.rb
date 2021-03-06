class Classifier
  attr_accessor :text

  #Should be generated on run-time
  RULES =
  {
    /OVH Sp. z o.o./ => 'Ovh',
    /P4 Sp. z o.o./ => 'Play',
  }
  def initialize(text)
    @text = text
  end

  def parser
    RULES.each do |regexp, sym|
      return parser_obj(sym) if regexp.match(text)
    end
  end

  def parser_obj(sym)
    clazz = Object.const_get("Parser::#{sym}Parser")
    clazz.new(text)
  end
end
