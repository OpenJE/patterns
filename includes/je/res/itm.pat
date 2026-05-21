// ITM — Van Buren Item File
#pragma once
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gitm;

namespace auto je::resource {
	struct ITM { EEN2 een2; GENT gent; GITM gitm; };
}
