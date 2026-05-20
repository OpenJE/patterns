// GCREc Pattern — Creature Record
#pragma once
import std.mem;
import std.string;
using SizedString = std::string::SizedString<u16>;
import je.chunk.gwam;
import je.comp.skill;
import je.comp.socket;

namespace auto je::chunk {

	struct GCRE : je::comp::Chunk<"GCRE"> {
		s32    Special[7];
		std::mem::Bytes<16> unknown_40_55;
		s32    Age;
		std::mem::Bytes<12> unknown_60_71;
		s32    skills_count;
		Skill  Skills[skills_count];
		s32    traits_count;
		s32    Traits[traits_count];
		s32    tag_skills_count;
		s32    TagSkills[tag_skills_count];
		SizedString port_str;
		std::mem::Bytes<35> unknown_before_sockets;
		Socket Hea;
		Socket Hai;
		Socket Pon;
		Socket Mus;
		Socket Bea;
		Socket Eye;
		Socket Bod;
		Socket Han;
		Socket Fee;
		Socket Bac;
		Socket Sho;
		Socket Van;
		s32    gwam_count;
		std::mem::Bytes<80> unknown_reserved_193_272;
		s32    inventory_count;
		SizedString inventory[inventory_count];
		GWAM   gwam[gwam_count];
	};

}
