	.include "MPlayDef.s"

	.equ	accum8_grp, voicegroup000
	.equ	accum8_pri, 0
	.equ	accum8_rev, 0
	.equ	accum8_mvl, 127
	.equ	accum8_key, 0
	.equ	accum8_tbs, 1
	.equ	accum8_exg, 0
	.equ	accum8_cmp, 1

	.section .rodata
	.global	accum8
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

accum8_1:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 120*accum8_tbs/2
	.byte		VOICE , 73
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N05   , Gs4 , v116
	.byte	W06
	.byte		        An4 , v112
	.byte	W06
	.byte		        Bn4 , v120
	.byte	W06
	.byte		N02   , An4 , v116
	.byte	W12
	.byte		N17   , Gs4 , v120
	.byte	W18
	.byte		N05   , En4 , v112
	.byte	W12
	.byte		N17   , Cs4 , v120
	.byte	W36
@ 001   ----------------------------------------
	.byte		N05   , En4 , v116
	.byte	W12
	.byte		N11   , Cs4 , v120
	.byte	W18
	.byte		N17   , Cs4 , v116
	.byte	W18
	.byte		N04   , En4 , v108
	.byte	W09
	.byte		N02   , Gs4 , v116
	.byte	W03
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v116
	.byte	W12
	.byte		N11   , Fs4 , v124
	.byte	W12
@ 002   ----------------------------------------
accum8_1_002:
	.byte		N05   , Ds4 , v116
	.byte	W10
	.byte		N02   , Ds4 , v108
	.byte	W02
	.byte		N04   , En4 , v124
	.byte	W18
	.byte		        En4 , v120
	.byte	W18
	.byte		        En4 , v124
	.byte	W48
	.byte	PEND
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte		N05   , Gs4 , v116
	.byte	W06
	.byte		        An4 , v112
	.byte	W06
	.byte		        Bn4 , v120
	.byte	W06
	.byte		N02   , An4 , v116
	.byte	W12
	.byte		N17   , Gs4 , v120
	.byte	W18
	.byte		N05   , En4 , v112
	.byte	W12
	.byte		N17   , Cs4 , v120
	.byte	W36
@ 005   ----------------------------------------
	.byte		N05   , En4 , v116
	.byte	W12
	.byte		N11   , Cs4 , v120
	.byte	W18
	.byte		N17   , Cs4 , v116
	.byte	W18
	.byte		N05   , En4 , v108
	.byte	W09
	.byte		        Gs4 
	.byte	W03
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v116
	.byte	W12
	.byte		N11   , Fs4 , v124
	.byte	W12
@ 006   ----------------------------------------
	.byte	PATT
	 .word	accum8_1_002
@ 007   ----------------------------------------
	.byte	W06
	.byte		N01   , Bn4 , v096
	.byte	W02
	.byte		        Cs5 , v084
	.byte	W02
	.byte		        Ds5 , v100
	.byte	W02
	.byte		N04   , En5 , v104
	.byte	W18
	.byte		        En5 , v100
	.byte	W18
	.byte		        En5 , v104
	.byte	W44
	.byte	W02
	.byte		N12   , Ds4 , v112
	.byte	W02
accum8_1_B1:
@ 008   ----------------------------------------
	.byte		N11   , En4 , v120
	.byte	W12
	.byte		N32   , Cs4 
	.byte	W36
	.byte		N02   , En4 
	.byte	W06
	.byte		N17   , Bn4 
	.byte	W18
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v120
	.byte	W12
@ 009   ----------------------------------------
	.byte		N11   , Bn4 
	.byte	W12
	.byte		N22   , Gs4 
	.byte	W24
	.byte		N11   , En4 , v124
	.byte	W12
	.byte		N02   , Fs4 , v120
	.byte	W06
	.byte		N32   , En4 , v124
	.byte	W18
	.byte	W24
@ 010   ----------------------------------------
	.byte		N11   , Dn4 , v120
	.byte	W12
	.byte		N22   , Cs4 , v116
	.byte	W24
	.byte		N11   , Ds4 , v120
	.byte	W12
	.byte		N02   , En4 , v116
	.byte	W06
	.byte		N17   , Cn4 , v124
	.byte	W18
	.byte		N11   , Ds4 , v116
	.byte	W12
	.byte		        En4 , v124
	.byte	W12
@ 011   ----------------------------------------
	.byte		N05   , Fs4 , v116
	.byte	W12
	.byte		N22   , Fs4 , v124
	.byte	W24
	.byte		N11   , En4 , v120
	.byte	W12
	.byte		N02   , Fs4 , v112
	.byte	W06
	.byte		N36   , Gs4 , v120
	.byte	W18
	.byte	W24
@ 012   ----------------------------------------
	.byte	W12
	.byte		N22   , En4 , v124
	.byte	W24
	.byte		N11   , Cs4 , v120
	.byte	W12
	.byte		N02   , En4 , v116
	.byte	W06
	.byte		N17   , Bn4 , v120
	.byte	W18
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v120
	.byte	W12
@ 013   ----------------------------------------
	.byte		N11   , En5 , v124
	.byte	W12
	.byte		        Ds5 , v116
	.byte	W12
	.byte		N05   , Bn4 , v120
	.byte	W12
	.byte		N11   , Gs4 
	.byte	W12
	.byte		N02   , Bn4 
	.byte	W06
	.byte		N32   , En4 
	.byte	W18
	.byte	W24
@ 014   ----------------------------------------
	.byte		N11   , Dn4 
	.byte	W12
	.byte		N32   , Cs4 , v116
	.byte	W36
	.byte		N05   , En4 , v120
	.byte	W09
	.byte		N02   , Ds4 
	.byte	W03
	.byte		N22   , En4 
	.byte	W24
	.byte		        Fs4 
	.byte	W12
@ 015   ----------------------------------------
	.byte	W12
	.byte		N68   , En4 
	.byte	W36
	.byte	W48
@ 016   ----------------------------------------
accum8_1_016:
	.byte		N05   , Gs4 , v116
	.byte	W06
	.byte		        An4 , v112
	.byte	W06
	.byte		        Bn4 , v120
	.byte	W06
	.byte		N02   , An4 , v116
	.byte	W12
	.byte		N17   , Gs4 , v120
	.byte	W18
	.byte		N05   , En4 , v112
	.byte	W12
	.byte		N17   , Cs4 , v120
	.byte	W36
	.byte	PEND
@ 017   ----------------------------------------
	.byte		N05   , En4 , v116
	.byte	W12
	.byte		N11   , Cs4 , v120
	.byte	W18
	.byte		N17   , Cs4 , v116
	.byte	W18
	.byte		N04   , En4 , v108
	.byte	W09
	.byte		N02   , Gs4 , v116
	.byte	W03
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v116
	.byte	W12
	.byte		N11   , Fs4 , v124
	.byte	W12
@ 018   ----------------------------------------
	.byte	PATT
	 .word	accum8_1_002
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	PATT
	 .word	accum8_1_016
@ 021   ----------------------------------------
	.byte		N05   , En4 , v116
	.byte	W12
	.byte		N11   , Cs4 , v120
	.byte	W18
	.byte		N17   , Cs4 , v116
	.byte	W18
	.byte		N05   , En4 , v108
	.byte	W09
	.byte		        Gs4 
	.byte	W03
	.byte		N11   , An4 , v124
	.byte	W12
	.byte		N05   , Gs4 , v116
	.byte	W12
	.byte		N11   , Fs4 , v124
	.byte	W12
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_1_002
@ 023   ----------------------------------------
	.byte	W06
	.byte		N01   , Bn4 , v096
	.byte	W02
	.byte		        Cs5 , v084
	.byte	W02
	.byte		        Ds5 , v100
	.byte	W02
	.byte		N04   , En5 , v104
	.byte	W18
	.byte		        En5 , v100
	.byte	W18
	.byte		        En5 , v104
	.byte	W44
	.byte	W02
	.byte		N01   , Ds4 , v112
	.byte	W02
	.byte	GOTO
	 .word	accum8_1_B1
accum8_1_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

accum8_2:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 81
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N05   , En1 , v124
	.byte	W06
	.byte		        En1 , v052
	.byte	W12
	.byte		        Bn0 , v112
	.byte	W06
	.byte		        Bn0 , v040
	.byte	W12
	.byte		        En1 , v124
	.byte	W06
	.byte		N08   , En1 , v052
	.byte	W18
	.byte		N05   , An0 , v124
	.byte	W12
	.byte		N11   , An0 , v120
	.byte	W12
@ 001   ----------------------------------------
accum8_2_001:
	.byte		N11   , Gs0 , v112
	.byte	W12
	.byte		        Fs0 , v124
	.byte	W18
	.byte		N08   , Cs1 , v112
	.byte	W18
	.byte		N11   , Fs0 , v120
	.byte	W24
	.byte		N05   , Bn0 , v116
	.byte	W12
	.byte		N23   , Bn0 , v112
	.byte	W12
	.byte	PEND
@ 002   ----------------------------------------
accum8_2_002:
	.byte	W12
	.byte		N05   , En1 , v124
	.byte	W18
	.byte		N08   , En1 , v116
	.byte	W18
	.byte		N11   , En1 , v120
	.byte	W48
	.byte	PEND
@ 003   ----------------------------------------
	.byte	W12
	.byte		N05   , En1 , v124
	.byte	W18
	.byte		N08   , En1 , v120
	.byte	W18
	.byte		N11   , En1 , v124
	.byte	W24
	.byte		        Bn0 , v112
	.byte	W12
	.byte		N05   , Cs1 , v104
	.byte	W12
@ 004   ----------------------------------------
	.byte		        Ds1 , v112
	.byte	W12
	.byte		        En1 , v124
	.byte	W06
	.byte		        En1 , v052
	.byte	W12
	.byte		        En1 , v112
	.byte	W06
	.byte		        En1 , v040
	.byte	W12
	.byte		        Gs0 , v124
	.byte	W06
	.byte		N08   , Gs0 , v052
	.byte	W18
	.byte		N05   , An0 , v124
	.byte	W12
	.byte		N11   , An0 , v120
	.byte	W12
@ 005   ----------------------------------------
accum8_2_005:
	.byte		N11   , Gs0 , v124
	.byte	W12
	.byte		        Fs0 
	.byte	W18
	.byte		N08   , Cs1 , v116
	.byte	W18
	.byte		N11   , Fs0 , v120
	.byte	W24
	.byte		N05   , Bn0 , v124
	.byte	W12
	.byte		N23   , Bn0 , v120
	.byte	W12
	.byte	PEND
@ 006   ----------------------------------------
accum8_2_006:
	.byte	W12
	.byte		N05   , En1 , v124
	.byte	W18
	.byte		N08   , En1 , v120
	.byte	W18
	.byte		N11   , En1 , v124
	.byte	W48
	.byte	PEND
@ 007   ----------------------------------------
accum8_2_007:
	.byte	W12
	.byte		N05   , En1 , v127
	.byte	W18
	.byte		N08   , En1 , v120
	.byte	W18
	.byte		N11   , En1 , v124
	.byte	W48
	.byte	PEND
accum8_2_B1:
@ 008   ----------------------------------------
	.byte	W12
	.byte		N11   , An0 , v120
	.byte	W18
	.byte		N02   , An0 , v112
	.byte	W06
	.byte		N17   , En1 , v116
	.byte	W12
	.byte	W12
	.byte		        Dn1 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , Dn1 , v112
	.byte	W06
	.byte		N17   , An1 , v120
	.byte	W12
@ 009   ----------------------------------------
	.byte	W06
	.byte		N05   , An1 , v112
	.byte	W06
	.byte		N11   , Gs0 , v120
	.byte	W18
	.byte		N02   , Gs0 , v112
	.byte	W06
	.byte		N17   , Ds1 , v116
	.byte	W12
	.byte	W12
	.byte		        Gn0 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , Gn0 , v112
	.byte	W06
	.byte		N17   , Dn1 , v120
	.byte	W12
@ 010   ----------------------------------------
	.byte	W06
	.byte		N05   , Dn1 , v112
	.byte	W06
	.byte		N11   , Fs0 , v120
	.byte	W18
	.byte		N02   , Fs0 , v112
	.byte	W06
	.byte		N11   , Cs1 , v120
	.byte	W18
	.byte		N02   , Cs1 , v112
	.byte	W06
	.byte		N17   , Gs0 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , Gs0 , v112
	.byte	W06
	.byte		N17   , Ds1 , v120
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		N05   , Ds1 , v112
	.byte	W06
	.byte		N11   , Bn0 , v120
	.byte	W18
	.byte		N02   , Bn0 , v112
	.byte	W06
	.byte		N17   , Fs1 , v116
	.byte	W12
	.byte	W12
	.byte		        As0 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , As0 , v112
	.byte	W06
	.byte		N17   , As0 , v120
	.byte	W12
@ 012   ----------------------------------------
	.byte	W06
	.byte		N05   , As0 , v112
	.byte	W06
	.byte		N11   , An0 , v120
	.byte	W18
	.byte		N02   , An0 , v112
	.byte	W06
	.byte		N11   , En1 , v120
	.byte	W18
	.byte		N02   , En1 , v112
	.byte	W06
	.byte		N17   , An1 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , An1 , v112
	.byte	W06
	.byte		N17   , En1 , v120
	.byte	W12
@ 013   ----------------------------------------
	.byte	W06
	.byte		N05   , En1 , v112
	.byte	W06
	.byte		N11   , Gs0 , v120
	.byte	W18
	.byte		N02   , Gs0 , v112
	.byte	W06
	.byte		N11   , Ds1 , v120
	.byte	W18
	.byte		N02   , Ds1 , v112
	.byte	W06
	.byte		N17   , Cs1 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , Cs1 , v112
	.byte	W06
	.byte		N17   , Gs0 , v120
	.byte	W12
@ 014   ----------------------------------------
	.byte	W06
	.byte		N05   , Gs0 , v112
	.byte	W06
	.byte		N11   , Fs0 , v120
	.byte	W18
	.byte		N02   , Fs0 , v112
	.byte	W06
	.byte		N11   , Cs1 , v120
	.byte	W18
	.byte		N02   , Cs1 , v112
	.byte	W06
	.byte		N17   , Fn1 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , Fn1 , v112
	.byte	W06
	.byte		N17   , Cn1 , v120
	.byte	W12
@ 015   ----------------------------------------
	.byte	W06
	.byte		N05   , Cn1 , v112
	.byte	W06
	.byte		N11   , En0 , v120
	.byte	W18
	.byte		N02   , En0 , v112
	.byte	W06
	.byte		N11   , Bn0 , v120
	.byte	W18
	.byte		N02   , Bn0 , v112
	.byte	W06
	.byte		N17   , En1 , v120
	.byte	W12
	.byte	W06
	.byte		N05   , En1 , v112
	.byte	W06
	.byte		N17   , Bn0 , v120
	.byte	W12
@ 016   ----------------------------------------
	.byte	W06
	.byte		N05   , Bn0 , v112
	.byte	W06
	.byte		        En1 , v124
	.byte	W06
	.byte		        En1 , v052
	.byte	W12
	.byte		        Bn0 , v112
	.byte	W06
	.byte		        Bn0 , v040
	.byte	W12
	.byte		        En1 , v124
	.byte	W06
	.byte		N08   , En1 , v052
	.byte	W18
	.byte		N05   , An0 , v124
	.byte	W12
	.byte		N11   , An0 , v120
	.byte	W12
@ 017   ----------------------------------------
	.byte	PATT
	 .word	accum8_2_001
@ 018   ----------------------------------------
	.byte	PATT
	 .word	accum8_2_002
@ 019   ----------------------------------------
	.byte	W12
	.byte		N05   , En1 , v124
	.byte	W18
	.byte		N08   , En1 , v120
	.byte	W18
	.byte		N11   , En1 , v124
	.byte	W24
	.byte		        Bn0 , v112
	.byte	W12
	.byte		N05   , Cs1 , v104
	.byte	W12
@ 020   ----------------------------------------
	.byte		        Ds1 , v112
	.byte	W12
	.byte		        En1 , v124
	.byte	W06
	.byte		        En1 , v052
	.byte	W12
	.byte		        En1 , v112
	.byte	W06
	.byte		        En1 , v040
	.byte	W12
	.byte		        Gs0 , v124
	.byte	W06
	.byte		N08   , Gs0 , v052
	.byte	W18
	.byte		N05   , An0 , v124
	.byte	W12
	.byte		N11   , An0 , v120
	.byte	W12
@ 021   ----------------------------------------
	.byte	PATT
	 .word	accum8_2_005
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_2_006
@ 023   ----------------------------------------
	.byte	PATT
	 .word	accum8_2_007
	.byte	GOTO
	 .word	accum8_2_B1
accum8_2_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

accum8_3:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 24
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte		N17   , Bn2 , v096
	.byte		N17   , En3 
	.byte	W18
	.byte		        Gs2 
	.byte		N17   , Bn2 , v092
	.byte		N17   , En3 
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte		N11   , Bn2 , v096
	.byte		N11   , En3 
	.byte	W24
	.byte		N05   , En2 
	.byte		N05   , An2 , v092
	.byte		N05   , Cs3 , v096
	.byte	W12
	.byte		N23   , En2 
	.byte		N23   , An2 , v092
	.byte		N23   , Cs3 , v096
	.byte	W12
@ 001   ----------------------------------------
	.byte	W12
	.byte		N17   , Fs2 , v108
	.byte		N17   , An2 , v096
	.byte		N17   , En3 , v104
	.byte	W18
	.byte		        Fs2 , v100
	.byte		N17   , An2 , v092
	.byte		N17   , En3 , v096
	.byte	W18
	.byte		N11   , Fs2 , v104
	.byte		N11   , An2 , v096
	.byte		N11   , En3 , v100
	.byte	W24
	.byte		N05   , En2 , v096
	.byte		N05   , An2 , v092
	.byte		N05   , Cs3 , v096
	.byte	W12
	.byte		N23   , Fs2 
	.byte		N23   , Bn2 , v092
	.byte		N23   , Ds3 , v096
	.byte	W12
@ 002   ----------------------------------------
accum8_3_002:
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte		N17   , Bn2 , v096
	.byte		N17   , En3 
	.byte	W18
	.byte		        Gs2 
	.byte		N17   , Bn2 , v092
	.byte		N17   , En3 
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte		N11   , Bn2 , v096
	.byte		N11   , En3 
	.byte	W48
	.byte	PEND
@ 003   ----------------------------------------
	.byte	PATT
	 .word	accum8_3_002
@ 004   ----------------------------------------
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte		N17   , Bn2 , v096
	.byte		N17   , En3 
	.byte	W18
	.byte		        Gs2 
	.byte		N17   , Bn2 , v092
	.byte		N17   , En3 
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte		N11   , Bn2 , v096
	.byte		N11   , En3 
	.byte	W24
	.byte		N05   , En2 
	.byte		N05   , An2 , v092
	.byte		N05   , Cs3 , v096
	.byte	W12
	.byte		N23   , En2 
	.byte		N23   , An2 , v092
	.byte		N23   , Cs3 , v096
	.byte	W12
@ 005   ----------------------------------------
	.byte	W12
	.byte		N17   , Fs2 , v108
	.byte		N17   , An2 , v096
	.byte		N17   , En3 , v104
	.byte	W18
	.byte		        Fs2 , v100
	.byte		N17   , An2 , v092
	.byte		N17   , En3 , v096
	.byte	W18
	.byte		N11   , Fs2 , v108
	.byte		N11   , An2 , v096
	.byte		N11   , En3 , v100
	.byte	W24
	.byte		N05   , En2 , v096
	.byte		N05   , An2 , v092
	.byte		N05   , Cs3 , v096
	.byte	W12
	.byte		N23   , Fs2 
	.byte		N23   , Bn2 , v092
	.byte		N23   , Ds3 , v096
	.byte	W12
@ 006   ----------------------------------------
	.byte	PATT
	 .word	accum8_3_002
@ 007   ----------------------------------------
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte		N17   , Bn2 , v096
	.byte	W18
	.byte		        Gs2 
	.byte		N17   , Bn2 , v092
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte		N11   , Bn2 , v096
	.byte	W48
accum8_3_B1:
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	accum8_3_B1
accum8_3_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.6) ****************@

accum8_4:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 4
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
accum8_4_B1:
@ 008   ----------------------------------------
	.byte	W24
	.byte		N05   , Cs4 , v120
	.byte	W12
	.byte		        Ds4 , v112
	.byte	W06
	.byte		        En4 , v108
	.byte	W12
	.byte		N17   , Bn4 , v120
	.byte	W18
	.byte		N05   , An4 , v112
	.byte	W12
	.byte		N11   , Gs4 , v120
	.byte	W12
@ 009   ----------------------------------------
	.byte		        Bn4 , v112
	.byte	W21
	.byte		N08   , Ds4 , v096
	.byte	W03
	.byte		N11   , En4 , v116
	.byte	W12
	.byte		N05   , Fs4 , v112
	.byte	W06
	.byte		        Gs4 , v108
	.byte	W12
	.byte		N11   , Fs4 , v116
	.byte	W12
	.byte		N05   , En4 , v120
	.byte	W12
	.byte		N02   , Dn4 , v108
	.byte	W06
	.byte		N05   , En4 , v120
	.byte	W12
@ 010   ----------------------------------------
	.byte		N11   , Dn4 , v116
	.byte	W24
	.byte		N05   , An3 , v104
	.byte	W06
	.byte		        Gs3 , v096
	.byte	W06
	.byte		        An3 , v112
	.byte	W06
	.byte		        Bn3 , v100
	.byte	W06
	.byte		        Cs4 , v116
	.byte	W06
	.byte		        Cn4 , v108
	.byte	W12
	.byte		        Cn4 , v112
	.byte	W06
	.byte		        Ds4 , v108
	.byte	W06
	.byte		        En4 , v116
	.byte	W06
	.byte		        Fs4 , v104
	.byte	W06
	.byte		        Gs4 , v120
	.byte	W06
@ 011   ----------------------------------------
	.byte		        An4 , v108
	.byte	W06
	.byte		        Bn4 , v116
	.byte	W06
	.byte		N11   , En5 , v127
	.byte	W12
	.byte		N05   , Dn5 , v112
	.byte	W12
	.byte		        Cs5 
	.byte	W06
	.byte		        Bn4 
	.byte	W10
	.byte		N03   , As4 
	.byte	W02
	.byte		N08   , Bn4 
	.byte	W12
	.byte		N05   , An4 , v108
	.byte	W18
	.byte		        Gs4 
	.byte	W12
@ 012   ----------------------------------------
	.byte		N11   , Fs4 , v116
	.byte	W24
	.byte		N05   , Ds4 , v120
	.byte	W06
	.byte		        En4 , v112
	.byte	W06
	.byte		        Cs4 , v116
	.byte	W06
	.byte		        Ds4 , v108
	.byte	W12
	.byte		        En4 , v116
	.byte	W12
	.byte		        En4 , v120
	.byte	W06
	.byte		        Fs4 , v112
	.byte	W06
	.byte		        Gs4 , v120
	.byte	W06
	.byte		        An4 , v116
	.byte	W06
	.byte		        Bn4 , v108
	.byte	W06
@ 013   ----------------------------------------
	.byte		        Cs5 , v116
	.byte	W06
	.byte		        Ds5 , v112
	.byte	W06
	.byte		N11   , En5 , v120
	.byte	W12
	.byte		N05   , Ds5 , v108
	.byte	W12
	.byte		        En5 , v116
	.byte	W06
	.byte		        Fs5 , v112
	.byte	W10
	.byte		N01   
	.byte	W02
	.byte		N11   , Gs5 , v120
	.byte	W12
	.byte		N05   , Fs5 , v116
	.byte	W12
	.byte		        En5 , v120
	.byte	W06
	.byte		        Ds5 , v112
	.byte	W12
@ 014   ----------------------------------------
	.byte		N11   , Dn5 , v120
	.byte	W21
	.byte		N05   , Bn4 , v104
	.byte	W03
	.byte		N11   , Cs5 , v120
	.byte	W12
	.byte		N05   , Bn4 , v116
	.byte	W06
	.byte		        An4 , v104
	.byte	W12
	.byte		        Gs4 , v112
	.byte	W12
	.byte		        Gs4 , v108
	.byte	W06
	.byte		        An4 , v116
	.byte	W06
	.byte		        Bn4 , v108
	.byte	W06
	.byte		        Gs4 , v116
	.byte	W12
@ 015   ----------------------------------------
	.byte		        En4 , v108
	.byte	W12
	.byte		        En4 , v116
	.byte	W12
	.byte		        Bn3 , v104
	.byte	W06
	.byte		        En4 , v112
	.byte	W12
	.byte		        Bn3 , v108
	.byte	W12
	.byte		N11   , An3 
	.byte	W12
	.byte		N05   , Gs3 , v104
	.byte	W06
	.byte		        An3 , v100
	.byte	W12
	.byte		        Fs3 , v108
	.byte	W12
@ 016   ----------------------------------------
accum8_4_016:
	.byte	W12
	.byte		N05   , En4 , v112
	.byte	W18
	.byte		N08   , En4 , v108
	.byte	W18
	.byte		N11   , En4 , v112
	.byte	W24
	.byte		N05   , Cs4 , v108
	.byte	W12
	.byte		N22   , Cs4 , v104
	.byte	W12
	.byte	PEND
@ 017   ----------------------------------------
accum8_4_017:
	.byte	W12
	.byte		N05   , En4 , v112
	.byte	W18
	.byte		N08   , En4 , v108
	.byte	W18
	.byte		N11   , En4 , v112
	.byte	W24
	.byte		N05   , En4 , v104
	.byte	W12
	.byte		N22   , Fs4 , v108
	.byte	W12
	.byte	PEND
@ 018   ----------------------------------------
accum8_4_018:
	.byte	W12
	.byte		N05   , En4 , v112
	.byte	W18
	.byte		N08   , En4 , v108
	.byte	W18
	.byte		N11   , En4 , v112
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
	.byte	W12
	.byte		N05   , Bn3 
	.byte	W18
	.byte		N08   , Bn3 , v108
	.byte	W18
	.byte		N11   
	.byte	W48
@ 020   ----------------------------------------
	.byte	PATT
	 .word	accum8_4_016
@ 021   ----------------------------------------
	.byte	PATT
	 .word	accum8_4_017
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_4_018
@ 023   ----------------------------------------
	.byte	W06
	.byte		N01   , Bn3 , v104
	.byte	W02
	.byte		        Cs4 , v092
	.byte	W02
	.byte		        Ds4 , v096
	.byte	W02
	.byte		N05   , Gs4 , v104
	.byte	W18
	.byte		N08   
	.byte	W18
	.byte		N11   , Gs4 , v108
	.byte	W48
	.byte	GOTO
	 .word	accum8_4_B1
accum8_4_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.7) ****************@

accum8_5:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 127
	.byte		VOL   , 99*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W66
	.byte		N01   , Fs5 , v060
	.byte	W06
	.byte		        As5 
	.byte	W12
	.byte		N02   , Fs5 
	.byte	W12
accum8_5_B1:
@ 008   ----------------------------------------
	.byte	W36
	.byte		N01   , Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		N05   , As5 , v096
	.byte	W06
	.byte	W06
	.byte		N01   , Fs5 , v080
	.byte	W12
@ 009   ----------------------------------------
	.byte	W12
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
@ 010   ----------------------------------------
accum8_5_010:
	.byte		N02   , As5 , v096
	.byte	W12
	.byte		N01   , Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		N02   , As5 , v096
	.byte	W12
	.byte		N01   , Fs5 , v080
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		N02   , As5 , v096
	.byte	W12
	.byte		N01   , Fs5 , v080
	.byte	W12
@ 012   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W30
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        As5 , v096
	.byte	W12
	.byte		        Fs5 , v080
	.byte	W12
@ 013   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
@ 014   ----------------------------------------
	.byte	PATT
	 .word	accum8_5_010
@ 015   ----------------------------------------
	.byte		N01   , Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		N02   , As5 , v096
	.byte	W12
	.byte		N01   , Fs5 , v100
	.byte	W12
@ 016   ----------------------------------------
	.byte	W36
	.byte		N01   
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W18
	.byte		        Fs5 , v080
	.byte	W12
@ 017   ----------------------------------------
	.byte	W12
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
@ 018   ----------------------------------------
accum8_5_018:
	.byte		N02   , As5 , v096
	.byte	W12
	.byte		N01   , Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W18
	.byte		        Fs5 , v080
	.byte	W12
	.byte	PEND
@ 019   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W18
	.byte		        Fs5 , v080
	.byte	W12
@ 020   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W30
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W18
	.byte		        Fs5 , v080
	.byte	W12
@ 021   ----------------------------------------
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_5_018
@ 023   ----------------------------------------
	.byte		N01   , Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W06
	.byte		        Fs5 , v096
	.byte	W06
	.byte		        Fs5 , v080
	.byte	W06
	.byte		        Fs5 , v100
	.byte	W06
	.byte		        Fs5 , v088
	.byte	W18
	.byte		        Fs5 , v080
	.byte	W12
	.byte	GOTO
	 .word	accum8_5_B1
accum8_5_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 6 (Midi-Chn.8) ****************@

accum8_6:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 92
	.byte		VOL   , 98*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
accum8_6_B1:
@ 008   ----------------------------------------
	.byte	W12
	.byte		N17   , An1 , v112
	.byte	W06
	.byte		N05   , Gs2 , v104
	.byte	W06
	.byte		N17   , Cs3 
	.byte	W06
	.byte		N08   , En3 , v108
	.byte	W06
	.byte		N11   , En2 , v112
	.byte	W06
	.byte		N17   , Gs2 , v100
	.byte	W06
	.byte		N11   , An1 , v096
	.byte		N11   , Cs3 , v104
	.byte	W06
	.byte		N08   , En3 , v108
	.byte	W06
	.byte		N22   , Dn2 , v116
	.byte	W06
	.byte		N17   , An2 , v100
	.byte	W06
	.byte		        Cn3 , v104
	.byte	W06
	.byte		N08   , En3 , v108
	.byte	W06
	.byte		N22   , An1 , v104
	.byte	W06
	.byte		        Cn3 , v108
	.byte	W06
@ 009   ----------------------------------------
	.byte		N11   , En3 , v104
	.byte	W06
	.byte		N08   , Gn3 
	.byte	W06
	.byte		N17   , Gs1 , v112
	.byte	W06
	.byte		        Fs2 , v104
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N11   , Ds2 , v112
	.byte	W06
	.byte		N17   , Fs2 , v096
	.byte	W06
	.byte		N11   , Gs1 
	.byte		N11   , Bn2 , v104
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N22   , Gn1 , v116
	.byte	W06
	.byte		N17   , As2 , v108
	.byte	W06
	.byte		N22   , Dn3 , v104
	.byte	W06
	.byte		N08   , Fn3 , v108
	.byte	W06
	.byte		N28   , Dn2 , v104
	.byte	W06
	.byte		        Fn2 , v108
	.byte	W06
@ 010   ----------------------------------------
	.byte		N11   , As2 , v104
	.byte	W06
	.byte		N08   , Dn3 , v112
	.byte	W06
	.byte		N17   , Fs1 
	.byte	W06
	.byte		        En2 , v104
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		N08   , Cs3 , v108
	.byte	W06
	.byte		N11   , Cs2 , v112
	.byte	W06
	.byte		N17   , En2 , v096
	.byte	W06
	.byte		N11   , Fs1 
	.byte		N11   , An2 , v104
	.byte	W06
	.byte		N08   , Cs3 , v108
	.byte	W06
	.byte		N22   , Gs1 , v116
	.byte	W06
	.byte		N17   , Fs2 , v108
	.byte	W06
	.byte		N22   , Cn3 , v104
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N22   , Cn2 , v104
	.byte	W06
	.byte		N28   , Fs2 , v108
	.byte	W06
@ 011   ----------------------------------------
	.byte		N08   , Cn3 , v104
	.byte	W06
	.byte		        Ds3 , v112
	.byte	W06
	.byte		N22   , Bn1 
	.byte	W06
	.byte		N17   , An2 , v104
	.byte	W06
	.byte		N22   , Dn3 
	.byte	W06
	.byte		N08   , Fs3 , v108
	.byte	W06
	.byte		N11   , Fs1 , v112
	.byte	W06
	.byte		N17   , Fs2 , v096
	.byte	W06
	.byte		N11   , Bn1 
	.byte		N11   , Bn2 , v104
	.byte	W06
	.byte		N08   , Dn3 , v108
	.byte	W06
	.byte		N22   , As1 , v116
	.byte	W06
	.byte		N17   , Gs2 , v108
	.byte	W06
	.byte		N22   , Cn3 , v104
	.byte	W06
	.byte		N08   , En3 , v108
	.byte	W06
	.byte		N22   , As1 , v104
	.byte	W06
	.byte		N28   , En2 , v108
	.byte	W06
@ 012   ----------------------------------------
	.byte		N08   , Gs2 , v104
	.byte	W06
	.byte		        Cs3 , v112
	.byte	W06
	.byte		N17   , An1 
	.byte	W06
	.byte		        Gs2 , v104
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		N08   , En3 , v108
	.byte	W06
	.byte		N11   , En2 , v112
	.byte	W06
	.byte		N17   , Gs2 , v096
	.byte	W06
	.byte		N08   , An1 
	.byte		N08   , Cs3 , v104
	.byte	W06
	.byte		        En3 , v108
	.byte	W06
	.byte		N22   , An1 , v116
	.byte	W06
	.byte		N17   , Fs2 , v108
	.byte	W06
	.byte		N08   , Bn2 , v104
	.byte	W06
	.byte		        Ds3 , v108
	.byte	W06
	.byte		N22   , An1 , v104
	.byte	W06
	.byte		        Bn2 , v108
	.byte	W06
@ 013   ----------------------------------------
	.byte		N11   , Ds3 , v104
	.byte	W06
	.byte		N08   , Fs3 , v112
	.byte	W06
	.byte		N17   , Gs1 
	.byte	W06
	.byte		        Fs2 , v104
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N11   , Ds2 , v112
	.byte	W06
	.byte		N17   , Fs2 , v096
	.byte	W06
	.byte		N11   , Gs1 
	.byte		N11   , Bn2 , v104
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N22   , Cs2 , v116
	.byte	W06
	.byte		N17   , Fn2 , v108
	.byte	W06
	.byte		N22   , Bn2 , v104
	.byte	W06
	.byte		N08   , Dn3 , v108
	.byte	W06
	.byte		N28   , Gs1 , v104
	.byte	W06
	.byte		        Fn2 , v108
	.byte	W06
@ 014   ----------------------------------------
	.byte		N11   , Bn2 , v104
	.byte	W06
	.byte		N08   , Dn3 , v112
	.byte	W06
	.byte		N17   , Fs1 
	.byte	W06
	.byte		        En2 , v104
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		N08   , Cs3 , v108
	.byte	W06
	.byte		N11   , Cs2 , v112
	.byte	W06
	.byte		N17   , En2 , v096
	.byte	W06
	.byte		N11   , Fs1 
	.byte		N11   , An2 , v104
	.byte	W06
	.byte		N08   , Cs3 , v108
	.byte	W06
	.byte		N17   , Fn1 , v116
	.byte	W06
	.byte		        En2 , v108
	.byte	W06
	.byte		N08   , An2 , v104
	.byte	W06
	.byte		        Cn3 , v108
	.byte	W06
	.byte		N22   , Cn2 , v104
	.byte	W06
	.byte		        An2 , v108
	.byte	W06
@ 015   ----------------------------------------
	.byte		N11   , Cn3 , v104
	.byte	W06
	.byte		N08   , En3 , v112
	.byte	W06
	.byte		N22   , En1 
	.byte	W06
	.byte		N17   , Gs2 , v104
	.byte	W06
	.byte		N22   , Bn2 
	.byte	W06
	.byte		N08   , Ds3 , v108
	.byte	W06
	.byte		N11   , Bn1 , v112
	.byte	W06
	.byte		        En2 , v104
	.byte	W06
	.byte		        En1 , v096
	.byte		N11   , Gs2 , v108
	.byte	W06
	.byte		N08   , Bn2 
	.byte	W06
	.byte		N22   , En1 , v112
	.byte	W06
	.byte		N17   , Bn2 , v104
	.byte	W06
	.byte		N22   , Ds3 
	.byte	W06
	.byte		N08   , Gs3 , v108
	.byte	W06
	.byte		N11   , Bn1 , v112
	.byte	W06
	.byte		N18   , Gs2 , v104
	.byte	W06
@ 016   ----------------------------------------
	.byte		N11   , En1 , v096
	.byte		N11   , Bn2 , v108
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte	W18
	.byte		        Gs2 , v096
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte	W24
	.byte		N05   , An2 , v092
	.byte	W12
	.byte		N22   
	.byte	W12
@ 017   ----------------------------------------
accum8_6_017:
	.byte	W12
	.byte		N17   , An2 , v096
	.byte	W18
	.byte		        An2 , v092
	.byte	W18
	.byte		N11   , An2 , v096
	.byte	W24
	.byte		N05   , An2 , v092
	.byte	W12
	.byte		N22   
	.byte	W12
	.byte	PEND
@ 018   ----------------------------------------
accum8_6_018:
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte	W18
	.byte		        Gs2 , v096
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
	.byte	PATT
	 .word	accum8_6_018
@ 020   ----------------------------------------
	.byte	W12
	.byte		N17   , Gs2 , v104
	.byte	W18
	.byte		        Gs2 , v096
	.byte	W18
	.byte		N11   , Gs2 , v100
	.byte	W24
	.byte		N05   , An2 , v092
	.byte	W12
	.byte		N22   
	.byte	W12
@ 021   ----------------------------------------
	.byte	PATT
	 .word	accum8_6_017
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_6_018
@ 023   ----------------------------------------
	.byte	W12
	.byte		N17   , Bn2 , v096
	.byte	W18
	.byte		        Bn2 , v092
	.byte	W18
	.byte		N11   , Bn2 , v096
	.byte	W48
	.byte	GOTO
	 .word	accum8_6_B1
accum8_6_B2:
@ 024   ----------------------------------------
	.byte	FINE

@**************** Track 7 (Midi-Chn.10) ****************@

accum8_7:
	.byte	KEYSH , accum8_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*accum8_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W60
	.byte		N11   , Cn1 , v120
	.byte	W06
	.byte		N02   , En1 , v060
	.byte	W03
	.byte		        En1 , v076
	.byte	W03
	.byte		N23   , Cn1 , v116
	.byte		N02   , En1 , v084
	.byte	W03
	.byte		        En1 , v100
	.byte	W03
	.byte		N05   , En1 , v096
	.byte	W06
	.byte		        En1 , v124
	.byte	W06
	.byte		        En1 , v112
	.byte	W06
accum8_7_B1:
@ 008   ----------------------------------------
	.byte		N11   , Fn1 , v100
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte		N11   , Cs2 , v100
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v127
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N11   , En1 , v127
	.byte	W12
@ 009   ----------------------------------------
accum8_7_009:
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v127
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W06
	.byte		N05   , En1 
	.byte	W06
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N05   , En1 , v127
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
accum8_7_010:
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v127
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N11   , En1 , v127
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
	.byte	PATT
	 .word	accum8_7_010
@ 012   ----------------------------------------
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte		N11   , Cs2 , v100
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v127
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N11   , En1 , v127
	.byte	W12
@ 013   ----------------------------------------
	.byte	PATT
	 .word	accum8_7_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	accum8_7_010
@ 015   ----------------------------------------
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v127
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W06
	.byte		N05   , En1 , v112
	.byte	W06
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N11   , En1 , v127
	.byte	W12
@ 016   ----------------------------------------
	.byte		        Cn1 , v116
	.byte	W12
	.byte		        Cn1 , v120
	.byte		N11   , Cs2 , v100
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte		N11   , Ds1 , v124
	.byte	W12
	.byte		        Ds1 , v120
	.byte		N11   , En1 
	.byte	W12
@ 017   ----------------------------------------
accum8_7_017:
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W06
	.byte		N05   , En1 , v112
	.byte	W06
	.byte		N23   , Cn1 , v116
	.byte	W12
	.byte		N05   , En1 , v120
	.byte	W12
	.byte	PEND
@ 018   ----------------------------------------
	.byte	W06
	.byte		        Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte		N11   , Ds1 , v124
	.byte	W12
	.byte		        Ds1 , v120
	.byte		N11   , En1 , v080
	.byte	W12
@ 019   ----------------------------------------
accum8_7_019:
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte		N11   , Ds1 , v124
	.byte	W12
	.byte		        Ds1 , v120
	.byte		N11   , En1 
	.byte	W12
	.byte	PEND
@ 020   ----------------------------------------
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte		N11   , Cs2 , v100
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N23   , Cn1 , v116
	.byte		N11   , Ds1 , v124
	.byte	W12
	.byte		        Ds1 , v120
	.byte		N11   , En1 
	.byte	W12
@ 021   ----------------------------------------
	.byte	PATT
	 .word	accum8_7_017
@ 022   ----------------------------------------
	.byte	PATT
	 .word	accum8_7_019
@ 023   ----------------------------------------
	.byte	W06
	.byte		N05   , Cn1 , v116
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W12
	.byte		N05   , Cn1 , v108
	.byte	W06
	.byte		N17   , Cn1 , v100
	.byte	W06
	.byte		N05   , En1 , v120
	.byte	W12
	.byte		        Cn1 , v116
	.byte	W06
	.byte		        Cn1 , v112
	.byte	W06
	.byte		N11   , Cn1 , v120
	.byte	W06
	.byte		N02   , En1 , v060
	.byte	W03
	.byte		        En1 , v076
	.byte	W03
	.byte		N23   , Cn1 , v116
	.byte		N02   , Ds1 , v124
	.byte	W03
	.byte		        En1 , v100
	.byte	W03
	.byte		N05   , En1 , v096
	.byte	W06
	.byte		        Ds1 , v120
	.byte	W06
	.byte		        En1 , v112
	.byte	W06
	.byte	GOTO
	 .word	accum8_7_B1
accum8_7_B2:
@ 024   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

accum8:
	.byte	7	@ NumTrks
	.byte	0	@ NumBlks
	.byte	accum8_pri	@ Priority
	.byte	accum8_rev	@ Reverb.

	.word	accum8_grp

	.word	accum8_1
	.word	accum8_2
	.word	accum8_3
	.word	accum8_4
	.word	accum8_5
	.word	accum8_6
	.word	accum8_7

	.end
