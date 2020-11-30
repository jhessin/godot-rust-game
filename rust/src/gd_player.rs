use gdnative::api::*;
use gdnative::prelude::*;

/// The Main "class"
#[derive(NativeClass)]
#[inherit(KinematicBody2D)]
#[register_with(Self::register_builder)]
pub struct Player {
  score: u32,
  speed: i32,
  jump_force: u32,
  gravity: i32,
  vel: Vector2,
  sprite: Option<Ref<Sprite, Unique>>,
}

// __One__ `impl` block can have the `#[methods]` attribute, which will generate
// code to automatically bind any exported methods to Godot.
#[methods]
impl Player {
  // Register the builder for methods, properties and/or signals.
  fn register_builder(_builder: &ClassBuilder<Self>) {
    godot_print!("Player builder is registered!");
  }

  /// The "constructor" of the class.
  fn new(_owner: &KinematicBody2D) -> Self {
    godot_print!("Player is created!");
    Player {
      score: 0,
      speed: 200,
      jump_force: 600,
      gravity: 800,
      vel: Vector2::new(0.0, 0.0),
      sprite: None,
      // sprite: _owner.get_node("./Sprite").unwrap().try_to_object(),
    }
  }

  // In order to make a method known to Godot, the #[export] attribute has to be used.
  // In Godot script-classes do not actually inherit the parent class.
  // Instead they are "attached" to the parent object, called the "owner".
  // The owner is passed to every single exposed method.
  #[export]
  unsafe fn _ready(&mut self, _owner: &KinematicBody2D) {
    if let Some(node) = _owner.get_node("Sprite") {
      self.sprite = node.assume_unique().cast::<Sprite>();
    }
    // The `godot_print!` macro works like `println!` but prints to the Godot-editor
    // output tab as well.
    godot_print!("Player is ready!");
    godot_print!("Score is {}", self.score);
  }

  // This function will be called in every frame
  #[export]
  unsafe fn _process(&self, _owner: &KinematicBody2D, _delta: f64) {
    // godot_print!("Inside {} _process(), delta is {}", self.name, delta);
  }
}
