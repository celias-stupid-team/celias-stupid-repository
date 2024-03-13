	.include "MPlayDef.s"

	.equ	avgnbettergliss_grp, voicegroup000
	.equ	avgnbettergliss_pri, 0
	.equ	avgnbettergliss_rev, 0
	.equ	avgnbettergliss_mvl, 127
	.equ	avgnbettergliss_key, 0
	.equ	avgnbettergliss_tbs, 1
	.equ	avgnbettergliss_exg, 0
	.equ	avgnbettergliss_cmp, 1

	.section .rodata
	.global	avgnbettergliss
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

avgnbettergliss_1:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_1_B1:
@ 000   ----------------------------------------
	.byte	TEMPO , 128*avgnbettergliss_tbs/2
	.byte		VOICE , 56
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N22   , En4 , v108
	.byte	W24
	.byte		N05   , En4 , v127
	.byte	W12
	.byte		N02   , En4 , v108
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N22   , Bn4 
	.byte	W24
	.byte		N05   , Bn4 , v127
	.byte	W12
	.byte		N02   , Bn4 , v108
	.byte	W06
	.byte		N02   
	.byte	W06
@ 001   ----------------------------------------
	.byte	W72
	.byte		N24   , Bn4 , v127
	.byte	W24
@ 002   ----------------------------------------
	.byte		N12   , Cs5 
	.byte	W12
	.byte		N01   , Cn4 
	.byte		N01   , Cs4 
	.byte	W01
	.byte		        Bn3 
	.byte	W02
	.byte		        An3 
	.byte		N01   , As3 
	.byte	W01
	.byte		        Gs3 
	.byte	W02
	.byte		        Fs3 
	.byte		N01   , Gn3 
	.byte	W01
	.byte		        Fn3 
	.byte	W02
	.byte		        Ds3 
	.byte		N01   , En3 
	.byte	W01
	.byte		        Dn3 
	.byte	W02
	.byte		N05   , Cs3 
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte		N08   , Gs4 
	.byte	W18
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
@ 003   ----------------------------------------
	.byte		        Fs4 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Gs4 
	.byte	W12
	.byte		N32   , Ds4 
	.byte	W60
@ 004   ----------------------------------------
	.byte	W36
	.byte		N05   , Cs4 
	.byte	W12
	.byte		N17   , Gs4 
	.byte	W18
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
@ 005   ----------------------------------------
	.byte		        Fs4 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , Gs4 
	.byte	W12
	.byte		N17   , Ds4 
	.byte	W24
	.byte		N11   , En4 
	.byte	W12
	.byte		N08   , Gs4 
	.byte	W18
	.byte		N05   , En4 
	.byte	W06
@ 006   ----------------------------------------
avgnbettergliss_1_006:
	.byte		N48   , En4 , v127
	.byte	W60
	.byte		N11   
	.byte	W12
	.byte		N17   , Gs4 
	.byte	W18
	.byte		N05   , An4 
	.byte	W06
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_1_007:
	.byte		N48   , Fs4 , v127
	.byte	W60
	.byte		N11   
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte	PEND
@ 008   ----------------------------------------
	.byte		N17   , Bn4 
	.byte	W18
	.byte		N01   , Cs5 
	.byte	W01
	.byte		        Bn4 
	.byte	W02
	.byte		        Cs5 
	.byte	W01
	.byte		        Bn4 
	.byte	W02
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   , An4 
	.byte	W12
	.byte		N22   , Gs4 
	.byte	W24
@ 009   ----------------------------------------
	.byte		        En4 
	.byte	W24
	.byte		N05   , An4 , v108
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		N22   , Dn5 
	.byte	W24
	.byte		N08   , Gs4 , v127
	.byte	W18
	.byte		N05   , En4 
	.byte	W06
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_1_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_1_007
@ 012   ----------------------------------------
	.byte		N11   , Bn4 , v127
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N02   , An4 
	.byte	W03
	.byte		        Bn4 
	.byte	W03
	.byte		        Cs5 
	.byte	W03
	.byte		        Bn4 
	.byte	W03
	.byte		N11   
	.byte	W12
	.byte		        An4 
	.byte	W12
	.byte		N15   , Gs4 
	.byte	W16
	.byte		N03   , An4 
	.byte	W04
	.byte		        Gs4 
	.byte	W04
@ 013   ----------------------------------------
	.byte		N68   , En4 
	.byte	W96
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte		N22   , Dn3 , v108
	.byte	W24
	.byte		        Cn3 
	.byte	W24
	.byte		        Bn2 
	.byte	W24
	.byte		        An2 , v112
	.byte	W24
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W48
	.byte		        En4 , v127
	.byte	W24
	.byte		        Fs4 , v096
	.byte	W24
@ 020   ----------------------------------------
	.byte		N05   , Gs4 , v127
	.byte	W12
	.byte		N22   
	.byte	W36
	.byte		N03   , Fs4 
	.byte	W08
	.byte		N03   
	.byte	W08
	.byte		N03   
	.byte	W08
	.byte		N11   , Gs4 
	.byte	W24
@ 021   ----------------------------------------
	.byte		N32   , En4 
	.byte	W36
	.byte		N02   , Ds4 
	.byte	W03
	.byte		        En4 
	.byte	W03
	.byte		        Fs4 
	.byte	W03
	.byte		        En4 
	.byte	W03
	.byte		N22   
	.byte	W24
	.byte		        Ds4 
	.byte	W24
	.byte	GOTO
	 .word	avgnbettergliss_1_B1
avgnbettergliss_1_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

avgnbettergliss_2:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_2_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 60
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
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
	.byte	W72
	.byte		N11   , En2 , v096
	.byte	W12
	.byte		        Fs2 
	.byte	W12
@ 014   ----------------------------------------
	.byte		N05   , Gs2 
	.byte	W12
	.byte		N22   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N08   , Gs2 
	.byte	W18
	.byte		N05   , En2 
	.byte	W06
@ 015   ----------------------------------------
	.byte		N68   
	.byte	W72
	.byte		N11   
	.byte	W12
	.byte		        Fs2 
	.byte	W12
@ 016   ----------------------------------------
	.byte		N05   , Gs2 
	.byte	W12
	.byte		N22   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N22   , Fs2 
	.byte	W24
	.byte		        Gs2 
	.byte	W24
@ 017   ----------------------------------------
	.byte		N68   , En2 
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	avgnbettergliss_2_B1
avgnbettergliss_2_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

avgnbettergliss_3:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_3_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte		N68   , Cs3 , v080
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
avgnbettergliss_3_006:
	.byte		N44   , Bn3 , v092
	.byte	W48
	.byte		N05   , Gs3 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte		        En4 
	.byte	W06
	.byte		N17   , Bn3 
	.byte	W18
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_3_007:
	.byte		N05   , Ds4 , v092
	.byte	W12
	.byte		N11   , Ds4 , v112
	.byte	W12
	.byte		N08   , En4 
	.byte	W18
	.byte		N05   , Fs4 
	.byte	W06
	.byte		N11   , Ds4 , v092
	.byte	W24
	.byte		N08   
	.byte	W18
	.byte		N05   , Bn3 
	.byte	W06
	.byte	PEND
@ 008   ----------------------------------------
	.byte		N11   , Gs3 
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Gs3 
	.byte	W06
	.byte		N17   , Bn3 
	.byte	W18
	.byte		N05   
	.byte	W06
	.byte		N17   , Fs4 
	.byte	W18
@ 009   ----------------------------------------
	.byte		N11   , En4 
	.byte	W12
	.byte		N05   , An3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N44   , An4 
	.byte	W48
	.byte		N22   , An3 
	.byte	W24
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_3_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_3_007
@ 012   ----------------------------------------
	.byte		N05   , Gs3 , v092
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Gs3 
	.byte	W06
	.byte		N17   , Bn3 
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        Fs3 
	.byte	W06
	.byte		N17   , Bn3 
	.byte	W18
@ 013   ----------------------------------------
	.byte		N22   , Cs4 , v112
	.byte	W24
	.byte		N11   , En4 , v092
	.byte	W12
	.byte		N05   , Cs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N44   , An4 
	.byte	W48
@ 014   ----------------------------------------
	.byte		VOICE , 48
	.byte		N05   , Bn3 , v044
	.byte	W12
	.byte		        Gs4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W06
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Bn3 
	.byte	W06
@ 015   ----------------------------------------
	.byte		        An3 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W12
	.byte		        An3 
	.byte	W06
	.byte		N11   , Cs4 
	.byte	W12
	.byte		N05   , An3 
	.byte	W06
@ 016   ----------------------------------------
	.byte		        Gs3 
	.byte	W12
	.byte		        En4 , v048
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Bn4 
	.byte	W12
	.byte		N11   , En4 , v076
	.byte	W12
	.byte		N05   , Gs4 
	.byte	W06
	.byte		N17   , Bn4 
	.byte	W18
@ 017   ----------------------------------------
	.byte		N44   , Cn5 , v112
	.byte	W48
	.byte		N22   , Dn5 
	.byte	W24
	.byte		N11   , En4 , v127
	.byte	W12
	.byte		        Fs4 
	.byte	W12
@ 018   ----------------------------------------
	.byte		N05   , Gs4 
	.byte	W12
	.byte		N22   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N08   , Gs4 
	.byte	W18
	.byte		N05   , En4 
	.byte	W06
@ 019   ----------------------------------------
	.byte		N44   
	.byte	W48
	.byte		N22   
	.byte	W24
	.byte		        Fs4 , v096
	.byte	W24
@ 020   ----------------------------------------
	.byte		N05   , Gs4 , v127
	.byte	W12
	.byte		N22   
	.byte	W36
	.byte		N03   , Fs4 
	.byte	W08
	.byte		N03   
	.byte	W08
	.byte		N03   
	.byte	W08
	.byte		N11   , Gs4 
	.byte	W24
@ 021   ----------------------------------------
	.byte		N68   , En4 
	.byte	W96
	.byte	GOTO
	 .word	avgnbettergliss_3_B1
avgnbettergliss_3_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

avgnbettergliss_4:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_4_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 87
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N11   , En2 , v080
	.byte	W12
	.byte		N02   , En1 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn1 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		N11   , Bn2 
	.byte	W12
	.byte		N02   , Bn1 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N05   , Fs2 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
@ 001   ----------------------------------------
	.byte		N11   , Cs2 
	.byte	W12
	.byte		N02   , Cs1 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
@ 002   ----------------------------------------
avgnbettergliss_4_002:
	.byte		N08   , Cs1 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        En1 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
	.byte	PEND
@ 003   ----------------------------------------
	.byte		N08   , Ds1 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		        Gs1 
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
@ 004   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_4_002
@ 005   ----------------------------------------
	.byte		N08   , Ds1 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		        Gs1 
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N02   , Bn1 
	.byte	W06
	.byte		N17   
	.byte	W18
@ 006   ----------------------------------------
avgnbettergliss_4_006:
	.byte		N08   , En1 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_4_007:
	.byte		N08   , Bn0 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
	.byte	PEND
@ 008   ----------------------------------------
avgnbettergliss_4_008:
	.byte		N08   , Cs1 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        Bn0 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
	.byte	PEND
@ 009   ----------------------------------------
avgnbettergliss_4_009:
	.byte		N08   , An0 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N17   , An1 
	.byte	W18
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_4_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_4_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_4_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_4_009
@ 014   ----------------------------------------
	.byte		N08   , En1 , v080
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        Bn0 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
@ 015   ----------------------------------------
	.byte		N08   , Dn1 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        An0 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N17   
	.byte	W18
@ 016   ----------------------------------------
	.byte		N08   , Cs1 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N17   , Cs1 
	.byte	W18
@ 017   ----------------------------------------
	.byte		N44   , Cn1 
	.byte	W48
	.byte		        Dn1 
	.byte	W48
@ 018   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		N05   
	.byte	W24
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W24
	.byte		N22   
	.byte	W24
@ 019   ----------------------------------------
	.byte		N05   , Dn1 
	.byte	W12
	.byte		N05   
	.byte	W24
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W24
	.byte		N05   , Fs1 
	.byte	W06
	.byte		N17   , An1 
	.byte	W18
@ 020   ----------------------------------------
	.byte		N05   , Gs1 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N22   
	.byte	W24
	.byte		N05   , Fs1 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N22   
	.byte	W24
@ 021   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N22   
	.byte	W24
	.byte		        Ds1 
	.byte	W24
	.byte		N05   , Fs1 
	.byte	W06
	.byte		        Gs1 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		        Ds2 
	.byte	W06
	.byte	GOTO
	 .word	avgnbettergliss_4_B1
avgnbettergliss_4_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

avgnbettergliss_5:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_5_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 47
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N08   , En2 , v116
	.byte	W18
	.byte		N05   , Bn1 
	.byte	W06
	.byte		N02   , En2 , v127
	.byte	W24
	.byte		N08   , Bn1 , v116
	.byte	W18
	.byte		N05   , Fs1 
	.byte	W06
	.byte		N11   , Bn1 , v127
	.byte	W24
@ 001   ----------------------------------------
	.byte		N08   , Cs2 , v116
	.byte	W18
	.byte		N05   , Gs1 
	.byte	W06
	.byte		N11   , Cs2 , v127
	.byte	W24
	.byte		        Cs2 , v116
	.byte	W24
	.byte		N05   , Cs2 , v127
	.byte	W06
	.byte		N17   
	.byte	W18
@ 002   ----------------------------------------
avgnbettergliss_5_002:
	.byte		N11   , Cs2 , v127
	.byte	W72
	.byte		N05   , En2 , v088
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
	.byte	PEND
@ 003   ----------------------------------------
	.byte		N11   , Ds2 , v100
	.byte	W48
	.byte		        Gs1 
	.byte	W24
	.byte		N05   , Ds2 , v088
	.byte	W06
	.byte		N08   , Gs1 
	.byte	W18
@ 004   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_5_002
@ 005   ----------------------------------------
	.byte		N11   , Ds2 , v100
	.byte	W48
	.byte		        Gs1 
	.byte	W24
	.byte		N05   , Bn1 , v088
	.byte	W06
	.byte		N08   , Fs1 
	.byte	W18
@ 006   ----------------------------------------
avgnbettergliss_5_006:
	.byte		N11   , En2 , v100
	.byte	W72
	.byte		N05   , En2 , v088
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_5_007:
	.byte		N11   , Bn1 , v100
	.byte	W48
	.byte		N11   
	.byte	W24
	.byte		N05   , Bn1 , v088
	.byte	W06
	.byte		N08   , Fs1 
	.byte	W18
	.byte	PEND
@ 008   ----------------------------------------
avgnbettergliss_5_008:
	.byte		N11   , Cs2 , v100
	.byte	W72
	.byte		N05   , Bn1 , v088
	.byte	W06
	.byte		N08   , Gs1 
	.byte	W18
	.byte	PEND
@ 009   ----------------------------------------
avgnbettergliss_5_009:
	.byte		N11   , An1 , v100
	.byte	W48
	.byte		        An1 , v088
	.byte	W24
	.byte		N05   , En1 
	.byte	W06
	.byte		N08   , An1 
	.byte	W18
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_5_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_5_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_5_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_5_009
@ 014   ----------------------------------------
	.byte		N11   , En2 , v127
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W72
	.byte		N05   , En2 , v112
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
@ 017   ----------------------------------------
	.byte		N11   , Cn2 , v127
	.byte	W36
	.byte		N05   , Cn2 , v112
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Dn2 
	.byte	W24
	.byte		N05   , Dn2 , v127
	.byte	W06
	.byte		N17   
	.byte	W18
@ 018   ----------------------------------------
	.byte		N11   , En2 
	.byte	W72
	.byte		N05   , Bn1 , v076
	.byte	W06
	.byte		N08   , En2 , v100
	.byte	W18
@ 019   ----------------------------------------
	.byte		N11   , Dn2 
	.byte	W72
	.byte		N05   , An1 , v076
	.byte	W06
	.byte		N08   , Dn2 , v100
	.byte	W18
@ 020   ----------------------------------------
	.byte		        En2 
	.byte	W18
	.byte		N05   , Bn1 
	.byte	W06
	.byte		N11   , En2 , v112
	.byte	W24
	.byte		N08   , Dn2 , v100
	.byte	W18
	.byte		N05   , Bn1 
	.byte	W06
	.byte		N11   , Dn2 , v112
	.byte	W24
@ 021   ----------------------------------------
	.byte		N08   , Bn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W06
	.byte		N11   , Bn1 , v112
	.byte	W24
	.byte		N05   , Dn2 
	.byte	W06
	.byte		        Bn1 , v064
	.byte	W06
	.byte		        Dn2 , v072
	.byte	W06
	.byte		        Bn1 , v080
	.byte	W06
	.byte		        Dn2 , v092
	.byte	W06
	.byte		        Bn1 , v100
	.byte	W06
	.byte		        Dn2 , v108
	.byte	W06
	.byte		        Bn1 , v116
	.byte	W06
	.byte	GOTO
	 .word	avgnbettergliss_5_B1
avgnbettergliss_5_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

avgnbettergliss_6:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_6_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 85
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N11   , Gs3 , v064
	.byte	W12
	.byte		N02   , Gs2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W12
	.byte		N02   , Fs2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W24
@ 001   ----------------------------------------
	.byte		        En3 
	.byte	W12
	.byte		N02   , En2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W23
	.byte		VOICE , 88
	.byte	W01
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
@ 002   ----------------------------------------
	.byte		        Cs3 , v052
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W60
@ 003   ----------------------------------------
	.byte	W12
	.byte		        Ds3 , v080
	.byte	W12
	.byte		        Ds3 , v052
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N06   , Gs3 , v064
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N06   
	.byte	W12
@ 004   ----------------------------------------
	.byte	W24
	.byte		N05   , Cs3 , v052
	.byte	W12
	.byte		N05   
	.byte	W60
@ 005   ----------------------------------------
	.byte	W12
	.byte		        Ds3 , v080
	.byte	W12
	.byte		        Ds3 , v052
	.byte	W12
	.byte		N05   
	.byte	W60
@ 006   ----------------------------------------
avgnbettergliss_6_006:
	.byte	W12
	.byte		N05   , En3 , v080
	.byte	W12
	.byte		        En3 , v052
	.byte	W12
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_6_007:
	.byte	W12
	.byte		N05   , Bn2 , v080
	.byte	W12
	.byte		        Bn2 , v052
	.byte	W12
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 008   ----------------------------------------
avgnbettergliss_6_008:
	.byte	W12
	.byte		N05   , En3 , v052
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 009   ----------------------------------------
avgnbettergliss_6_009:
	.byte	W12
	.byte		N05   , An2 , v052
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_6_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_6_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_6_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_6_009
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W56
	.byte	W03
	.byte		VOICE , 85
	.byte	W13
	.byte		N05   , Gs3 , v064
	.byte	W06
	.byte		N17   , En3 
	.byte	W18
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte		N11   , Bn3 , v060
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N05   , En3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Bn3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        En3 
	.byte	W06
	.byte		N17   , Gs3 
	.byte	W18
@ 019   ----------------------------------------
	.byte		N11   , An3 
	.byte	W12
	.byte		N02   , An2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N05   , Dn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        An3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Fs3 
	.byte	W06
	.byte		N17   , An3 
	.byte	W18
@ 020   ----------------------------------------
	.byte		N05   , Gs2 , v088
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W30
	.byte		N05   , Fs2 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W30
@ 021   ----------------------------------------
	.byte		N05   , En2 
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W30
	.byte		N22   , Ds2 , v080
	.byte	W48
	.byte	GOTO
	 .word	avgnbettergliss_6_B1
avgnbettergliss_6_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

avgnbettergliss_7:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_7_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 81
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W12
	.byte		N05   , Cs3 , v052
	.byte	W36
	.byte		        En1 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		N02   , En1 
	.byte	W06
	.byte		N17   , Gs1 
	.byte	W18
@ 003   ----------------------------------------
	.byte		N11   , Ds3 
	.byte	W60
	.byte		        Bn2 
	.byte	W12
	.byte		N05   , Ds3 
	.byte	W06
	.byte		N17   , Gs3 
	.byte	W18
@ 004   ----------------------------------------
	.byte		N05   , Cs3 
	.byte	W12
	.byte		N05   
	.byte	W36
	.byte		N11   , En1 , v080
	.byte	W12
	.byte		N05   , Bn0 , v052
	.byte	W12
	.byte		N02   , En1 
	.byte	W06
	.byte		N17   , Gs1 
	.byte	W18
@ 005   ----------------------------------------
	.byte		N05   , Ds3 
	.byte	W48
	.byte		        Gs3 
	.byte	W12
	.byte		N11   , Ds3 
	.byte	W12
	.byte		N05   , En3 
	.byte	W06
	.byte		N17   , Fs3 
	.byte	W18
@ 006   ----------------------------------------
avgnbettergliss_7_006:
	.byte		N05   , En3 , v052
	.byte	W48
	.byte		        Gs2 , v080
	.byte	W12
	.byte		        En2 , v052
	.byte	W12
	.byte		N02   , Gs2 
	.byte	W06
	.byte		N17   , Bn2 
	.byte	W18
	.byte	PEND
@ 007   ----------------------------------------
avgnbettergliss_7_007:
	.byte		N05   , Bn2 , v052
	.byte	W48
	.byte		N08   , Fs3 
	.byte	W18
	.byte		N05   , Ds3 
	.byte	W06
	.byte		N22   
	.byte	W24
	.byte	PEND
@ 008   ----------------------------------------
avgnbettergliss_7_008:
	.byte		N05   , En3 , v052
	.byte	W48
	.byte		        Fs2 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		N02   , Fs2 
	.byte	W06
	.byte		N17   , Bn2 
	.byte	W18
	.byte	PEND
@ 009   ----------------------------------------
avgnbettergliss_7_009:
	.byte		N05   , An2 , v052
	.byte	W48
	.byte		N22   , Fs3 
	.byte	W24
	.byte		        An2 
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_7_006
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_7_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_7_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_7_009
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte		N11   , En3 , v064
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte	W30
	.byte		N05   , En5 , v052
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W36
	.byte		        Dn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 021   ----------------------------------------
	.byte	W30
	.byte		        Bn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        En4 
	.byte	W36
	.byte		        Bn3 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte	GOTO
	 .word	avgnbettergliss_7_B1
avgnbettergliss_7_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

avgnbettergliss_8:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_8_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 80
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N11   , Bn3 , v064
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W24
	.byte		N11   , Bn3 
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W24
@ 001   ----------------------------------------
	.byte		        Gs3 
	.byte	W12
	.byte		N02   , Gs2 , v080
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W60
@ 002   ----------------------------------------
	.byte	W48
	.byte		        Bn2 , v052
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N17   , En3 
	.byte	W18
@ 003   ----------------------------------------
	.byte	W48
	.byte		N05   , Ds3 
	.byte	W12
	.byte		N11   , Gs2 
	.byte	W12
	.byte		N05   , Bn2 
	.byte	W06
	.byte		N17   , Ds3 
	.byte	W18
@ 004   ----------------------------------------
avgnbettergliss_8_004:
	.byte		N44   , Gs3 , v052
	.byte	W48
	.byte		N05   , Bn2 
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N17   , En3 
	.byte	W18
	.byte	PEND
@ 005   ----------------------------------------
	.byte		N44   , As3 
	.byte	W48
	.byte		N05   , Gs3 
	.byte	W12
	.byte		N11   , An2 
	.byte	W12
	.byte		N05   , Cs3 
	.byte	W06
	.byte		N17   , Ds3 
	.byte	W18
@ 006   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_8_004
@ 007   ----------------------------------------
avgnbettergliss_8_007:
	.byte		N44   , Ds3 , v052
	.byte	W48
	.byte		N08   , Bn3 
	.byte	W18
	.byte		N05   , Fs3 
	.byte	W06
	.byte		N22   
	.byte	W24
	.byte	PEND
@ 008   ----------------------------------------
avgnbettergliss_8_008:
	.byte		N44   , Gs3 , v052
	.byte	W48
	.byte		N05   , Bn2 
	.byte	W12
	.byte		        Fs2 
	.byte	W12
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N17   , Ds3 
	.byte	W18
	.byte	PEND
@ 009   ----------------------------------------
avgnbettergliss_8_009:
	.byte		N44   , En3 , v052
	.byte	W48
	.byte		N22   , An3 
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_8_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_8_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_8_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_8_009
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
	.byte		N05   , En3 , v072
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
@ 021   ----------------------------------------
	.byte		        Bn2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte	GOTO
	 .word	avgnbettergliss_8_B1
avgnbettergliss_8_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 9 (Midi-Chn.9) ****************@

avgnbettergliss_9:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_9_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 84
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W48
	.byte		N05   , Gs2 , v080
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
@ 002   ----------------------------------------
	.byte		N44   , Gs3 , v052
	.byte	W96
@ 003   ----------------------------------------
	.byte		        As3 
	.byte	W96
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
	.byte	W96
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
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
	.byte	W72
	.byte		N05   , Bn3 , v064
	.byte	W06
	.byte		N17   , Gs3 
	.byte	W18
@ 017   ----------------------------------------
	.byte		N44   , Gn3 
	.byte	W48
	.byte		        An3 
	.byte	W48
@ 018   ----------------------------------------
	.byte		N11   , En4 , v060
	.byte	W12
	.byte		N02   , En3 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        En4 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Bn3 
	.byte	W06
	.byte		N17   , En4 
	.byte	W18
@ 019   ----------------------------------------
	.byte		N11   , Dn4 
	.byte	W12
	.byte		N02   , Dn3 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		N05   , An3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        An3 
	.byte	W06
	.byte		N17   , Dn4 
	.byte	W18
@ 020   ----------------------------------------
	.byte	W96
@ 021   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	avgnbettergliss_9_B1
avgnbettergliss_9_B2:
@ 022   ----------------------------------------
	.byte	FINE

@**************** Track 10 (Midi-Chn.10) ****************@

avgnbettergliss_10:
	.byte	KEYSH , avgnbettergliss_key+0
avgnbettergliss_10_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 100*avgnbettergliss_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N05   , En1 , v112
	.byte		N44   , Bn2 , v092
	.byte	W12
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte		N44   , Bn2 , v092
	.byte	W12
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		N02   , En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 001   ----------------------------------------
	.byte		N05   , En1 , v112
	.byte		N44   , Gs2 , v092
	.byte	W06
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		        En1 , v100
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		        En1 , v080
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v092
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		N02   , En1 , v112
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 002   ----------------------------------------
	.byte		N08   , En1 , v112
	.byte		N44   , Gs2 , v092
	.byte	W18
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v080
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
	.byte		        En1 , v112
	.byte	W12
	.byte		N02   , En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 003   ----------------------------------------
avgnbettergliss_10_003:
	.byte		N08   , En1 , v112
	.byte	W18
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v080
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
	.byte		N02   , En1 , v112
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte	PEND
@ 004   ----------------------------------------
avgnbettergliss_10_004:
	.byte		N08   , En1 , v112
	.byte	W18
	.byte		N05   , En1 , v080
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		        En1 , v084
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v080
	.byte	W12
	.byte		        En1 , v088
	.byte	W12
	.byte		        En1 , v112
	.byte	W12
	.byte		N02   , En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_003
@ 006   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_003
@ 008   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_004
@ 009   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_003
@ 012   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	avgnbettergliss_10_003
@ 014   ----------------------------------------
	.byte		N44   , Bn2 , v092
	.byte	W96
@ 015   ----------------------------------------
	.byte	W96
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W48
	.byte		N02   , En1 , v076
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		        En1 , v048
	.byte	W03
	.byte		        En1 , v052
	.byte	W03
	.byte		        En1 , v056
	.byte	W03
	.byte		        En1 , v060
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		        En1 , v072
	.byte	W03
	.byte		        En1 , v080
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v088
	.byte	W03
	.byte		        En1 , v092
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v100
	.byte	W03
	.byte		        En1 , v104
	.byte	W03
@ 018   ----------------------------------------
	.byte		N05   , En1 , v112
	.byte		N44   , Bn2 , v092
	.byte	W12
	.byte		N05   , En1 , v112
	.byte	W24
	.byte		        En1 , v088
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , En1 , v112
	.byte	W24
	.byte		N02   
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 019   ----------------------------------------
	.byte		N05   , En1 , v112
	.byte	W12
	.byte		N05   
	.byte	W24
	.byte		        En1 , v088
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 020   ----------------------------------------
	.byte		N05   , En1 , v112
	.byte	W12
	.byte		        En1 , v096
	.byte	W12
	.byte		        En1 , v112
	.byte		N44   , Bn2 , v092
	.byte	W12
	.byte		N05   , En1 , v088
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        En1 , v112
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N02   
	.byte		N44   , Bn2 , v092
	.byte	W03
	.byte		N02   , En1 , v084
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
@ 021   ----------------------------------------
	.byte		N05   , En1 , v112
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v096
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v112
	.byte		N44   , Bn2 , v092
	.byte	W12
	.byte		N05   , En1 , v108
	.byte	W06
	.byte		        En1 , v080
	.byte	W06
	.byte		N02   , En1 , v112
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v048
	.byte	W03
	.byte		        En1 , v052
	.byte	W03
	.byte		        En1 , v056
	.byte	W03
	.byte		        En1 , v060
	.byte	W03
	.byte		        En1 , v064
	.byte	W03
	.byte		        En1 , v068
	.byte	W03
	.byte		        En1 , v072
	.byte		N22   , Bn2 , v092
	.byte	W03
	.byte		N02   , En1 , v080
	.byte	W03
	.byte		        En1 , v084
	.byte	W03
	.byte		        En1 , v088
	.byte	W03
	.byte		        En1 , v092
	.byte	W03
	.byte		        En1 , v096
	.byte	W03
	.byte		        En1 , v100
	.byte	W03
	.byte		        En1 , v104
	.byte	W03
	.byte	GOTO
	 .word	avgnbettergliss_10_B1
avgnbettergliss_10_B2:
@ 022   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

avgnbettergliss:
	.byte	10	@ NumTrks
	.byte	0	@ NumBlks
	.byte	avgnbettergliss_pri	@ Priority
	.byte	avgnbettergliss_rev	@ Reverb.

	.word	avgnbettergliss_grp

	.word	avgnbettergliss_1
	.word	avgnbettergliss_2
	.word	avgnbettergliss_3
	.word	avgnbettergliss_4
	.word	avgnbettergliss_5
	.word	avgnbettergliss_6
	.word	avgnbettergliss_7
	.word	avgnbettergliss_8
	.word	avgnbettergliss_9
	.word	avgnbettergliss_10

	.end
