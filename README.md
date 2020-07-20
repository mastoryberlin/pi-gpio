# pi-gpio

Super-comfortable access to a Raspberry Pi's GPIO pins.
In contrast to the `gpio` shard, this one utilizes the WiringPi library
which is available as part of Raspbian/Raspberry Pi OS.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pi-gpio:
       github: mastoryberlin/pi-gpio
   ```

2. Run `shards install`

## Usage

```crystal
require "pi-gpio"

Pi.gpio[3].as_output
pin = Pi.gpio[5]
pin.as_input
while pin.high?
  sleep 50.milliseconds
end
Pi.gpio[3].high
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/mastoryberlin/pi-gpio/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [your-name-here](https://github.com/mastoryberlin) - creator and maintainer
