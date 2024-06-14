# tc.preset

A [jsui] replacement for the [preset] object in Cycling'74 Max, with extra features:
- Drag and drop presets to re-organize
- Display presets as a grid or a list
- Scrollable
- Shows active preset even if recalled directly from pattrstorage
- Shows previously active preset, with the ability to ignore preset 0 if it being used as an intermediary step
- Shows presets being interpolated (using recall or recallmulti)
- Shows preset name and lock state
- Ability to rewrite json file automatically every time a preset is stored/moved/deleted/renamed/(un)locked
- Helps keeping in sync a umenu with the list of stored slotstlet
- More look customization

## How to use
- Place `tc.preset.js` in the same directory as your patch, or somewhere in the Max search path
- Create a [jsui @filename tc.preset.js]. You can either add `@jsarguments` followed by the name of the pattrstorage you want to communicate with, or set that later by sending a `pattrstorage` (followed by the pattrstorage name) message to the [jsui].
- Connect the [pattrstorage] outlet to the [jsui] pattrstorage inlet

## Limitations
- Resize doesn't work in Presentation mode (jsui limitation)
- Some messages should be sent to the pattrstorage, some other to the jsui:
    - `recall`: send to pattrstorage
    - `recallmulti`: send to pattrstorage first, then to the jsui (pattrstorage limitation)
    - `store`: send to jsui 

## Desired features (for someday)
- No need for a patch cord (programmatically create a [send]/[receive] pair?)
- Ability to lock/unlock and rename directly in the jsui without the need of external objects
- Ability to target a [pattrstorage] in a different patcher level