// GITM

#pragma once
#pragma auther OpenJE
#pragma description Jefferson Engine GITM Chunk
#pragma endian little

import type.byte;

import je.comp.socket;

using Byte = type::Byte;

namespace auto je::chunk {

	struct GITM : je::comp::Chunk<"GITM"> {
		s32    type;
		Byte   [ 4 ];  // gap after type (4 bytes)
		u8     equip;
		Byte   [ 3 ];  // gap after equip (3 bytes)
		s32    eqslot;
		Socket Hea;
		u8     hHai;
		u8     hBea;
		u8     hMus;
		u8     hEye;
		u8     hPon;
		u8     hVan;
		Byte   [ 3 ];  // gap after h flags (3 bytes)
		u8     constant_41;  // sentinel at offset 41 + HeaLen: 0x41
		Byte   [ 4 ];  // gap (4 bytes)
		u8     constant_46;  // sentinel at offset 46 + HeaLen: 0x41
		Byte   [ 4 ];  // gap (4 bytes)
		u8     constant_51;  // sentinel at offset 51 + HeaLen: 0x41
		Socket Eye;
		u8     constant_after_eye_a;  // sentinel after Eye: 0x41
		Byte   [ 4 ];  // gap (4 bytes)
		u8     constant_after_eye_b;  // sentinel after gap: 0x41
		Socket Bod;
		Socket Bac;
		Socket Han;
		Socket Fee;
		Socket Sho;
		Socket Van;
		u8     constant_before_ihs;  // sentinel before IHS: 0x41
		Socket IHS;
		s32    reload;
	};

}
