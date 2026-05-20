// Vector2

#pragma once

namespace auto je::comp {

	struct Vector2<T> {
		T x, y;
	};

	using Vector2u8   = Vector2<u8>;
	using Vector2u16  = Vector2<u16>;
	using Vector2u32  = Vector2<u32>;
	using Vector2u64  = Vector2<u64>;
	using Vector2u128 = Vector2<u128>;
	using Vector2i8   = Vector2<i8>;
	using Vector2i16  = Vector2<i16>;
	using Vector2i32  = Vector2<i32>;
	using Vector2i64  = Vector2<i64>;
	using Vector2i128 = Vector2<i128>;
	using Vector2f32  = Vector2<float>;
	using Vector2f64  = Vector2<double>;

}
