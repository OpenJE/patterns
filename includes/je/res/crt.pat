// CRT — Van Buren Creature/Character File
#pragma once
#pragma endian little

import je.chunk.een2;
import je.chunk.gent;
import je.chunk.gcre;
import je.chunk.gchr;

namespace auto je::resource {
	struct CRT { EEN2 een2; GENT gent; GCRE gcre; GCHR gchr; };
}
