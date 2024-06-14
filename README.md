# tc.preset

A [jsui] replacement for the [preset] object in Cycling'74 Max.

## Features
- Drag and drop presets to re-organize
- Display presets as a grid or a list
- Scrollable (requires Max 8.6.2)
- Shows active preset even if recalled directly from pattrstorage
- Shows previously active preset, with the ability to ignore preset 0 if it being used as an intermediary step
- Shows presets being interpolated (using recall or recallmulti)
- Shows preset name and lock state
- Outputs active preset name and lock state from third and fourth outlet
- Ability to rewrite json file automatically every time a preset is stored/moved/deleted/renamed/(un)locked
- Helps keeping in sync a umenu with the list of stored slotstlet
- More look customization
- Same click + modifier key behavior as the vanilla object to store or delete presets

## How to use
- Place `tc.preset.js` in the same directory as your patch, or somewhere in the Max search path
- Create a [`jsui @filename tc.preset.js`]. You can either add `@jsarguments` followed by the name of the pattrstorage you want to communicate with, or set that later by sending a `pattrstorage` (followed by the pattrstorage name) message to the [jsui].
- Connect the [pattrstorage] outlet to the [jsui] inlet

## Limitations
- Resize doesn't work in Presentation mode (jsui limitation)
- Due to the way [pattrstorage] works, some pattrstorage-specific messages should be sent to the [jsui] instead of the [pattrstorage]. Some to both: 
    - `recall`, `delete`: send to [pattrstorage] only
    - `recallmulti`, `slotname`: send to [pattrstorage] first (for better timing), then to the [jsui]
    - `store`: send to [jsui] only
- The js program send a lot of message to the [pattrstorage] (patch cord not required), which makes it output a lot of messages required for the [jsui] to stay in sync. Using one of the above messages incorrectly, or sending `getslotlist`, `getslotnamelist`, or any message that will impact the presets, it might cause the [pattrstorage] to get out of sync. In case something like that happens, you can send the `resync` message to the [jsui].


## Desired features (for someday)
- No need for a patch cord (programmatically create a [send]/[receive] pair?)
- Ability to lock/unlock and rename directly in the jsui without the need of external objects
- Ability to target a [pattrstorage] in a different patcher level

## License
GPL-3.0-or-later 

Copyright (C) 2024 Théophile Clet <contact@tflcl.xyz> - https://tflcl.xyz.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

See <https://www.gnu.org/licenses/gpl-3.0.txt>.