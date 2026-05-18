// socket pattern

#pragma once

namespace auto je {

	struct Socket {
		u8   model_length;
		char model[ model_length ];
		u8   tex_length;
		char tex[ tex_length ];
	};

}
