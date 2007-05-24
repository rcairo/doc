class Module
  def class?
    false
  end
end

class Class
  def class?
    true
  end
end

module RDLib
  module_function
  def klass_to_page_name(klass)
    klass.inspect.split(/::/).collect do |component|
      component.split(/([A-Z][^A-Z]+|[A-Z]+(?=[A-Z][^A-Z]))/).reject do |sub|
        sub.empty?
      end.join("-").downcase
    end.join("-") + ".rd"
  end

  def class_link(klass)
    link = "#{klass_to_page_name(klass)}/"
    link << (klass.class? ? "class" : "module")
    link << " #{klass.inspect}"
    "((<#{klass.inspect}|#{link}>))"
  end

  def constant_link(klass, name)
    "((<#{klass.inspect}::#{name}|#{klass_to_page_name(klass)}/#{name}>))"
  end

  def class_method_link(klass, name)
    link = "#{klass_to_page_name(klass)}/#{klass.inspect}.#{name}"
    "((<#{klass.inspect}.#{name}|#{link}>))"
  end

  def instance_method_link(klass, name)
    link = "#{klass_to_page_name(klass)}/#{name}"
    "((<#{klass.inspect}##{name}|#{link}>))"
  end

  def index_link(label=nil)
    label ||= "Index"
    "((<#{label}|index.rd/#{label}>))"
  end
end
