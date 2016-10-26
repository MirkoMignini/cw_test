require_relative '../../app/console'

class DummyConsole < Console
  def command_files
    Dir[File.expand_path('*.rb', __dir__)]
  end
end
