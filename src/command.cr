abstract class Command
  property! name : String
  property! description : String

  abstract def run

  def to_s(io : IO)
    if name.size >= 33
      io << "    #{name}\n#{" " * 37}#{description}"
    else
      io << "    #{name}#{" " * (33 - name.size)}#{description}"
    end
  end
end
