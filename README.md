# builder-presets

The era presets of the scenery importer's builders - Godot addon `addons/builder_presets`, plain
GDScript.

A preset maps what a world's description says of an element (a platform, a level crossing, a
signal of a kind, a fence type, a road's junction) to what it is built with in an era: the models,
the textures, the cross-sections and the parameters (a platform's height, a catenary's contact
height). The importer's stage 2 builds a world's sectors from its description by the preset and
year the world picks.

- The class of a preset is this addon's.
- The presets themselves are resources of the world assets project
  (`MaSzyna-Reloaded/world-assets`), exported with its packs.

A repository using it has it as a submodule (`vendor/builder-presets`) with
`addons/builder_presets` linked to `vendor/builder-presets/addons/builder_presets`: the scenery
importer (reads the presets) and the world assets project (edits them).
