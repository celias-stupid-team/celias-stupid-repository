	.include "MPlayDef.s"

	.equ	aPleasefortheloveofgod_grp, voicegroup000
	.equ	aPleasefortheloveofgod_pri, 0
	.equ	aPleasefortheloveofgod_rev, 0
	.equ	aPleasefortheloveofgod_mvl, 127
	.equ	aPleasefortheloveofgod_key, 0
	.equ	aPleasefortheloveofgod_tbs, 1
	.equ	aPleasefortheloveofgod_exg, 0
	.equ	aPleasefortheloveofgod_cmp, 1

	.section .rodata
	.global	aPleasefortheloveofgod
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

aPleasefortheloveofgod_1:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 147*aPleasefortheloveofgod_tbs/2
	.byte		VOICE , 127
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte		N06   , Cn5 , v060
	.byte	W48
	.byte		N06   
	.byte	W48
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte	W12
	.byte		N01   , Gn5 
	.byte	W24
	.byte		        Gn5 , v064
	.byte	W24
	.byte		        Gn5 , v060
	.byte	W24
	.byte		N01   
	.byte	W12
@ 005   ----------------------------------------
aPleasefortheloveofgod_1_005:
	.byte	W12
	.byte		N01   , Gn5 , v060
	.byte	W24
	.byte		N01   
	.byte	W24
	.byte		N01   
	.byte	W24
	.byte		N01   
	.byte	W12
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 008   ----------------------------------------
aPleasefortheloveofgod_1_008:
	.byte	W12
	.byte		N01   , Gn5 , v060
	.byte	W24
	.byte		N01   
	.byte	W60
	.byte	PEND
aPleasefortheloveofgod_1_B1:
@ 009   ----------------------------------------
	.byte	W12
	.byte		N01   , Dn6 , v064
	.byte	W24
	.byte		        Gn5 , v060
	.byte	W24
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		        Dn6 
	.byte	W06
@ 010   ----------------------------------------
aPleasefortheloveofgod_1_010:
	.byte		N01   , Gn5 , v060
	.byte	W12
	.byte		        Dn6 
	.byte	W24
	.byte		        Gn5 
	.byte	W24
	.byte		N01   
	.byte	W24
	.byte		N01   
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
aPleasefortheloveofgod_1_011:
	.byte	W12
	.byte		N01   , Dn6 , v060
	.byte	W24
	.byte		        Gn5 
	.byte	W24
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		        Dn6 
	.byte	W06
	.byte	PEND
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 023   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_011
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_010
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_005
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_1_008
	.byte	GOTO
	 .word	aPleasefortheloveofgod_1_B1
aPleasefortheloveofgod_1_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

aPleasefortheloveofgod_2:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 33
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N92   , Fn0 , v112
	.byte		N92   , Cn2 
	.byte	W96
@ 001   ----------------------------------------
	.byte		        Fn0 
	.byte		N92   , Ds1 
	.byte		N92   , As1 
	.byte	W96
@ 002   ----------------------------------------
	.byte		        As0 , v096
	.byte		N92   , Fn1 
	.byte	W96
@ 003   ----------------------------------------
	.byte		        Fs0 
	.byte		N92   , Fn1 , v112
	.byte	W96
@ 004   ----------------------------------------
aPleasefortheloveofgod_2_004:
	.byte		N11   , Fn0 , v112
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 008   ----------------------------------------
	.byte		N92   , Cn2 , v080
	.byte	W96
aPleasefortheloveofgod_2_B1:
@ 009   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 010   ----------------------------------------
aPleasefortheloveofgod_2_010:
	.byte		N11   , Fn0 , v112
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte	PEND
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_010
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_010
@ 015   ----------------------------------------
	.byte		N11   , Fn0 , v112
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Ds0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Ds0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
@ 016   ----------------------------------------
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		N23   , An1 
	.byte	W24
@ 017   ----------------------------------------
aPleasefortheloveofgod_2_017:
	.byte		N11   , As0 , v112
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte	PEND
@ 018   ----------------------------------------
aPleasefortheloveofgod_2_018:
	.byte		N11   , An0 , v112
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte	PEND
@ 019   ----------------------------------------
	.byte		        Gn1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		N17   , Cn2 
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
@ 020   ----------------------------------------
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		N23   , Fn1 
	.byte	W24
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_017
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_018
@ 023   ----------------------------------------
	.byte		N11   , Gs1 , v112
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N01   , Fs1 
	.byte	W02
	.byte		N21   , Gs1 
	.byte	W22
	.byte		N11   , Ds2 
	.byte	W12
	.byte		N23   , Gs1 
	.byte	W24
@ 024   ----------------------------------------
	.byte		N11   , Cs0 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		N17   , Ds0 
	.byte	W24
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Ds0 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
@ 025   ----------------------------------------
	.byte		N44   , Cn1 
	.byte		N72   , Gn1 , v080
	.byte		N60   , Cn2 
	.byte	W60
	.byte		N11   , Cn2 , v112
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
@ 026   ----------------------------------------
aPleasefortheloveofgod_2_026:
	.byte		N11   , Fn1 , v112
	.byte	W12
	.byte		        Fn2 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Fn2 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        En1 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte	PEND
@ 027   ----------------------------------------
aPleasefortheloveofgod_2_027:
	.byte		N11   , Dn1 , v112
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte	PEND
@ 028   ----------------------------------------
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		        An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		        An1 
	.byte	W12
@ 029   ----------------------------------------
	.byte		        Gn0 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cn0 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_026
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_027
@ 032   ----------------------------------------
	.byte		N11   , As0 , v112
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		N17   , As1 
	.byte	W24
	.byte		N11   , Fn1 
	.byte	W12
	.byte		N01   , Gs1 
	.byte	W02
	.byte		N21   , As1 
	.byte	W22
@ 033   ----------------------------------------
	.byte		N11   , Gs1 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		N17   , Ds1 
	.byte	W24
	.byte		N11   , Cn2 
	.byte	W12
	.byte		N23   , Gs1 
	.byte	W24
@ 034   ----------------------------------------
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
	.byte		N17   , Cs2 
	.byte	W24
	.byte		N11   , Cs1 
	.byte		N11   , Cs2 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
@ 035   ----------------------------------------
	.byte		N23   , Fs1 
	.byte	W24
	.byte		N11   , Gs1 
	.byte	W12
	.byte		N17   , Fs1 
	.byte	W24
	.byte		N11   , Cs1 
	.byte	W12
	.byte		N01   , En1 
	.byte	W02
	.byte		N21   , Fs1 
	.byte	W22
@ 036   ----------------------------------------
aPleasefortheloveofgod_2_036:
	.byte		N11   , As0 , v112
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        As0 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte	PEND
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_036
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_036
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_036
@ 040   ----------------------------------------
	.byte		N11   , Fs0 , v112
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 041   ----------------------------------------
	.byte		        Cn2 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		N44   , Cn2 
	.byte	W48
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_2_004
@ 046   ----------------------------------------
	.byte		N92   , Cn2 , v080
	.byte	W96
	.byte	GOTO
	 .word	aPleasefortheloveofgod_2_B1
aPleasefortheloveofgod_2_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

aPleasefortheloveofgod_3:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
	.byte		N92   , Cn3 , v036
	.byte		N92   , An3 
	.byte	W96
@ 005   ----------------------------------------
	.byte		        Ds3 
	.byte		N92   , Gn3 
	.byte	W96
@ 006   ----------------------------------------
	.byte		        Dn3 
	.byte		N92   , As3 
	.byte	W96
@ 007   ----------------------------------------
	.byte		        Cs3 
	.byte		N92   , Fs3 
	.byte	W96
@ 008   ----------------------------------------
	.byte	W24
	.byte		N05   , Gn2 , v076
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        As2 
	.byte	W02
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        Gn2 
	.byte	W01
	.byte	W01
	.byte	W02
	.byte	W01
	.byte	W01
	.byte		        As2 
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W02
	.byte		        Cn3 
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        En3 
	.byte	W02
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        Cn3 
	.byte	W01
	.byte	W01
	.byte	W02
	.byte	W01
	.byte	W01
	.byte		        En3 
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W02
	.byte		        Gn3 
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        As3 
	.byte	W02
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte		        Cn4 
	.byte	W01
	.byte	W01
	.byte	W02
	.byte	W01
	.byte	W01
	.byte		        En4 
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W01
	.byte	W02
aPleasefortheloveofgod_3_B1:
@ 009   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 , v112
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 010   ----------------------------------------
	.byte		N44   , An3 
	.byte	W96
@ 011   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		        En4 
	.byte	W12
@ 012   ----------------------------------------
	.byte		N68   , Cn4 
	.byte	W96
@ 013   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 014   ----------------------------------------
	.byte		N44   , An3 
	.byte	W96
@ 015   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		        Fn4 
	.byte	W12
	.byte		        En4 
	.byte	W12
@ 016   ----------------------------------------
	.byte		N68   , Cn4 
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
	.byte		N11   
	.byte	W12
	.byte		N05   , Fn3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N40   
	.byte	W12
	.byte	W24
	.byte	W12
	.byte		N05   , As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
@ 024   ----------------------------------------
	.byte		N11   , As3 
	.byte	W12
	.byte		N05   , Fn3 
	.byte	W12
	.byte		N11   , As3 
	.byte	W12
	.byte		N17   , Ds4 
	.byte	W12
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W12
	.byte		N05   , An3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		N05   , Dn4 
	.byte	W12
	.byte		N44   , Cn4 
	.byte	W48
@ 027   ----------------------------------------
aPleasefortheloveofgod_3_027:
	.byte	W12
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		N02   , En4 
	.byte	W03
	.byte		N08   , Fn4 
	.byte	W09
	.byte		N23   , Cn4 
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte	PEND
@ 028   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N03   , Fn3 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N15   
	.byte	W16
	.byte		N17   , As3 
	.byte	W24
	.byte		N11   , An3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
@ 029   ----------------------------------------
	.byte		        Dn3 
	.byte	W12
	.byte		N23   , Fn3 
	.byte	W24
	.byte		N11   , An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		N23   , En3 
	.byte	W24
@ 030   ----------------------------------------
	.byte	W12
	.byte		N05   , Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		N05   , Dn4 
	.byte	W12
	.byte		N44   , Cn4 
	.byte	W48
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_3_027
@ 032   ----------------------------------------
	.byte		N05   , Cn4 , v112
	.byte	W12
	.byte		N03   , Fn3 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N15   
	.byte	W16
	.byte		N40   
	.byte	W48
	.byte		N05   , Cn4 
	.byte	W12
@ 033   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N03   , Fn3 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N15   
	.byte	W16
	.byte		N56   
	.byte	W60
@ 034   ----------------------------------------
	.byte	W84
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
@ 035   ----------------------------------------
	.byte		N11   , Ds4 
	.byte	W12
	.byte		N17   , As3 
	.byte	W84
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
aPleasefortheloveofgod_3_037:
	.byte	W12
	.byte		N05   , Dn5 , v112
	.byte	W06
	.byte		        Ds5 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		N08   , As4 
	.byte	W30
	.byte		N03   
	.byte	W04
	.byte		        Gs4 
	.byte	W04
	.byte		        As4 
	.byte	W04
	.byte		        Gs4 
	.byte	W04
	.byte		        As4 
	.byte	W04
	.byte		        Gs4 
	.byte	W16
	.byte	PEND
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_3_037
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W24
	.byte		N02   , Gn3 , v076
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
@ 042   ----------------------------------------
	.byte		N92   , Cn3 , v096
	.byte	W96
@ 043   ----------------------------------------
	.byte		N44   , As2 
	.byte	W48
	.byte		        Ds3 
	.byte	W48
@ 044   ----------------------------------------
	.byte		N92   , Cn3 
	.byte	W96
@ 045   ----------------------------------------
	.byte		        Fs2 
	.byte	W96
@ 046   ----------------------------------------
	.byte	W24
	.byte		N02   , Gn3 , v076
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte	GOTO
	 .word	aPleasefortheloveofgod_3_B1
aPleasefortheloveofgod_3_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 4 (Midi-Chn.5) ****************@

aPleasefortheloveofgod_4:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 30
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W12
	.byte		N11   , Cn2 , v112
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn2 , v096
	.byte	W12
	.byte		        As3 , v112
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn3 , v096
	.byte	W12
@ 001   ----------------------------------------
aPleasefortheloveofgod_4_001:
	.byte	W12
	.byte		N11   , Cn2 , v112
	.byte	W12
	.byte		        Ds3 
	.byte	W12
	.byte		        As1 , v096
	.byte	W12
	.byte		        Cn3 , v112
	.byte	W12
	.byte		        As1 , v096
	.byte	W12
	.byte		N23   , Fn3 , v112
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
aPleasefortheloveofgod_4_002:
	.byte	W12
	.byte		N11   , Cn2 , v112
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn2 , v096
	.byte	W12
	.byte		        As3 , v112
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Cn3 , v096
	.byte	W12
	.byte	PEND
@ 003   ----------------------------------------
	.byte		        As1 
	.byte	W12
	.byte		        Cn2 , v112
	.byte	W12
	.byte		N23   , Ds3 
	.byte	W24
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        As1 , v096
	.byte	W12
	.byte		N23   , Ds3 , v112
	.byte	W24
@ 004   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_002
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_002
@ 007   ----------------------------------------
aPleasefortheloveofgod_4_007:
	.byte	W24
	.byte		N23   , Ds3 , v112
	.byte	W24
	.byte		        Cn3 
	.byte	W24
	.byte		        Ds3 
	.byte	W24
	.byte	PEND
@ 008   ----------------------------------------
aPleasefortheloveofgod_4_008:
	.byte		N11   , Cn2 , v112
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Gn2 , v096
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte	PEND
aPleasefortheloveofgod_4_B1:
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W48
	.byte		N23   , Gs2 , v112
	.byte		N23   , Ds3 
	.byte	W24
	.byte		        Dn3 
	.byte		N23   , Fn3 
	.byte	W24
@ 011   ----------------------------------------
	.byte		N11   , An2 
	.byte		N11   , Cn3 
	.byte	W96
@ 012   ----------------------------------------
	.byte	W48
	.byte		N23   , Gs2 
	.byte		N23   , Ds3 
	.byte	W24
	.byte		        As2 
	.byte		N23   , Fn3 
	.byte	W24
@ 013   ----------------------------------------
	.byte		N11   , Cn3 
	.byte	W96
@ 014   ----------------------------------------
	.byte	W48
	.byte		N23   , Gs2 
	.byte		N23   , Ds3 
	.byte	W24
	.byte		        As2 
	.byte		N23   , Dn3 
	.byte	W24
@ 015   ----------------------------------------
	.byte		N11   , An2 
	.byte		N11   , Cn3 
	.byte	W96
@ 016   ----------------------------------------
	.byte	W48
	.byte		N23   , Dn2 
	.byte		N23   , Cn3 
	.byte	W24
	.byte		        Cn2 
	.byte		N23   , An2 
	.byte	W24
@ 017   ----------------------------------------
	.byte	W96
@ 018   ----------------------------------------
	.byte	W96
@ 019   ----------------------------------------
	.byte	W96
@ 020   ----------------------------------------
	.byte		N11   , Cn2 , v096
	.byte		N11   , Fn2 
	.byte	W36
	.byte		        Cn2 
	.byte		N11   , Fn2 
	.byte	W24
	.byte		        As1 
	.byte		N11   , Ds2 
	.byte	W12
	.byte		        Cn2 
	.byte		N11   , Fn2 
	.byte	W24
@ 021   ----------------------------------------
	.byte	W96
@ 022   ----------------------------------------
	.byte	W96
@ 023   ----------------------------------------
	.byte	W96
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte		        Cn3 , v112
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		N17   , Cn3 
	.byte	W36
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_002
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_001
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_002
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_007
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_4_008
	.byte	GOTO
	 .word	aPleasefortheloveofgod_4_B1
aPleasefortheloveofgod_4_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 5 (Midi-Chn.8) ****************@

aPleasefortheloveofgod_5:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 60
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
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
aPleasefortheloveofgod_5_B1:
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
	.byte	W12
	.byte		N05   , Dn3 , v112
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		N05   , Dn4 
	.byte	W12
	.byte		N44   , Cn4 
	.byte	W48
@ 018   ----------------------------------------
aPleasefortheloveofgod_5_018:
	.byte	W12
	.byte		N05   , Fn3 , v112
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte		N02   , En4 
	.byte	W03
	.byte		N08   , Fn4 
	.byte	W09
	.byte		N23   , Cn4 
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte	PEND
@ 019   ----------------------------------------
	.byte		N11   , Cn3 
	.byte		N11   , Cn4 
	.byte	W12
	.byte		N03   , Cn3 
	.byte		N03   , Fn3 
	.byte	W04
	.byte		        Cn3 
	.byte		N03   , Fn3 
	.byte	W04
	.byte		N15   , Cn3 
	.byte		N15   , Fn3 
	.byte	W16
	.byte		N17   , Dn3 
	.byte		N17   , As3 
	.byte	W24
	.byte		N11   , Cn3 
	.byte		N11   , An3 
	.byte	W12
	.byte		        Cn3 
	.byte		N11   , Fn3 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
@ 020   ----------------------------------------
	.byte		N05   , An2 
	.byte		N05   , Fn3 
	.byte	W06
	.byte		        Cn3 
	.byte		N05   , Gn3 
	.byte	W06
	.byte		N76   , Cn3 
	.byte		N76   , An3 
	.byte	W84
@ 021   ----------------------------------------
	.byte	W12
	.byte		N05   , Dn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , Cn4 
	.byte	W12
	.byte		N05   , Dn4 
	.byte	W12
	.byte		N44   , Cn4 
	.byte	W48
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_5_018
@ 023   ----------------------------------------
	.byte		N11   , Cn4 , v112
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N40   
	.byte	W12
	.byte	W24
	.byte	W12
	.byte		N05   , As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
@ 024   ----------------------------------------
	.byte		N11   , As3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		N17   , Ds4 
	.byte	W12
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
aPleasefortheloveofgod_5_026:
	.byte	W60
	.byte		N05   , En3 , v112
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , An3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte	PEND
@ 027   ----------------------------------------
	.byte		N92   , An3 
	.byte	W96
@ 028   ----------------------------------------
	.byte		N11   , Fn4 
	.byte	W96
@ 029   ----------------------------------------
	.byte	W36
	.byte		        An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		N23   , En3 
	.byte	W24
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_5_026
@ 031   ----------------------------------------
	.byte		N92   , An3 , v112
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte		N05   , Fn4 
	.byte	W12
	.byte		N03   , Cn4 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N15   
	.byte	W16
	.byte		N40   
	.byte	W60
@ 035   ----------------------------------------
	.byte	W12
	.byte		N03   , As3 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N15   
	.byte	W16
	.byte		N28   
	.byte	W48
	.byte		N11   , Ds4 
	.byte	W12
@ 036   ----------------------------------------
	.byte		N32   , Cn4 
	.byte	W36
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		N23   
	.byte	W24
@ 037   ----------------------------------------
	.byte	W96
@ 038   ----------------------------------------
	.byte		N32   , Cn4 
	.byte	W36
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		N23   
	.byte	W24
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
	.byte		N68   , Cn4 
	.byte	W72
	.byte		N07   
	.byte	W08
	.byte		N07   
	.byte	W08
	.byte		N07   
	.byte	W08
@ 041   ----------------------------------------
	.byte		N92   
	.byte	W96
@ 042   ----------------------------------------
	.byte	W96
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	aPleasefortheloveofgod_5_B1
aPleasefortheloveofgod_5_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 6 (Midi-Chn.10) ****************@

aPleasefortheloveofgod_6:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N23   , Cn1 , v127
	.byte		N23   , An2 , v100
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte		N92   , Cn1 
	.byte	W96
@ 003   ----------------------------------------
	.byte	W48
	.byte		N11   , En1 
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
@ 004   ----------------------------------------
aPleasefortheloveofgod_6_004:
	.byte		N23   , Cn1 , v127
	.byte		N23   , An2 , v100
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte	PEND
@ 005   ----------------------------------------
aPleasefortheloveofgod_6_005:
	.byte		N23   , Cn1 , v127
	.byte	W24
	.byte		        Cn1 , v100
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte	PEND
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_005
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_005
@ 008   ----------------------------------------
	.byte		N23   , Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 , v100
	.byte	W24
	.byte		N05   , En1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
aPleasefortheloveofgod_6_B1:
@ 009   ----------------------------------------
aPleasefortheloveofgod_6_009:
	.byte		N23   , Cn1 , v127
	.byte		N23   , An2 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte		        Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
aPleasefortheloveofgod_6_010:
	.byte		N23   , Cn1 , v127
	.byte	W24
	.byte		N23   
	.byte		N23   , Dn1 
	.byte	W24
	.byte		        Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte	PEND
@ 011   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 012   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 013   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 015   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 016   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 017   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 018   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 019   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 020   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 023   ----------------------------------------
aPleasefortheloveofgod_6_023:
	.byte		N23   , Cn1 , v127
	.byte		N23   , An2 , v100
	.byte	W24
	.byte		N11   , Cn1 , v127
	.byte		N11   , Dn1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		N23   , Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte	PEND
@ 024   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_023
@ 025   ----------------------------------------
	.byte		N05   , Cn1 , v127
	.byte	W06
	.byte		N11   , En1 , v100
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Dn1 
	.byte	W12
	.byte		        Cn1 , v127
	.byte	W12
	.byte		N05   , En1 , v100
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 026   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 027   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 028   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 029   ----------------------------------------
	.byte		N05   , En1 , v100
	.byte		N05   , Cn2 
	.byte	W06
	.byte		        En1 
	.byte		N05   , Cn2 
	.byte	W06
	.byte		N11   , En1 
	.byte		N11   , Cn2 
	.byte	W12
	.byte		N05   , En1 
	.byte		N05   , An1 
	.byte	W06
	.byte		        En1 
	.byte		N05   , An1 
	.byte	W06
	.byte		N11   , En1 
	.byte		N11   , An1 
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		N11   
	.byte	W12
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 032   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 033   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 034   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 035   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_010
@ 036   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 037   ----------------------------------------
aPleasefortheloveofgod_6_037:
	.byte		N23   , Cn1 , v080
	.byte		N23   , An2 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte		        Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte	PEND
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_037
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 040   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_009
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_004
@ 043   ----------------------------------------
aPleasefortheloveofgod_6_043:
	.byte		N23   , Cn1 , v100
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte		N23   
	.byte	W24
	.byte	PEND
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_043
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_6_043
@ 046   ----------------------------------------
	.byte		N23   , Cn1 , v100
	.byte	W24
	.byte		        Cn1 , v127
	.byte		N23   , Dn1 
	.byte	W24
	.byte		N05   , En1 , v100
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	GOTO
	 .word	aPleasefortheloveofgod_6_B1
aPleasefortheloveofgod_6_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 7 (Midi-Chn.11) ****************@

aPleasefortheloveofgod_7:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 14
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N44   , Fn4 , v112
	.byte	W48
	.byte		        As4 
	.byte	W48
@ 001   ----------------------------------------
aPleasefortheloveofgod_7_001:
	.byte		N44   , Ds5 , v112
	.byte	W48
	.byte		        Cn5 
	.byte	W48
	.byte	PEND
@ 002   ----------------------------------------
aPleasefortheloveofgod_7_002:
	.byte		N44   , Fn4 , v112
	.byte	W48
	.byte		        As4 
	.byte	W48
	.byte	PEND
@ 003   ----------------------------------------
aPleasefortheloveofgod_7_003:
	.byte		N44   , Cs4 , v112
	.byte	W48
	.byte		        Ds5 
	.byte	W48
	.byte	PEND
@ 004   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_002
@ 005   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_002
@ 007   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_003
@ 008   ----------------------------------------
	.byte	W96
aPleasefortheloveofgod_7_B1:
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
aPleasefortheloveofgod_7_010:
	.byte	W48
	.byte		N23   , Ds3 , v076
	.byte	W24
	.byte		        Dn3 
	.byte	W24
	.byte	PEND
@ 011   ----------------------------------------
	.byte		        Cn3 
	.byte	W96
@ 012   ----------------------------------------
	.byte	W48
	.byte		        Ds3 
	.byte	W24
	.byte		        Fn3 
	.byte	W24
@ 013   ----------------------------------------
	.byte		        Cn3 
	.byte	W96
@ 014   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_010
@ 015   ----------------------------------------
	.byte		N23   , Cn3 , v076
	.byte	W96
@ 016   ----------------------------------------
	.byte	W48
	.byte		        Gn3 
	.byte	W24
	.byte		        An3 
	.byte	W24
@ 017   ----------------------------------------
	.byte		        Fn3 
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
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
aPleasefortheloveofgod_7_026:
	.byte		N44   , Fn4 , v112
	.byte	W48
	.byte		        Cn4 
	.byte	W48
	.byte	PEND
@ 027   ----------------------------------------
aPleasefortheloveofgod_7_027:
	.byte		N44   , An3 , v112
	.byte	W48
	.byte		        Fn4 
	.byte	W48
	.byte	PEND
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte		N23   , Dn4 
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		        Gn4 
	.byte	W24
	.byte		        En4 
	.byte	W24
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_026
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_027
@ 032   ----------------------------------------
	.byte		N92   , Fn4 , v112
	.byte	W96
@ 033   ----------------------------------------
	.byte		        Fn4 , v076
	.byte	W96
@ 034   ----------------------------------------
	.byte		        Cn5 
	.byte	W96
@ 035   ----------------------------------------
	.byte		        As4 
	.byte	W96
@ 036   ----------------------------------------
	.byte		        Cn5 
	.byte	W96
@ 037   ----------------------------------------
aPleasefortheloveofgod_7_037:
	.byte		N23   , Fn4 , v112
	.byte	W24
	.byte		        Cn4 
	.byte	W24
	.byte		        Ds4 
	.byte	W24
	.byte		        As3 
	.byte	W24
	.byte	PEND
@ 038   ----------------------------------------
	.byte		N92   , Cn5 , v076
	.byte	W96
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_037
@ 040   ----------------------------------------
	.byte		N44   , Cn5 , v076
	.byte	W48
	.byte		N44   
	.byte	W48
@ 041   ----------------------------------------
	.byte		N23   , Cn4 
	.byte	W24
	.byte		        Fn4 
	.byte	W24
	.byte		        En4 
	.byte	W48
@ 042   ----------------------------------------
aPleasefortheloveofgod_7_042:
	.byte		N44   , Fn4 , v076
	.byte	W48
	.byte		        As4 
	.byte	W48
	.byte	PEND
@ 043   ----------------------------------------
	.byte		        Ds5 
	.byte	W48
	.byte		        Cn5 
	.byte	W48
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_7_042
@ 045   ----------------------------------------
	.byte		N44   , Cs4 , v076
	.byte	W48
	.byte		        Ds5 
	.byte	W48
@ 046   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	aPleasefortheloveofgod_7_B1
aPleasefortheloveofgod_7_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 8 (Midi-Chn.13) ****************@

aPleasefortheloveofgod_8:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 80
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
aPleasefortheloveofgod_8_004:
	.byte		N02   , Cn4 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
aPleasefortheloveofgod_8_005:
	.byte		N02   , As3 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte	PEND
@ 006   ----------------------------------------
aPleasefortheloveofgod_8_006:
	.byte		N02   , As3 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte	PEND
@ 007   ----------------------------------------
aPleasefortheloveofgod_8_007:
	.byte		N02   , As3 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cs5 
	.byte	W06
	.byte	PEND
@ 008   ----------------------------------------
aPleasefortheloveofgod_8_008:
	.byte	W24
	.byte		N02   , Gn3 , v076
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte	PEND
aPleasefortheloveofgod_8_B1:
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
	.byte	W12
	.byte		N02   , Fn4 , v036
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N05   , Cn4 
	.byte	W12
	.byte		N02   , An3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N05   , Cn3 
	.byte	W12
	.byte		N02   , Cn4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		N05   , Dn3 
	.byte	W12
	.byte		N02   , Gn3 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
@ 017   ----------------------------------------
aPleasefortheloveofgod_8_017:
	.byte		N02   , As4 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte	PEND
@ 018   ----------------------------------------
aPleasefortheloveofgod_8_018:
	.byte		N02   , An4 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W18
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W12
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte	PEND
@ 019   ----------------------------------------
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		N05   , Cn5 
	.byte	W24
	.byte		N02   
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
@ 020   ----------------------------------------
	.byte	W12
	.byte		N05   , Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        An3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
@ 021   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_017
@ 022   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_018
@ 023   ----------------------------------------
	.byte		N02   , Gs4 , v036
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Cn4 
	.byte	W12
	.byte		        Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		N11   , Gs4 
	.byte	W24
	.byte		N02   , Gs3 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
@ 024   ----------------------------------------
	.byte		        Cs4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fs3 
	.byte	W12
	.byte		        As3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N02   , Cs3 
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
@ 025   ----------------------------------------
	.byte		        Cn3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
@ 026   ----------------------------------------
aPleasefortheloveofgod_8_026:
	.byte		N02   , Fn5 , v036
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte	PEND
@ 027   ----------------------------------------
aPleasefortheloveofgod_8_027:
	.byte		N02   , Fn5 , v036
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        An4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte	PEND
@ 028   ----------------------------------------
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Fn5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
@ 029   ----------------------------------------
	.byte		N05   , Gn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Dn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Gn3 
	.byte	W06
@ 030   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_026
@ 031   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_027
@ 032   ----------------------------------------
	.byte		N05   , As4 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		N11   , Dn4 
	.byte	W24
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Dn4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , Dn3 
	.byte	W12
@ 033   ----------------------------------------
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		N11   , Ds4 
	.byte	W24
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		N11   , Cs3 
	.byte	W12
@ 034   ----------------------------------------
	.byte		N05   
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		N11   , Fn3 
	.byte	W12
@ 035   ----------------------------------------
	.byte		N05   , Cs3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N05   , Gs3 
	.byte	W06
	.byte		        As3 
	.byte	W06
	.byte		        Cs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		N11   , Fs4 
	.byte	W12
@ 036   ----------------------------------------
aPleasefortheloveofgod_8_036:
	.byte		N02   , As4 , v036
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Gs4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn4 
	.byte	W06
	.byte	PEND
@ 037   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_036
@ 038   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_036
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_036
@ 040   ----------------------------------------
	.byte		N05   , Fs2 , v036
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        As2 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Cs3 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Fn3 
	.byte	W06
	.byte		        Gs3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        Ds4 
	.byte	W06
@ 041   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_008
@ 042   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_004
@ 043   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_005
@ 044   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_006
@ 045   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_007
@ 046   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_8_008
	.byte	GOTO
	 .word	aPleasefortheloveofgod_8_B1
aPleasefortheloveofgod_8_B2:
@ 047   ----------------------------------------
	.byte	FINE

@**************** Track 9 (Midi-Chn.15) ****************@

aPleasefortheloveofgod_9:
	.byte	KEYSH , aPleasefortheloveofgod_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 100*aPleasefortheloveofgod_mvl/mxv
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
aPleasefortheloveofgod_9_B1:
@ 009   ----------------------------------------
	.byte	W96
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	W96
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 , v112
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
@ 014   ----------------------------------------
	.byte		N44   , Fn3 
	.byte	W96
@ 015   ----------------------------------------
	.byte	W12
	.byte		N11   , Cn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Fn3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte		        Cn4 
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 016   ----------------------------------------
	.byte		N68   , An3 
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
@ 024   ----------------------------------------
	.byte	W96
@ 025   ----------------------------------------
	.byte	W96
@ 026   ----------------------------------------
	.byte	W96
@ 027   ----------------------------------------
	.byte	W96
@ 028   ----------------------------------------
	.byte	W96
@ 029   ----------------------------------------
	.byte	W96
@ 030   ----------------------------------------
	.byte	W96
@ 031   ----------------------------------------
	.byte	W96
@ 032   ----------------------------------------
	.byte	W96
@ 033   ----------------------------------------
	.byte	W96
@ 034   ----------------------------------------
	.byte	W96
@ 035   ----------------------------------------
	.byte	W96
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
aPleasefortheloveofgod_9_037:
	.byte	W36
	.byte		N11   , Fn4 , v112
	.byte	W12
	.byte		N44   , Ds4 
	.byte		N03   , Gs4 
	.byte	W04
	.byte		        As4 
	.byte	W04
	.byte		        Gs4 
	.byte	W04
	.byte	W36
	.byte	PEND
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	PATT
	 .word	aPleasefortheloveofgod_9_037
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	W96
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W96
	.byte	GOTO
	 .word	aPleasefortheloveofgod_9_B1
aPleasefortheloveofgod_9_B2:
@ 047   ----------------------------------------
	.byte	FINE

@******************************************************@
	.align	2

aPleasefortheloveofgod:
	.byte	9	@ NumTrks
	.byte	0	@ NumBlks
	.byte	aPleasefortheloveofgod_pri	@ Priority
	.byte	aPleasefortheloveofgod_rev	@ Reverb.

	.word	aPleasefortheloveofgod_grp

	.word	aPleasefortheloveofgod_1
	.word	aPleasefortheloveofgod_2
	.word	aPleasefortheloveofgod_3
	.word	aPleasefortheloveofgod_4
	.word	aPleasefortheloveofgod_5
	.word	aPleasefortheloveofgod_6
	.word	aPleasefortheloveofgod_7
	.word	aPleasefortheloveofgod_8
	.word	aPleasefortheloveofgod_9

	.end
