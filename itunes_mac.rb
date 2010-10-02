class Itunes
  def playpause
    tell_to 'playpause'
  end

  def prev
    tell_to 'previous track'
  end

  def next
    tell_to 'next track'
  end

  def voldown
    tell_to 'set sound volume to sound volume - 10'
  end

  def volup
    tell_to 'set sound volume to sound volume + 10'
  end

  def volume
    tell_to 'return sound volume'
  end

  def current(name)
    tell_to "return #{name} of current track"
  end

  def launched?
    %x(osascript -e 'tell app "System Events" to count (every process whose name is "#{name}")')
  end

  def name
    "iTunes"
  end

  private
  def tell_to(command)
    %x(osascript -e 'tell app "#{name}" to #{command}')
  end
end
