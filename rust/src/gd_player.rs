use gdnative::api::*;
use gdnative::prelude::*;

/// The Main "class"
#[derive(NativeClass)]
#[inherit(KinematicBody2D)]
#[register_with(Self::register_builder)]
pub struct Player {
  score: u32,
  speed: f32,
  jump_force: f32,
  gravity: f32,
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
      speed: 200 as f32,
      jump_force: 600 as f32,
      gravity: 800 as f32,
      vel: Vector2::new(0.0, 0.0),
      sprite: None,
    }
  }

  // In order to make a method known to Godot, the #[export] attribute has to be used.
  // In Godot script-classes do not actually inherit the parent class.
  // Instead they are "attached" to the parent object, called the "owner".
  // The owner is passed to every single exposed method.
  #[export]
  unsafe fn _ready(&mut self, owner: &KinematicBody2D) {
    if let Some(node) = owner.get_node("Sprite") {
      self.sprite = node.assume_unique().cast::<Sprite>();
    }
    // The `godot_print!` macro works like `println!` but prints to the Godot-editor
    // output tab as well.
    godot_print!("Player is ready!");
    godot_print!("Score is {}", self.score);
  }

  #[export]
  unsafe fn _physics_process(&mut self, owner: &KinematicBody2D, _delta: f32) {
    self.vel.x = 0.0;
    let input = Input::godot_singleton();

    // reading left/right input
    if input.is_action_pressed("move_left") {
      godot_print!("Moving Left");
      self.vel.x -= self.speed;
    } else if input.is_action_pressed("move_right") {
      godot_print!("Moving Right");
      self.vel.x += self.speed;
    }

    // applying the velocity
    self.vel = owner.move_and_slide(
      self.vel,
      Vector2::new(0.0, 1.0),
      false,
      4,
      1.0,
      true,
    );

    // jump input
    if input.is_action_just_pressed("jump") && owner.is_on_floor() {
      // if input.is_action_just_pressed("jump") {
      godot_print!("Jumping!");
      // self.vel.y = -self.jump_force;
      self.vel.y -= self.jump_force;
    }

    // gravity
    self.vel.y += self.gravity;

    // Sprite direction
    if let Some(sprite) = &self.sprite {
      if self.vel.x < 0.0 {
        sprite.set_flip_h(true);
      } else if self.vel.x > 0.0 {
        sprite.set_flip_h(false);
      }
    }
  }

  // This function will be called in every frame
  #[export]
  unsafe fn _process(&self, _owner: &KinematicBody2D, _delta: f64) {
    // godot_print!("Inside {} _process(), delta is {}", self.name, delta);
  }
}
