	.include "MPlayDef.s"

	.equ	aStairs_grp, voicegroup000
	.equ	aStairs_pri, 0
	.equ	aStairs_rev, 0
	.equ	aStairs_mvl, 127
	.equ	aStairs_key, 0
	.equ	aStairs_tbs, 1
	.equ	aStairs_exg, 0
	.equ	aStairs_cmp, 1

	.section .rodata
	.global	aStairs
	.align	2

@**************** Track 1 (Midi-Chn.6) ****************@

aStairs_1:
	.byte	KEYSH , aStairs_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 100*aStairs_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 100*aStairs_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N05   , Bn2 , v092
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
@ 001   ----------------------------------------
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
@ 002   ----------------------------------------
aStairs_1_002:
	.byte		N05   , Ds4 , v092
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte	PEND
@ 003   ----------------------------------------
aStairs_1_003:
	.byte		N05   , Bn4 , v092
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        An5 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Bn5 
	.byte	W06
	.byte		        Cn6 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte	PEND
@ 004   ----------------------------------------
aStairs_1_004:
	.byte		N05   , Cs6 , v092
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Dn6 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
	.byte		        An5 
	.byte	W06
	.byte		        En6 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 025   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_003
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_004
@ 047   ----------------------------------------
	.byte	PATT
	 .word	aStairs_1_002
@ 048   ----------------------------------------
	.byte	FINE

@**************** Track 2 (Midi-Chn.6) ****************@

aStairs_2:
	.byte		VOL   , 127*aStairs_mvl/mxv
	.byte	KEYSH , aStairs_key+0
@ 000   ----------------------------------------
	.byte	W96
@ 001   ----------------------------------------
	.byte	W48
	.byte		N05   , Bn1 , v092
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Cs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
@ 002   ----------------------------------------
aStairs_2_002:
	.byte		N05   , Ds2 , v092
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte	PEND
@ 003   ----------------------------------------
aStairs_2_003:
	.byte		N05   , Bn2 , v092
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte	PEND
@ 004   ----------------------------------------
aStairs_2_004:
	.byte		N05   , Cs4 , v092
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Cs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 025   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_003
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_004
@ 047   ----------------------------------------
	.byte	PATT
	 .word	aStairs_2_002
@ 048   ----------------------------------------
	.byte	FINE

@**************** Track 3 (Midi-Chn.1) ****************@

aStairs_3:
	.byte	KEYSH , aStairs_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 100*aStairs_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N92   , Cs3 , v076
	.byte		N92   , Fn3 
	.byte		N92   , Bn3 
	.byte	W96
@ 001   ----------------------------------------
	.byte		        En3 
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 002   ----------------------------------------
aStairs_3_002:
	.byte		N92   , Ds3 , v076
	.byte		N92   , An3 
	.byte		N92   , Cs4 
	.byte	W96
	.byte	PEND
@ 003   ----------------------------------------
aStairs_3_003:
	.byte		N92   , Cn3 , v076
	.byte		N92   , Fs3 
	.byte		N92   , Cn4 
	.byte	W96
	.byte	PEND
@ 004   ----------------------------------------
aStairs_3_004:
	.byte		N92   , Cs3 , v076
	.byte		N92   , Fn3 
	.byte		N92   , Bn3 
	.byte	W96
	.byte	PEND
@ 005   ----------------------------------------
aStairs_3_005:
	.byte		N92   , An2 , v076
	.byte		N92   , Cs3 
	.byte		N92   , Gn3 
	.byte	W96
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 007   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 008   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 013   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 019   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 025   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 031   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 037   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 043   ----------------------------------------
	.byte		N92   , En3 , v076
	.byte		N92   , As3 
	.byte		N92   , Dn4 
	.byte	W96
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_003
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_004
@ 047   ----------------------------------------
	.byte	PATT
	 .word	aStairs_3_005
@ 048   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.2) ****************@

aStairs_4:
	.byte	KEYSH , aStairs_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 13
	.byte		VOL   , 100*aStairs_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N05   , Bn2 , v092
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
@ 001   ----------------------------------------
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
@ 002   ----------------------------------------
aStairs_4_002:
	.byte		N05   , Ds4 , v092
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Bn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte	PEND
@ 003   ----------------------------------------
aStairs_4_003:
	.byte		N05   , Bn4 , v092
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        An5 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Bn5 
	.byte	W06
	.byte		        Cn6 
	.byte	W06
	.byte		        Fs5 
	.byte	W06
	.byte	PEND
@ 004   ----------------------------------------
aStairs_4_004:
	.byte		N05   , Cs6 , v092
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Dn6 
	.byte	W06
	.byte		        Gs5 
	.byte	W06
	.byte		        Ds6 
	.byte	W06
	.byte		        An5 
	.byte	W06
	.byte		        En6 
	.byte	W06
	.byte		        As5 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 025   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_003
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_004
@ 047   ----------------------------------------
	.byte	PATT
	 .word	aStairs_4_002
@ 048   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.3) ****************@

aStairs_5:
	.byte	KEYSH , aStairs_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 13
	.byte		VOL   , 100*aStairs_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W48
	.byte		N05   , Bn1 , v092
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Cs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
@ 002   ----------------------------------------
aStairs_5_002:
	.byte		N05   , Ds2 , v092
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        En2 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Bn2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte	PEND
@ 003   ----------------------------------------
aStairs_5_003:
	.byte		N05   , Bn2 , v092
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Ds3 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Bn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte	PEND
@ 004   ----------------------------------------
aStairs_5_004:
	.byte		N05   , Cs4 , v092
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Bn1 
	.byte	W06
	.byte		        Fn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        Cn2 
	.byte	W06
	.byte		        Cs2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Gs2 
	.byte	W06
	.byte		        Dn2 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 010   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 025   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_003
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_004
@ 047   ----------------------------------------
	.byte	PATT
	 .word	aStairs_5_002
@ 048   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

aStairs:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	aStairs_pri	@ Priority
	.byte	aStairs_rev	@ Reverb.

	.word	aStairs_grp

	.word	aStairs_1
	.word	aStairs_2
	.word	aStairs_3
	.word	aStairs_4
	.word	aStairs_5

	.end
