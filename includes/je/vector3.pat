// Vector3

#pragma once

namespace auto je {

	struct Vector3<T> {
		T x, y, z;
	};

	using Vector3f = Vector3<float>;
	using Vector3d = Vector3<double>;

}
