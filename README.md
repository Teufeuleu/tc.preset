# tc.preset

A [jsui]/[v8ui] replacement for the [preset] object in Cycling'74 Max.

## Features
- Same click + modifier key behavior as the preset object to store and delete presets
- \+ Additional interactions (control+click to rename, shift+control+click to lock/unlock)
- Drag and drop presets to re-organize
- Display presets as a grid or a list
- Scrollable list layout (requires Max 8.6.2)
- Shows active preset even if recalled directly from pattrstorage
- Shows previously active preset, with the ability to ignore preset 0 if it being used as an intermediary step
- Shows presets being interpolated (using recall or recallmulti) - now this feature is available the original preset object too
- Shows preset name and lock state
- Ability to display a dot if the current preset is edited
- Outputs active preset name and lock state from third and fourth outlet
- Ability to rewrite json file automatically every time a preset is stored/moved/deleted/renamed/(un)locked
- Helps keeping in sync a umenu with the list of stored presets
- Provides a dictionary with all presets and their metadata (slot number, name, colors, uid)
- More look customization
- Dynamically adapts to resize both in Edit and Presentation mode
- Select mode: simple click selects the slot, double click recalls it (allows for organizing presets without recalling them)
- Color mode: various ways to colorize preset slots
- UID: generate unique identifiers for each preset so you can "follow" them when they're moved, renamed or re-saved. Practical in case of advanced preset management
...and more!

## How to install
- Go to the Releases page of this repository and download the version you want to use
- Unzip the downloaded file and place the tc.preset folder in your [Max Packages folder](https://docs.cycling74.com/userguide/packages/#packages-folder).
- Restart Max

## How to use
Check "tc.preset Lauch" in the Extras menu of Max and then click "Open Help file" for detailed explanations.

## How to develop tc.preset

- Clone this repository in a folder that is not part of your [Max Search path](https://docs.cycling74.com/userguide/search_path/)
- Do your stuff
- Run `./build.sh`. The script will:
  - create ./dist/Max 8/tc.preset and ./dist/Max 9/tc.preset
  - copy the package files in these two folders depending on their prefix (starting with `max8.` or `max9.` - that prefix being removed during the copy process). Files with no prefix are copied in both folders
  - once the copy is done the script will ask if you want to copy these two folders into the default working directory (~/Documents/Max <8|9>/Packages). Press 'y' to confirm or 'n' to cancel.

Alternatively, instead of relying on this script you can manually remove the files with the prefix you don't want, and remove the prefix from the files you want to work on.

## How to support my work
Consider donating if you like this package.

[![Paypal donation button](https://pics.paypal.com/00/s/YjdhYzU5ZDItYjM0Yi00MGE1LWEzMWEtZGQ2NzVjMDI3MDg2/file.PNG)](https://www.paypal.com/donate/?hosted_button_id=AVGJ5JLTP76K8)

## License
Copyright (C) 2025 Théophile Clet <contact@tflcl.xyz> - https://tflcl.xyz.

GPL-3.0-or-later

See the [license file](./LICENSE).
