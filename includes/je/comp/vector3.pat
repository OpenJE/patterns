// Vector3

#pragma once

namespace auto je::comp {

	struct Vector3<T> {
		T x, y, z;
	};

	using Vector3u8   = Vector3<u8>;
	using Vector3u16  = Vector3<u16>;
	using Vector3u32  = Vector3<u32>;
	using Vector3u64  = Vector3<u64>;
	using Vector3u128 = Vector3<u128>;
	using Vector3i8   = Vector3<i8>;
	using Vector3i16  = Vector3<i16>;
	using Vector3i32  = Vector3<i32>;
	using Vector3i64  = Vector3<i64>;
	using Vector3i128 = Vector3<i128>;
	using Vector3f32  = Vector3<float>;
	using Vector3f64  = Vector3<double>;

}
