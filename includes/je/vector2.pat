// Vector2

#pragma once

namespace auto je {

	struct Vector2<T> {
		T x, y;
	};

	using Vector2f = Vector2<float>;
	using Vector2d = Vector2<double>;

}
