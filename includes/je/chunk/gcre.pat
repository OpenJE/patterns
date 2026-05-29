// GCREc Pattern — Creature Record

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GCRE Chunk
#pragma endian little

import std.string;
import type.byte;

import je.chunk.gwam;
import je.comp.skill;
import je.comp.socket;
import je.comp.special;

using String = std::string::SizedString<u16>;
using Byte   = type::Byte;

namespace auto je::chunk {

	struct GCRE : je::comp::Chunk<"GCRE"> {
		je::comp::Special special;
		Byte              [ 16 ];
		s32               Age;
		Byte              [ 12 ];
		s32               skills_count;
		Skill             Skills[ skills_count ];
		s32               traits_count;
		s32               Traits[ traits_count ];
		s32               tag_skills_count;
		s32               TagSkills[ tag_skills_count ];
		String            port_str;
		Byte              [35];
		Socket            Hea;
		Socket            Hai;
		Socket            Pon;
		Socket            Mus;
		Socket            Bea;
		Socket            Eye;
		Socket            Bod;
		Socket            Han;
		Socket            Fee;
		Socket            Bac;
		Socket            Sho;
		Socket            Van;
		s32               gwam_count;
		Byte              [ 80 ];
		s32               inventory_count;
		String            inventory[ inventory_count ];
		GWAM              gwam[ gwam_count ];
	};

}
