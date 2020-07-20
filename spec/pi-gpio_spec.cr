require "./spec_helper"

describe Pi do
  it "provides the class-level gpio property: a static array with the 27 GPIO pins as elements" do
    Pi.gpio.should be_a StaticArray(Pi::GPIOPin, 27)
  end

  describe "GPIOPin" do
    i, o = Pi.gpio[2], Pi.gpio[3]

    describe "mode" do
      it "sets the GPIO's mode to either input or output" do
        i.as_input
        i.mode.input?.should be_true
        o.as_output
        o.mode.output?.should be_true
      end
    end
  end
end
