module Cairo
  class Win32Surface < Surface
    attr_reader :initialize, :hdc, :image
  end

  class Win32PrintingSurface < Surface
    attr_reader :initialize, :hdc
  end

  class QuartzSurface < Surface
    attr_reader :initialize, :cg_context
  end

  class QuartzImageSurface < Surface
    attr_reader :initialize, :image
  end
end
