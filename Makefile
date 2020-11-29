build-debug:
	# make build-aarch64-linux-android-debug
	# make build-armv7-linux-androideabi-debug
	# make build-i686-linux-android-debug
	# make build-x86_64-linux-android-debug
	# make build-i686-unknown-linux-gnu-debug
	# make build-x86_64-unknown-linux-gnu-debug

build-release:
	# make build-aarch64-linux-android-release
	# make build-armv7-linux-androideabi-release
	# make build-i686-linux-android-release
	# make build-x86_64-linux-android-release
	# make build-i686-unknown-linux-gnu-release
	# make build-x86_64-unknown-linux-gnu-release

export-debug:
	# make export-aarch64-linux-android-debug
	# make export-armv7-linux-androideabi-debug
	# make export-i686-linux-android-debug
	# make export-x86_64-linux-android-debug
	# make export-i686-unknown-linux-gnu-debug
	# make export-x86_64-unknown-linux-gnu-debug

export-release:
	# make export-aarch64-linux-android-release
	# make export-armv7-linux-androideabi-release
	# make export-i686-linux-android-release
	# make export-x86_64-linux-android-release
	# make export-i686-unknown-linux-gnu-release
	# make export-x86_64-unknown-linux-gnu-release

build-aarch64-linux-android-debug:
	cargo build --target aarch64-linux-android
	mv -b ./target/aarch64-linux-android/debug/*.so ./lib/aarch64-linux-android

export-aarch64-linux-android-debug: clean build-aarch64-linux-android-debug
	cd godot/ ; godot --export-debug "Android.aarch64-linux-android.debug" ../bin/aarch64-linux-android/godot-rust-game.debug.aarch64-linux-android.apk

build-aarch64-linux-android-release:
	cargo build --target aarch64-linux-android --release
	mv -b ./target/aarch64-linux-android/release/*.so ./lib/aarch64-linux-android

export-aarch64-linux-android-release: clean build-aarch64-linux-android-release
	cd godot/ ; godot --export "Android.aarch64-linux-android.release" ../bin/aarch64-linux-android/godot-rust-game.release.aarch64-linux-android.apk

build-armv7-linux-androideabi-debug:
	cargo build --target armv7-linux-androideabi
	mv -b ./target/armv7-linux-androideabi/debug/*.so ./lib/armv7-linux-androideabi

export-armv7-linux-androideabi-debug: clean build-armv7-linux-androideabi-debug
	cd godot/ ; godot --export-debug "Android.armv7-linux-androideabi.debug" ../bin/armv7-linux-androideabi/godot-rust-game.debug.armv7-linux-androideabi.apk

build-armv7-linux-androideabi-release:
	cargo build --target armv7-linux-androideabi --release
	mv -b ./target/armv7-linux-androideabi/release/*.so ./lib/armv7-linux-androideabi

export-armv7-linux-androideabi-release: clean build-armv7-linux-androideabi-release
	cd godot/ ; godot --export "Android.armv7-linux-androideabi.release" ../bin/armv7-linux-androideabi/godot-rust-game.release.armv7-linux-androideabi.apk

build-i686-linux-android-debug:
	cargo build --target i686-linux-android
	mv -b ./target/i686-linux-android/debug/*.so ./lib/i686-linux-android

export-i686-linux-android-debug: clean build-i686-linux-android-debug
	cd godot/ ; godot --export-debug "Android.i686-linux-android.debug" ../bin/i686-linux-android/godot-rust-game.debug.i686-linux-android.apk

build-i686-linux-android-release:
	cargo build --target i686-linux-android --release
	mv -b ./target/i686-linux-android/release/*.so ./lib/i686-linux-android

export-i686-linux-android-release: clean build-i686-linux-android-release
	cd godot/ ; godot --export "Android.i686-linux-android.release" ../bin/i686-linux-android/godot-rust-game.release.i686-linux-android.apk

build-x86_64-linux-android-debug:
	cargo build --target x86_64-linux-android
	mv -b ./target/x86_64-linux-android/debug/*.so ./lib/x86_64-linux-android

export-x86_64-linux-android-debug: clean build-x86_64-linux-android-debug
	cd godot/ ; godot --export-debug "Android.x86_64-linux-android.debug" ../bin/x86_64-linux-android/godot-rust-game.debug.x86_64-linux-android.apk

build-x86_64-linux-android-release:
	cargo build --target x86_64-linux-android --release
	mv -b ./target/x86_64-linux-android/release/*.so ./lib/x86_64-linux-android

export-x86_64-linux-android-release: clean build-x86_64-linux-android-release
	cd godot/ ; godot --export "Android.x86_64-linux-android.release" ../bin/x86_64-linux-android/godot-rust-game.release.x86_64-linux-android.apk

build-i686-unknown-linux-gnu-debug:
	cargo build --target i686-unknown-linux-gnu
	mv -b ./target/i686-unknown-linux-gnu/debug/*.so ./lib/i686-unknown-linux-gnu

export-i686-unknown-linux-gnu-debug: clean build-i686-unknown-linux-gnu-debug
	cd godot/ ; godot --export-debug "Linux/X11.i686-unknown-linux-gnu.debug" ../bin/i686-unknown-linux-gnu/godot-rust-game.debug.i686-unknown-linux-gnu

build-i686-unknown-linux-gnu-release:
	cargo build --target i686-unknown-linux-gnu --release
	mv -b ./target/i686-unknown-linux-gnu/release/*.so ./lib/i686-unknown-linux-gnu

export-i686-unknown-linux-gnu-release: clean build-i686-unknown-linux-gnu-release
	cd godot/ ; godot --export "Linux/X11.i686-unknown-linux-gnu.release" ../bin/i686-unknown-linux-gnu/godot-rust-game.release.i686-unknown-linux-gnu

build-x86_64-unknown-linux-gnu-debug:
	cargo build --target x86_64-unknown-linux-gnu
	mv -b ./target/x86_64-unknown-linux-gnu/debug/*.so ./lib/x86_64-unknown-linux-gnu

export-x86_64-unknown-linux-gnu-debug: clean build-x86_64-unknown-linux-gnu-debug
	cd godot/ ; godot --export-debug "Linux/X11.x86_64-unknown-linux-gnu.debug" ../bin/x86_64-unknown-linux-gnu/godot-rust-game.debug.x86_64-unknown-linux-gnu

build-x86_64-unknown-linux-gnu-release:
	cargo build --target x86_64-unknown-linux-gnu --release
	mv -b ./target/x86_64-unknown-linux-gnu/release/*.so ./lib/x86_64-unknown-linux-gnu

export-x86_64-unknown-linux-gnu-release: clean build-x86_64-unknown-linux-gnu-release
	cd godot/ ; godot --export "Linux/X11.x86_64-unknown-linux-gnu.release" ../bin/x86_64-unknown-linux-gnu/godot-rust-game.release.x86_64-unknown-linux-gnu

audit:
	cargo-audit audit

check: clean
	cargo check

clean:
	cargo clean

create-debug-keystore:
	keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore godot-rust-game.debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999 -deststoretype pkcs12

create-release-keystore:
	keytool -v -genkey -v -keystore godot-rust-game.release.keystore -alias godot-rust-game -keyalg RSA -validity 10000

doc: clean
	cargo doc --no-deps --open -v

edit:
	# ${EDITOR} rust/src/lib.rs &
	godot --path godot/ -e &

run:
	# make build-x86_64-unknown-linux-gnu-debug
	cargo build
	mv ./target/debug/*.dylib ./lib
	godot --path godot/ -d

watch:
	cargo watch -x build -s 'mv ./target/debug/*.* ./lib'

shell:
	nix-shell --pure

test: clean
	cargo test
