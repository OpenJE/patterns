// EMAPc Pattern

namespace auto je {

	struct EMAPc {
		u8   s1_length;
		char s1[ s1_length ];
		u8   s2_length;
		char s2[ s2_length ];
		u8   s3_length;
		char s3[ s3_length ];
		u8   color[ 3 ];
		u8   il;
		u8   le_;
	};

}
