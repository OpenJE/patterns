// Vector4

#pragma once

namespace auto je {

	struct Vector4<T> {
		T x, y, z, w;
	};

	using Vector4f = Vector4<float>;
	using Vector4d = Vector4<double>;

}
