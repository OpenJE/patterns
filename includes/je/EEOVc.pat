// EEOVc Pattern

#pragma once

import std.string;

using SizedString = std::string::SizedString<u16>;

namespace auto je {

    struct EEOVInventoryEntry {
        u8   length;
        u8   pad;
        char value[ length ];
    };

    struct EEOVc {
        char magic[ 4 ];   // "EEOV"
        u32  flags;
        u32  size;

        SizedString s1;

        padding[ 9 ];      // matches C# jump from 14+s1 to 25+s1
        SizedString s2;

        SizedString s3;

        padding[ 7 ];      // matches C# jump from after s3 to 38+...
        SizedString s4;

        u8 ps4;

        if ( ps4 == 2 ) {
            u8 ps4_extra[ 2 ];
        }

        SizedString s5;

        u32 inv_count;
        EEOVInventoryEntry inv[ inv_count ];
    };

}
