module Cairo
  class Win32Surface < Surface
    attr_reader :hdc, :image
  end

  class QuartzSurface < Surface
    attr_reader :cg_context
  end
end
