// socket pattern

#pragma once
#pragma endian little

using SizedStringu16 = std::string::SizedString<u16>;

namespace auto je::comp {

	struct Socket {
		SizedStringu16 model;
		SizedStringu16 tex;
	};

}
