class Itunes
  def playpause
    run_command 'playpause'
  end

  def prev
    run_command 'previous track'
  end

  def next
    run_command 'next track'
  end

  def voldown
    run_command 'set sound volume to sound volume - 10'
  end

  def volup
    run_command 'set sound volume to sound volume + 10'
  end

  def volume
    run_command 'return sound volume'
  end

  def current(attribute)
    run_command "return #{attribute} of current track"
  end

  def launched?
    %x(osascript -e 'tell app "System Events" to count (every process whose name is "itunes")')
  end

  private
  def run_command(command)
    %x(osascript -e 'tell app "itunes" to #{command}')
  end
end
