# Bindings to the WiringPi library, wrapped into more Crystal convenient names.
@[Link("wiringPi")]
lib WiringPi
  fun setup     = wiringPiSetupGpio() : LibC::Int
  fun set_mode  = pinMode(pin : LibC::Int, mode : LibC::Int) : Void
  fun write     = digitalWrite(pin : LibC::Int, value : LibC::Int) : Void
  fun read      = digitalRead(pin : LibC::Int) : LibC::Int
  fun observe   = wiringPiISR(pin : LibC::Int, edge_type : LibC::Int,  function : -> Void) : LibC::Int

  INPUT                  = 0
  OUTPUT                 = 1
  PWM_OUTPUT             = 2
  GPIO_CLOCK             = 3
  SOFT_PWM_OUTPUT        = 4
  SOFT_TONE_OUTPUT       = 5
  PWM_TONE_OUTPUT        = 6

  INT_EDGE_SETUP         = 0
  INT_EDGE_FALLING       = 1
  INT_EDGE_RISING        = 2
  INT_EDGE_BOTH          = 3

  LOW                    = 0
  HIGH                   = 1
end
