// trigger — EMTR + ExTR Composite

#pragma once

import je.EMTRc;
import je.ExTRc;

namespace auto je::comp {

	struct Trigger {
		EMTRc EMTR;
		ExTRc ExTR;
	};

}
