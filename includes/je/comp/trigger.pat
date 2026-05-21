// trigger — EMTR + ExTR Composite

#pragma once
#pragma endian little

import je.chunk.emtr;
import je.chunk.extr;

namespace auto je::comp {

	struct Trigger {
		EMTR EMTR;
		ExTR ExTR;
	};

}
