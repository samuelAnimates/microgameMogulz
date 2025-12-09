# Clique de Chic: Micro-game Mogulz

An open-source Playdate minigame collection based on a fictional line of fashion dolls from the 2000s.

## Features

This builds off of the "Game Template" project provided in
[the Playdate SDK](https://play.date/dev/) and adds a few nifty features.

### Standardized Structure
This template uses the [recommended folder structure](https://sdk.play.date/1.9.3/Inside%20Playdate.html#_structuring_your_project)
for Playdate games. Empty folders are preserved with an empty `.gitkeep` file
that can be deleted if you'd like.

### Default Callbacks
The Playdate SDK calls a few callbacks based on user interaction, the state of
the device, and other game lifecycle events. Each of these have been implemented
with a default implementation that prints out that each method has been called.

### Nova Features
For folks who use [Nova](https://nova.app), you've got a few extra goodies:
- A Playdate Simulator Task, to easily build & run your game.
- A `.luacheckrc`  file for linting your lua code with the [Luacheck Extension](nova://extension/?id=pro.albright.luacheck&name=Luacheck).

### VSCode Features
Prefer to use [Visual Studio Code](https://code.visualstudio.com)? You get some
goodies too:
- Added Compile, Run, Build and Clean tasks, with a default Build task.
- Updated settings to work with the [lua-language-server extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).

### GitHub `luacheck` Action
This also ships with a GitHub Action that runs [the `luacheck` code linter](https://github.com/lunarmodules/luacheck)
on your code before merging to the `main` branch.

## Credits

Unless otherwise noted below, [Samuel R. Mendez](https://samuelanimates.com) made all code, images, text, and anyother assets associated with this project.

Code:
- Samuel used the Github repo "[Playlate](https://github.com/bedinotti/playlate)" by Vanessa Bedinotti to structure this project.


## License

This is licensed under the MIT License. See [LICENSE.md](LICENSE.md) for more details. Generally: anything you build with this is yours.

This template only works with the Playdate SDK. Make sure you follow the terms
of the [Playdate SDK License](https://play.date/dev/sdk-license) when building
your games.


