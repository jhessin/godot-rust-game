mod gd_main;
mod gd_player;

use gdnative::prelude::{godot_init, InitHandle};

// Function that registers all exposed classes to Godot
fn init(handle: InitHandle) {
  handle.add_class::<gd_main::Main>();
  handle.add_class::<gd_player::Player>();
}

// macros that create the entry-points of the dynamic library.
godot_init!(init);
