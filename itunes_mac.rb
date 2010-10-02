class Itunes
  def playpause
    do_command 'playpause'
  end

  def prev
    do_command 'previous track'
  end

  def next
    do_command 'next track'
  end

  def voldown
    do_command 'set sound volume to sound volume - 10'
  end

  def volup
    do_command 'set sound volume to sound volume + 10'
  end

  def volume
    do_command 'return sound volume'
  end

  def current(attribute)
    do_command "return #{attribute} of current track"
  end

  def launched?
    %x(osascript -e 'tell app "System Events" to count (every process whose name is "itunes")')
  end

  private
  def do_command(command)
    %x(osascript -e 'tell app "itunes" to #{command}')
  end
end
