require "./bindings"

WiringPi.setup

module Pi
  extend self

  # =======================================================================================
  # Nested struct
  # =======================================================================================

  struct GPIOPin

    # =======================================================================================
    # Enums
    # =======================================================================================

    enum Mode
      Input = 0
      Output = 1
      Undefined = -1
    end

    # ---------------------------------------------------------------------------------------

    enum State
      Low = 0
      High = 1
    end

    # =======================================================================================
    # Properties
    # =======================================================================================

    # The operation mode of this GPIO pin.
    # Initially set as `Undefined`, this property must be set to any
    # of the other available `Mode`s prior to access.
    property mode = Mode::Undefined
    def mode=(m : Mode)
      if m.undefined?
        raise ArgumentError.new "Cannot set GPIO pin to mode 'Undefined'"
      else
        @mode = m
        WiringPi.set_mode @number, m.value
      end
    end

    # ---------------------------------------------------------------------------------------

    # Configures this GPIO pin for input.
    # This is a shortcut for `self.mode = Mode::Input`.
    def as_input
      self.mode=(Mode::Input)
    end

    # ---------------------------------------------------------------------------------------

    # Configures this GPIO pin for output.
    # This is a shortcut for `self.mode = Mode::Output`.
    def as_output
      self.mode=(Mode::Output)
    end

    # ---------------------------------------------------------------------------------------

    # The current voltage at this GPIO pin: Either `High` (3.3V) or `Low` (0V).
    def state
      unless @mode.input?
        raise "Cannot read state: GPIO pin #{@number} is not configured for input"
      else
        State.new WiringPi.read @number
      end
    end

    # :ditto
    def state=(value)
      unless @mode.output?
        raise "Cannot write state: GPIO pin #{@number} is not configured for output"
      else
        WiringPi.write @number, value
      end
    end

    # ---------------------------------------------------------------------------------------

    # Checks whether this GPIO pin is on 'Low' voltage.
    # This is a shortcut for `self.state.low?`.
    delegate low?, to: state

    # ---------------------------------------------------------------------------------------

    # Sets this GPIO pin to 'Low' voltage.
    # This is a shortcut for `self.state = State::Low`.
    def low!
      self.state=(State::Low)
    end

    # ---------------------------------------------------------------------------------------

    # Checks whether this GPIO pin is on 'High' voltage.
    # This is a shortcut for `self.state.high?`.
    delegate high?, to: state

    # ---------------------------------------------------------------------------------------

    # Sets this GPIO pin to 'High' voltage.
    # This is a shortcut for `self.state = State::High`.
    def high!
      self.state=(State::High)
    end

    # =======================================================================================
    # Constructor
    # =======================================================================================

    def initialize(@number : Int32)
    end
  end

  # =======================================================================================
  # Class properties
  # =======================================================================================

  class_getter gpio = StaticArray(GPIOPin, 27).new { |i| GPIOPin.new(i) }

end
