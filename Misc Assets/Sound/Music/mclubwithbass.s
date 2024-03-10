	.include "MPlayDef.s"

	.equ	mclubwithbass_grp, voicegroup000
	.equ	mclubwithbass_pri, 0
	.equ	mclubwithbass_rev, 0
	.equ	mclubwithbass_mvl, 127
	.equ	mclubwithbass_key, 0
	.equ	mclubwithbass_tbs, 1
	.equ	mclubwithbass_exg, 0
	.equ	mclubwithbass_cmp, 1

	.section .rodata
	.global	mclubwithbass
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

mclubwithbass_1:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 130*mclubwithbass_tbs/2
	.byte		VOICE , 33
	.byte		VOL   , 124*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N05   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        An1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
mclubwithbass_1_B1:
@ 001   ----------------------------------------
	.byte		N05   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        An1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
@ 002   ----------------------------------------
mclubwithbass_1_002:
	.byte		N08   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        An1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W18
	.byte	PEND
@ 003   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 004   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 005   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 007   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 014   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 015   ----------------------------------------
	.byte		N08   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        En1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 016   ----------------------------------------
mclubwithbass_1_016:
	.byte		N08   , Gn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        Dn1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , En1 
	.byte	W18
	.byte	PEND
@ 017   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_016
@ 018   ----------------------------------------
mclubwithbass_1_018:
	.byte		N08   , Fs1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        Cs1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , En1 
	.byte	W18
	.byte	PEND
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_018
@ 020   ----------------------------------------
mclubwithbass_1_020:
	.byte		N08   , En1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		N08   , Gn1 
	.byte	W18
	.byte	PEND
@ 021   ----------------------------------------
mclubwithbass_1_021:
	.byte		N08   , An1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        En1 
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		N08   , An1 
	.byte	W18
	.byte	PEND
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 023   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 026   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 027   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 030   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 031   ----------------------------------------
	.byte		N08   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W12
	.byte		N11   , En1 
	.byte	W12
	.byte		N05   , Fs1 
	.byte	W12
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_016
@ 033   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_016
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_018
@ 035   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_018
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_021
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_002
@ 039   ----------------------------------------
	.byte		N08   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N08   
	.byte	W42
@ 040   ----------------------------------------
	.byte	W96
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	W96
@ 043   ----------------------------------------
	.byte	W54
	.byte		N08   
	.byte	W42
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W72
	.byte		N05   , Cs1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
@ 046   ----------------------------------------
	.byte		        En1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn1 
	.byte	W12
@ 047   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        En2 
	.byte	W06
	.byte		        En1 
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 048   ----------------------------------------
	.byte		N05   , An1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   , An0 
	.byte	W12
	.byte		        An1 
	.byte	W06
	.byte		        An0 
	.byte	W12
	.byte		N11   , An1 
	.byte	W12
	.byte		        En1 
	.byte	W12
@ 049   ----------------------------------------
	.byte		N05   , An0 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W24
	.byte		        As0 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
@ 050   ----------------------------------------
mclubwithbass_1_050:
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		        Dn0 
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 051   ----------------------------------------
mclubwithbass_1_051:
	.byte		N05   , En1 , v100
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		        En0 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 052   ----------------------------------------
mclubwithbass_1_052:
	.byte		N05   , Fs1 , v100
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        Gn1 
	.byte	W06
	.byte	PEND
@ 053   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		        Gn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        En1 
	.byte	W06
@ 054   ----------------------------------------
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		        Dn0 
	.byte	W12
	.byte		        BnM1
	.byte	W06
	.byte		        Bn0 
	.byte	W06
@ 055   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
@ 056   ----------------------------------------
mclubwithbass_1_056:
	.byte		N05   , En1 , v100
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte	PEND
@ 057   ----------------------------------------
mclubwithbass_1_057:
	.byte		N05   , An1 , v100
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		N11   
	.byte	W15
	.byte		N02   , As0 
	.byte	W03
	.byte		N05   , Bn0 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		        Cs0 
	.byte	W12
	.byte	PEND
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_050
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_051
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_052
@ 061   ----------------------------------------
	.byte		N05   , Gn1 , v100
	.byte	W12
	.byte		        Gn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 062   ----------------------------------------
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 063   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Bn0 
	.byte	W06
	.byte		        Gn1 
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
@ 064   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_056
@ 065   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_1_057
@ 066   ----------------------------------------
	.byte	W96
@ 067   ----------------------------------------
	.byte	W96
@ 068   ----------------------------------------
	.byte	W96
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte		N08   , Dn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W24
	.byte		        An1 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N08   , Bn1 
	.byte	W17
	.byte	GOTO
	 .word	mclubwithbass_1_B1
mclubwithbass_1_B2:
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

mclubwithbass_2:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 80
	.byte		VOL   , 75*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_2_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mclubwithbass_2_004:
	.byte	W24
	.byte		N11   , Dn3 , v100
	.byte	W24
	.byte		        Dn3 , v060
	.byte	W24
	.byte		        Dn3 , v048
	.byte	W24
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 009   ----------------------------------------
mclubwithbass_2_009:
	.byte	W24
	.byte		N11   , Cn3 , v100
	.byte	W24
	.byte		        Cn3 , v060
	.byte	W24
	.byte		        Cn3 , v048
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 015   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 016   ----------------------------------------
mclubwithbass_2_016:
	.byte	W24
	.byte		N11   , Bn2 , v100
	.byte	W24
	.byte		        Bn2 , v060
	.byte	W24
	.byte		        Bn2 , v048
	.byte	W24
	.byte	PEND
@ 017   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 018   ----------------------------------------
mclubwithbass_2_018:
	.byte	W24
	.byte		N11   , Cs3 , v100
	.byte	W24
	.byte		        Cs3 , v060
	.byte	W24
	.byte		        Cs3 , v048
	.byte	W24
	.byte	PEND
@ 019   ----------------------------------------
mclubwithbass_2_019:
	.byte	W24
	.byte		N11   , Cs3 , v100
	.byte		N11   , En3 
	.byte	W24
	.byte		        Cs3 , v060
	.byte		N11   , En3 
	.byte	W24
	.byte		        Cs3 , v048
	.byte		N11   , En3 
	.byte	W24
	.byte	PEND
@ 020   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 022   ----------------------------------------
mclubwithbass_2_022:
	.byte	W24
	.byte		N11   , An2 , v100
	.byte	W24
	.byte		        An2 , v060
	.byte	W24
	.byte		        An2 , v048
	.byte	W24
	.byte	PEND
@ 023   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_009
@ 026   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 027   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 031   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 033   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_018
@ 035   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_019
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_016
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_022
@ 039   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_004
@ 040   ----------------------------------------
mclubwithbass_2_040:
	.byte	W54
	.byte		N05   , Gn2 , v100
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		N11   , Gn3 
	.byte	W24
	.byte	PEND
@ 041   ----------------------------------------
	.byte	W54
	.byte		N17   , Bn3 
	.byte	W18
	.byte		N05   , An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 042   ----------------------------------------
	.byte		N08   , An3 
	.byte	W18
	.byte		N32   , Fs3 
	.byte	W36
	.byte		N05   , An2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		N11   , An3 
	.byte	W24
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_040
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W96
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte	W96
@ 049   ----------------------------------------
	.byte	W48
	.byte	W03
	.byte		N03   , An2 , v100
	.byte	W03
	.byte		        Bn2 
	.byte	W04
	.byte		        Cs3 
	.byte	W03
	.byte		N01   , En3 
	.byte	W04
	.byte		N03   , Fs3 
	.byte	W03
	.byte		        Cs4 
	.byte	W07
	.byte		N01   , An3 
	.byte	W03
	.byte		N03   , An2 
	.byte		N05   , Bn2 
	.byte	W04
	.byte		N06   , En3 
	.byte	W02
	.byte		N05   , Fs3 
	.byte	W05
	.byte		N06   , En4 
	.byte	W07
@ 050   ----------------------------------------
mclubwithbass_2_050:
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		        Dn0 
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 051   ----------------------------------------
mclubwithbass_2_051:
	.byte		N05   , En1 , v100
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		        En0 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 052   ----------------------------------------
mclubwithbass_2_052:
	.byte		N05   , Fs1 , v100
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        Gn1 
	.byte	W06
	.byte	PEND
@ 053   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		        Gn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		        Fs1 
	.byte	W06
	.byte		        En1 
	.byte	W06
@ 054   ----------------------------------------
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		        Dn0 
	.byte	W12
	.byte		        BnM1
	.byte	W06
	.byte		        Bn0 
	.byte	W06
@ 055   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
@ 056   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
@ 057   ----------------------------------------
	.byte		N05   , An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		N11   
	.byte	W15
	.byte		N02   , As0 
	.byte	W03
	.byte		N05   , Bn0 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		        Cs0 
	.byte	W12
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_050
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_051
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_052
@ 061   ----------------------------------------
	.byte		N05   , Gn1 , v100
	.byte	W12
	.byte		        Gn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Gn1 
	.byte	W06
	.byte		        Gn0 
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 062   ----------------------------------------
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		        Dn1 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		        Bn0 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 063   ----------------------------------------
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Bn1 
	.byte	W12
	.byte		        Bn0 
	.byte	W06
	.byte		        Gn1 
	.byte	W12
	.byte		N32   , Fs3 
	.byte	W12
@ 064   ----------------------------------------
	.byte	W24
	.byte		N11   , En3 
	.byte	W12
	.byte		        Dn3 
	.byte	W24
	.byte		        Cs3 
	.byte	W24
	.byte		N32   , En3 
	.byte	W12
@ 065   ----------------------------------------
	.byte	W24
	.byte		N11   , Dn3 
	.byte	W12
	.byte		        Cs3 
	.byte	W24
	.byte		        Bn2 
	.byte	W24
	.byte		        An2 
	.byte		N11   , An3 
	.byte	W12
@ 066   ----------------------------------------
mclubwithbass_2_066:
	.byte		N05   , An2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 067   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_2_066
@ 068   ----------------------------------------
	.byte		N05   , An2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N78   
	.byte	W12
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_2_B1
mclubwithbass_2_B2:
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

mclubwithbass_3:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 92
	.byte		VOL   , 121*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_3_B1:
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
mclubwithbass_3_007:
	.byte	W72
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
	.byte	PEND
@ 008   ----------------------------------------
mclubwithbass_3_008:
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N64   , Fs3 
	.byte	W08
	.byte	W36
	.byte	W24
	.byte		N11   , Dn3 
	.byte	W24
	.byte	PEND
@ 009   ----------------------------------------
mclubwithbass_3_009:
	.byte		N03   , Ds3 , v127
	.byte	W04
	.byte		N40   , En3 
	.byte	W08
	.byte	W36
	.byte		N17   , Gn3 , v100
	.byte	W18
	.byte		N11   , Fs3 
	.byte	W06
	.byte	W12
	.byte		N05   , En3 
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N10   , Fs3 
	.byte	W08
	.byte	W06
	.byte		N05   , An2 , v100
	.byte	W18
	.byte		N56   , Dn3 
	.byte	W12
	.byte	W48
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_008
@ 013   ----------------------------------------
mclubwithbass_3_013:
	.byte		N03   , Ds3 , v127
	.byte	W04
	.byte		N40   , En3 
	.byte	W08
	.byte	W36
	.byte		N17   , Gn3 , v100
	.byte	W18
	.byte		N08   , Fs3 
	.byte	W06
	.byte	W12
	.byte		N05   , En3 
	.byte	W12
	.byte	PEND
@ 014   ----------------------------------------
	.byte		        Fs3 
	.byte	W14
	.byte		N03   , Gs3 , v080
	.byte	W04
	.byte		N72   , An3 , v100
	.byte	W06
	.byte	W24
	.byte	W48
@ 015   ----------------------------------------
	.byte	W60
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        An3 
	.byte	W12
@ 016   ----------------------------------------
mclubwithbass_3_016:
	.byte		N03   , As3 , v127
	.byte	W04
	.byte		TIE   , Bn3 
	.byte	W08
	.byte	W12
	.byte	W24
	.byte	W48
	.byte	PEND
@ 017   ----------------------------------------
	.byte	W06
	.byte		EOT   
	.byte	W18
	.byte		N03   , As3 
	.byte	W04
	.byte		N18   , Bn3 
	.byte	W08
	.byte	W12
	.byte		N22   , An3 , v100
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W24
@ 018   ----------------------------------------
mclubwithbass_3_018:
	.byte		N03   , Gs3 , v127
	.byte	W04
	.byte		TIE   , An3 
	.byte	W08
	.byte	W12
	.byte	W24
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
	.byte	W06
	.byte		EOT   
	.byte	W18
	.byte		N03   , Gs3 
	.byte	W04
	.byte		N18   , An3 
	.byte	W08
	.byte	W12
	.byte		N22   , Gn3 , v100
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W24
@ 020   ----------------------------------------
mclubwithbass_3_020:
	.byte		N90   , Gn3 , v100
	.byte	W48
	.byte	W48
	.byte	PEND
@ 021   ----------------------------------------
mclubwithbass_3_021:
	.byte	W24
	.byte		N22   , Gn3 , v100
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		N11   , En3 
	.byte	W24
	.byte	PEND
@ 022   ----------------------------------------
mclubwithbass_3_022:
	.byte		N03   , Ds3 , v080
	.byte	W04
	.byte		N07   , En3 
	.byte	W04
	.byte	W04
	.byte		TIE   , Dn3 , v100
	.byte	W06
	.byte	W06
	.byte	W24
	.byte	W48
	.byte	PEND
@ 023   ----------------------------------------
	.byte	W18
	.byte		EOT   
	.byte	W54
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_009
@ 026   ----------------------------------------
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N10   , Fs3 
	.byte	W08
	.byte	W06
	.byte		N05   , An2 , v100
	.byte	W18
	.byte		N68   , Dn3 
	.byte	W12
	.byte	W48
@ 027   ----------------------------------------
	.byte	W72
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_013
@ 030   ----------------------------------------
	.byte		N05   , Fs3 , v100
	.byte	W14
	.byte		N03   , Gs3 , v080
	.byte	W04
	.byte		N84   , An3 , v100
	.byte	W06
	.byte	W24
	.byte	W48
@ 031   ----------------------------------------
	.byte	W60
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        An3 
	.byte	W12
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_016
@ 033   ----------------------------------------
	.byte	W06
	.byte		EOT   , Bn3 
	.byte	W18
	.byte		N03   , As3 , v127
	.byte	W04
	.byte		N18   , Bn3 
	.byte	W08
	.byte	W12
	.byte		N22   , An3 , v100
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W24
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_018
@ 035   ----------------------------------------
	.byte	W06
	.byte		EOT   , An3 
	.byte	W18
	.byte		N03   , Gs3 , v127
	.byte	W04
	.byte		N18   , An3 
	.byte	W08
	.byte	W12
	.byte		N22   , Gn3 , v100
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W24
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_021
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_022
@ 039   ----------------------------------------
	.byte	W18
	.byte		EOT   , Dn3 
	.byte	W36
	.byte		N08   , Dn3 , v100
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Cs3 
	.byte	W12
@ 040   ----------------------------------------
mclubwithbass_3_040:
	.byte		N08   , Cn3 , v100
	.byte	W18
	.byte		N05   , Gn2 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N02   , En2 
	.byte	W06
	.byte		        Gn2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		N11   , En3 
	.byte	W24
	.byte	PEND
@ 041   ----------------------------------------
mclubwithbass_3_041:
	.byte		N08   , Gn2 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N17   , Bn3 
	.byte	W18
	.byte		N05   , An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte	PEND
@ 042   ----------------------------------------
	.byte		N08   , An3 
	.byte	W18
	.byte		N32   , Fs3 
	.byte	W06
	.byte	W24
	.byte	W06
	.byte		N05   , An2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		N11   , An3 
	.byte	W24
@ 043   ----------------------------------------
	.byte		N08   , An2 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N08   , Dn3 
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Cs3 
	.byte	W12
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_040
@ 045   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_041
@ 046   ----------------------------------------
	.byte		TIE   , An3 , v100
	.byte	W48
	.byte	W48
@ 047   ----------------------------------------
	.byte	W40
	.byte		EOT   
	.byte	W08
	.byte		N17   , Dn4 
	.byte	W18
	.byte		N05   , Cs4 
	.byte	W18
	.byte		        Bn3 
	.byte	W12
@ 048   ----------------------------------------
	.byte		N08   
	.byte	W18
	.byte		TIE   , An3 
	.byte	W06
	.byte	W24
	.byte	W48
@ 049   ----------------------------------------
	.byte	W40
	.byte	W01
	.byte		EOT   
	.byte	W19
	.byte		N05   
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		N03   , En3 
	.byte	W04
	.byte		        Cs3 
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		        An3 
	.byte	W04
	.byte		        Cs4 
	.byte	W04
	.byte		        Fs4 
	.byte	W04
@ 050   ----------------------------------------
	.byte		N68   , Dn3 
	.byte	W48
	.byte	W24
	.byte		N05   , En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
@ 051   ----------------------------------------
mclubwithbass_3_051:
	.byte		N11   , Gn3 , v100
	.byte	W24
	.byte		N44   , Dn4 
	.byte	W24
	.byte	W24
	.byte		N05   , Cs4 
	.byte	W12
	.byte		        Bn3 
	.byte	W12
	.byte	PEND
@ 052   ----------------------------------------
mclubwithbass_3_052:
	.byte		N08   , An3 , v100
	.byte	W18
	.byte		N48   , Fs3 
	.byte	W06
	.byte	W24
	.byte	W24
	.byte		N05   , Dn3 
	.byte	W12
	.byte		N56   , Gn3 
	.byte	W12
	.byte	PEND
@ 053   ----------------------------------------
mclubwithbass_3_053:
	.byte	W48
	.byte		N22   , Fs3 , v100
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte	PEND
@ 054   ----------------------------------------
mclubwithbass_3_054:
	.byte		N56   , Dn3 , v100
	.byte	W48
	.byte	W12
	.byte		N05   , En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
	.byte		N56   , Bn2 
	.byte	W12
	.byte	PEND
@ 055   ----------------------------------------
	.byte	W48
	.byte		N11   , Cs3 
	.byte	W12
	.byte		        Dn3 
	.byte	W24
	.byte		TIE   
	.byte	W12
@ 056   ----------------------------------------
	.byte	W48
	.byte	W42
	.byte		EOT   
	.byte	W06
@ 057   ----------------------------------------
	.byte		N32   , Cs3 
	.byte	W36
	.byte	W03
	.byte		N02   , Cn3 
	.byte	W03
	.byte		N05   , Cs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 058   ----------------------------------------
	.byte		N68   , Dn3 
	.byte	W48
	.byte	W24
	.byte		N05   , En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W12
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_051
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_052
@ 061   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_053
@ 062   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_3_054
@ 063   ----------------------------------------
	.byte	W48
	.byte		N11   , Cs3 , v100
	.byte	W12
	.byte		        Dn3 
	.byte	W36
@ 064   ----------------------------------------
	.byte		N22   , An3 
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W12
	.byte		        Fs3 
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte		N32   , Gn3 
	.byte	W12
@ 065   ----------------------------------------
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W12
	.byte		        En3 
	.byte	W24
	.byte		        Dn3 
	.byte	W24
	.byte		TIE   
	.byte	W12
@ 066   ----------------------------------------
	.byte	W48
	.byte	W48
@ 067   ----------------------------------------
	.byte	W48
	.byte	W36
	.byte	W01
	.byte		EOT   
	.byte	W11
@ 068   ----------------------------------------
	.byte		N68   
	.byte	W48
	.byte	W36
	.byte		N78   
	.byte	W12
@ 069   ----------------------------------------
	.byte	W48
	.byte	W48
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_3_B1
mclubwithbass_3_B2:
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

mclubwithbass_4:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 17
	.byte		VOL   , 100*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_4_B1:
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
	.byte	W84
	.byte		N05   , An2 , v100
	.byte	W12
@ 024   ----------------------------------------
mclubwithbass_4_024:
	.byte		N68   , Dn3 , v100
	.byte	W48
	.byte	W24
	.byte		N11   , An2 
	.byte	W24
	.byte	PEND
@ 025   ----------------------------------------
mclubwithbass_4_025:
	.byte		N44   , Cn3 , v100
	.byte	W48
	.byte		N17   , En3 
	.byte	W18
	.byte		N11   , Dn3 
	.byte	W06
	.byte	W12
	.byte		N05   , Cn3 
	.byte	W12
	.byte	PEND
@ 026   ----------------------------------------
	.byte		N08   , Dn3 
	.byte	W18
	.byte		N05   , Fs2 
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N68   , An2 
	.byte	W12
	.byte	W48
@ 027   ----------------------------------------
	.byte	W84
	.byte		N05   
	.byte	W12
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_024
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_025
@ 030   ----------------------------------------
	.byte		N05   , Dn3 , v100
	.byte	W14
	.byte		N03   , Fn3 , v080
	.byte	W04
	.byte		N84   , Fs3 , v100
	.byte	W06
	.byte	W24
	.byte	W48
@ 031   ----------------------------------------
	.byte	W60
	.byte		N05   , Dn3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Fs3 
	.byte	W12
@ 032   ----------------------------------------
	.byte		TIE   , Gn3 
	.byte	W48
	.byte	W48
@ 033   ----------------------------------------
	.byte	W06
	.byte		EOT   
	.byte	W18
	.byte		N22   
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		N11   , En3 
	.byte	W24
@ 034   ----------------------------------------
	.byte		TIE   , Fs3 
	.byte	W48
	.byte	W48
@ 035   ----------------------------------------
	.byte	W06
	.byte		EOT   
	.byte	W18
	.byte		N22   
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte		N11   , Dn3 
	.byte	W24
@ 036   ----------------------------------------
	.byte		N90   , En3 
	.byte	W48
	.byte	W48
@ 037   ----------------------------------------
	.byte	W24
	.byte		N22   , Bn2 
	.byte	W24
	.byte		        An2 
	.byte	W24
	.byte		N11   , Gn2 
	.byte	W24
@ 038   ----------------------------------------
	.byte		N11   
	.byte	W12
	.byte		N05   , Fs2 
	.byte	W06
	.byte		N96   
	.byte	W06
	.byte	W24
	.byte	W48
@ 039   ----------------------------------------
	.byte	W54
	.byte		N08   , An3 
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Gs3 
	.byte	W12
@ 040   ----------------------------------------
mclubwithbass_4_040:
	.byte		N08   , Gn3 , v100
	.byte	W18
	.byte		N05   , Cn3 
	.byte	W18
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 041   ----------------------------------------
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N17   , Gn3 
	.byte	W18
	.byte		N05   , Cn3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 042   ----------------------------------------
	.byte		N08   , Dn3 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W60
@ 043   ----------------------------------------
	.byte		N08   , Dn2 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N08   , An3 
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Gs3 
	.byte	W12
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_040
@ 045   ----------------------------------------
	.byte		N08   , Cn2 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W60
@ 046   ----------------------------------------
	.byte	W96
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte	W96
@ 049   ----------------------------------------
	.byte	W96
@ 050   ----------------------------------------
mclubwithbass_4_050:
	.byte		N05   , Fs2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 051   ----------------------------------------
	.byte		        Gn2 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 052   ----------------------------------------
mclubwithbass_4_052:
	.byte		N05   , An2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 053   ----------------------------------------
	.byte		        Bn2 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 054   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_052
@ 055   ----------------------------------------
	.byte		N05   , Fs2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        An2 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
@ 056   ----------------------------------------
	.byte		        An2 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 057   ----------------------------------------
	.byte	W36
	.byte	W03
	.byte		N02   , Cn3 
	.byte	W03
	.byte		N05   , Cs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Dn3 
	.byte	W12
	.byte		        En3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_050
@ 059   ----------------------------------------
mclubwithbass_4_059:
	.byte		N05   , En2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_4_059
@ 061   ----------------------------------------
	.byte		N05   , Dn2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 062   ----------------------------------------
	.byte		        An1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 063   ----------------------------------------
	.byte		        Bn1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W24
@ 064   ----------------------------------------
	.byte	W96
@ 065   ----------------------------------------
	.byte	W96
@ 066   ----------------------------------------
	.byte	W96
@ 067   ----------------------------------------
	.byte	W96
@ 068   ----------------------------------------
	.byte	W96
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_4_B1
mclubwithbass_4_B2:
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

mclubwithbass_5:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 87
	.byte		VOL   , 100*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_5_B1:
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
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
	.byte	W96
@ 040   ----------------------------------------
mclubwithbass_5_040:
	.byte	W54
	.byte		N05   , Gn2 , v100
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		N11   , Gn3 
	.byte	W24
	.byte	PEND
@ 041   ----------------------------------------
	.byte	W96
@ 042   ----------------------------------------
	.byte	W54
	.byte		N05   , An2 
	.byte	W06
	.byte		        Dn3 
	.byte	W06
	.byte		        Fs3 
	.byte	W06
	.byte		N11   , An3 
	.byte	W24
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_5_040
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W96
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte	W96
@ 049   ----------------------------------------
	.byte	W96
@ 050   ----------------------------------------
	.byte	W96
@ 051   ----------------------------------------
	.byte	W96
@ 052   ----------------------------------------
	.byte	W96
@ 053   ----------------------------------------
	.byte	W96
@ 054   ----------------------------------------
	.byte	W96
@ 055   ----------------------------------------
	.byte	W96
@ 056   ----------------------------------------
	.byte	W96
@ 057   ----------------------------------------
	.byte	W96
@ 058   ----------------------------------------
	.byte	W96
@ 059   ----------------------------------------
	.byte	W96
@ 060   ----------------------------------------
	.byte	W96
@ 061   ----------------------------------------
	.byte	W96
@ 062   ----------------------------------------
	.byte	W96
@ 063   ----------------------------------------
	.byte	W96
@ 064   ----------------------------------------
	.byte	W96
@ 065   ----------------------------------------
	.byte	W96
@ 066   ----------------------------------------
	.byte	W96
@ 067   ----------------------------------------
	.byte	W96
@ 068   ----------------------------------------
	.byte	W96
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_5_B1
mclubwithbass_5_B2:
	.byte	FINE

@**************** Track 6 (Midi-Chn.8) ****************@

mclubwithbass_6:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 127
	.byte		VOL   , 41*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v-3
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
mclubwithbass_6_B1:
@ 001   ----------------------------------------
mclubwithbass_6_001:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte	PEND
@ 002   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_001
@ 003   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
@ 004   ----------------------------------------
mclubwithbass_6_004:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_004
@ 007   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
@ 008   ----------------------------------------
mclubwithbass_6_008:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 009   ----------------------------------------
mclubwithbass_6_009:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 010   ----------------------------------------
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 011   ----------------------------------------
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_009
@ 014   ----------------------------------------
mclubwithbass_6_014:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 015   ----------------------------------------
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 016   ----------------------------------------
mclubwithbass_6_016:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 017   ----------------------------------------
mclubwithbass_6_017:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 018   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_016
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_017
@ 020   ----------------------------------------
mclubwithbass_6_020:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 021   ----------------------------------------
mclubwithbass_6_021:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 022   ----------------------------------------
mclubwithbass_6_022:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte	PEND
@ 023   ----------------------------------------
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_009
@ 026   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 027   ----------------------------------------
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_014
@ 031   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_016
@ 033   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_017
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_016
@ 035   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_017
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_021
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_022
@ 039   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 , v080
	.byte	W30
@ 040   ----------------------------------------
mclubwithbass_6_040:
	.byte		N01   , Cs5 , v100
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        As4 , v100
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        Fs4 , v080
	.byte	W06
	.byte		        As4 , v100
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte	PEND
@ 041   ----------------------------------------
mclubwithbass_6_041:
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        As4 , v100
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        Fs4 , v080
	.byte	W06
	.byte		        As4 , v100
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte	PEND
@ 042   ----------------------------------------
	.byte		        Cs5 
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        As4 , v100
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        Fs4 , v080
	.byte	W06
	.byte		        As4 , v100
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
@ 043   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_041
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_040
@ 045   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W12
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        As4 , v100
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		        Fs4 , v080
	.byte	W06
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
@ 046   ----------------------------------------
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 047   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 048   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 049   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W60
@ 050   ----------------------------------------
mclubwithbass_6_050:
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
	.byte	PEND
@ 051   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 052   ----------------------------------------
mclubwithbass_6_052:
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
	.byte	PEND
@ 053   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 054   ----------------------------------------
mclubwithbass_6_054:
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
	.byte	PEND
@ 055   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 056   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 057   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_052
@ 061   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 062   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_054
@ 063   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 064   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 , v088
	.byte	W06
	.byte		        As4 , v072
	.byte	W06
@ 065   ----------------------------------------
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W60
@ 066   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 067   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_6_050
@ 068   ----------------------------------------
	.byte		N01   , Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W36
@ 069   ----------------------------------------
	.byte	W72
	.byte		N01   
	.byte	W24
@ 070   ----------------------------------------
	.byte		        Fs4 
	.byte	W12
	.byte		        As4 
	.byte	W06
	.byte		        Fs4 
	.byte	W06
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W12
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		        As4 
	.byte	W12
	.byte		        Gs4 , v080
	.byte	W12
	.byte		        Fs4 , v100
	.byte	W06
	.byte		N01   
	.byte	W05
	.byte	GOTO
	 .word	mclubwithbass_6_B1
mclubwithbass_6_B2:
	.byte	FINE

@**************** Track 7 (Midi-Chn.9) ****************@

mclubwithbass_7:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 17
	.byte		VOL   , 110*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_7_B1:
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
mclubwithbass_7_007:
	.byte	W72
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
	.byte	PEND
@ 008   ----------------------------------------
mclubwithbass_7_008:
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N66   , Fs3 
	.byte	W08
	.byte	W36
	.byte	W24
	.byte		N11   , Dn3 
	.byte	W24
	.byte	PEND
@ 009   ----------------------------------------
mclubwithbass_7_009:
	.byte		N03   , Ds3 , v127
	.byte	W04
	.byte		N42   , En3 
	.byte	W08
	.byte	W36
	.byte		N17   , Gn3 , v100
	.byte	W18
	.byte		N11   , Fs3 
	.byte	W06
	.byte	W12
	.byte		N05   , En3 
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N10   , Fs3 
	.byte	W08
	.byte	W06
	.byte		N05   , An2 , v100
	.byte	W18
	.byte		N56   , Dn3 
	.byte	W12
	.byte	W48
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_007
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_008
@ 013   ----------------------------------------
mclubwithbass_7_013:
	.byte		N03   , Ds3 , v127
	.byte	W04
	.byte		N42   , En3 
	.byte	W08
	.byte	W36
	.byte		N17   , Gn3 , v100
	.byte	W18
	.byte		N08   , Fs3 
	.byte	W06
	.byte	W12
	.byte		N05   , En3 
	.byte	W12
	.byte	PEND
@ 014   ----------------------------------------
	.byte		        Fs3 
	.byte	W14
	.byte		N03   , Gs3 , v080
	.byte	W04
	.byte		N76   , An3 , v100
	.byte	W06
	.byte	W24
	.byte	W48
@ 015   ----------------------------------------
	.byte	W60
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        An3 
	.byte	W12
@ 016   ----------------------------------------
mclubwithbass_7_016:
	.byte		N03   , As3 , v127
	.byte	W04
	.byte		TIE   , Bn3 
	.byte	W08
	.byte	W12
	.byte	W24
	.byte	W48
	.byte	PEND
@ 017   ----------------------------------------
	.byte	W11
	.byte		EOT   
	.byte	W13
	.byte		N03   , As3 
	.byte	W04
	.byte		N19   , Bn3 
	.byte	W08
	.byte	W12
	.byte		N23   , An3 , v100
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W24
@ 018   ----------------------------------------
mclubwithbass_7_018:
	.byte		N03   , Gs3 , v127
	.byte	W04
	.byte		TIE   , An3 
	.byte	W08
	.byte	W12
	.byte	W24
	.byte	W48
	.byte	PEND
@ 019   ----------------------------------------
	.byte	W11
	.byte		EOT   
	.byte	W13
	.byte		N03   , Gs3 
	.byte	W04
	.byte		N19   , An3 
	.byte	W08
	.byte	W12
	.byte		N23   , Gn3 , v100
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W24
@ 020   ----------------------------------------
mclubwithbass_7_020:
	.byte		N92   , Gn3 , v100
	.byte	W48
	.byte	W48
	.byte	PEND
@ 021   ----------------------------------------
mclubwithbass_7_021:
	.byte	W24
	.byte		N23   , Gn3 , v100
	.byte	W24
	.byte		        Fs3 
	.byte	W24
	.byte		N11   , En3 
	.byte	W24
	.byte	PEND
@ 022   ----------------------------------------
	.byte		N03   , Ds3 , v080
	.byte	W04
	.byte		N07   , En3 
	.byte	W04
	.byte	W04
	.byte		TIE   , Dn3 , v100
	.byte	W06
	.byte	W06
	.byte	W24
	.byte	W48
@ 023   ----------------------------------------
	.byte	W23
	.byte		EOT   
	.byte	W48
	.byte	W01
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_009
@ 026   ----------------------------------------
	.byte		N03   , Fn3 , v127
	.byte	W04
	.byte		N10   , Fs3 
	.byte	W08
	.byte	W06
	.byte		N05   , An2 , v100
	.byte	W18
	.byte		N68   , Dn3 
	.byte	W12
	.byte	W48
@ 027   ----------------------------------------
	.byte	W72
	.byte		N05   , An2 , v080
	.byte	W06
	.byte		N02   , Bn2 
	.byte	W06
	.byte		N05   , Dn3 , v100
	.byte	W12
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_013
@ 030   ----------------------------------------
	.byte		N05   , Fs3 , v100
	.byte	W14
	.byte		N03   , Gs3 , v080
	.byte	W04
	.byte		N88   , An3 , v100
	.byte	W06
	.byte	W24
	.byte	W48
@ 031   ----------------------------------------
	.byte	W60
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Gn3 
	.byte	W06
	.byte		        An3 
	.byte	W12
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_016
@ 033   ----------------------------------------
	.byte	W11
	.byte		EOT   , Bn3 
	.byte	W13
	.byte		N03   , As3 , v127
	.byte	W04
	.byte		N19   , Bn3 
	.byte	W08
	.byte	W12
	.byte		N23   , An3 , v100
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W24
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_018
@ 035   ----------------------------------------
	.byte	W11
	.byte		EOT   , An3 
	.byte	W13
	.byte		N03   , Gs3 , v127
	.byte	W04
	.byte		N19   , An3 
	.byte	W08
	.byte	W12
	.byte		N23   , Gn3 , v100
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W24
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_020
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_021
@ 038   ----------------------------------------
	.byte		N03   , Ds3 , v080
	.byte	W04
	.byte		N07   , En3 
	.byte	W04
	.byte	W04
	.byte		N80   , Dn3 , v100
	.byte	W06
	.byte	W06
	.byte	W24
	.byte	W48
@ 039   ----------------------------------------
mclubwithbass_7_039:
	.byte	W54
	.byte		N08   , Dn4 , v100
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte	PEND
@ 040   ----------------------------------------
mclubwithbass_7_040:
	.byte		N08   , Cn4 , v100
	.byte	W18
	.byte		N05   , Gn3 
	.byte	W18
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 041   ----------------------------------------
	.byte	W54
	.byte		N17   , Cn3 
	.byte	W18
	.byte		N05   , Gn2 
	.byte	W12
	.byte		        Cn3 
	.byte	W12
@ 042   ----------------------------------------
	.byte		N08   , An2 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W60
@ 043   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_039
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_7_040
@ 045   ----------------------------------------
	.byte	W96
@ 046   ----------------------------------------
	.byte	W96
@ 047   ----------------------------------------
	.byte	W96
@ 048   ----------------------------------------
	.byte	W96
@ 049   ----------------------------------------
	.byte	W48
	.byte		N03   , Fs2 , v100
	.byte	W03
	.byte		        An2 
	.byte	W03
	.byte		        Bn2 
	.byte	W04
	.byte		        Cs3 
	.byte	W03
	.byte		N01   , En3 
	.byte	W04
	.byte		N03   , Fs3 
	.byte	W03
	.byte		        Cs4 
	.byte	W04
	.byte		N03   
	.byte	W03
	.byte		N01   , An3 
	.byte	W03
	.byte		N03   , An2 
	.byte	W04
	.byte		N06   , En3 
	.byte	W07
	.byte		        En4 
	.byte	W07
@ 050   ----------------------------------------
	.byte	W96
@ 051   ----------------------------------------
	.byte	W96
@ 052   ----------------------------------------
	.byte	W96
@ 053   ----------------------------------------
	.byte	W96
@ 054   ----------------------------------------
	.byte	W96
@ 055   ----------------------------------------
	.byte	W96
@ 056   ----------------------------------------
	.byte	W96
@ 057   ----------------------------------------
	.byte	W96
@ 058   ----------------------------------------
	.byte	W96
@ 059   ----------------------------------------
	.byte	W96
@ 060   ----------------------------------------
	.byte	W96
@ 061   ----------------------------------------
	.byte	W96
@ 062   ----------------------------------------
	.byte	W96
@ 063   ----------------------------------------
	.byte	W96
@ 064   ----------------------------------------
	.byte	W96
@ 065   ----------------------------------------
	.byte	W96
@ 066   ----------------------------------------
	.byte		N05   , Gn3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 067   ----------------------------------------
	.byte		        Fs3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 068   ----------------------------------------
	.byte		        Gn3 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N80   , Gn2 
	.byte	W12
@ 069   ----------------------------------------
	.byte	W48
	.byte	W48
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_7_B1
mclubwithbass_7_B2:
	.byte	FINE

@**************** Track 8 (Midi-Chn.10) ****************@

mclubwithbass_8:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 127*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N23   , Cn1 , v120
	.byte		N23   , Cs2 
	.byte	W54
	.byte		N17   , Cn1 
	.byte	W42
mclubwithbass_8_B1:
@ 001   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte	W54
	.byte		N17   
	.byte	W18
	.byte		N23   , En2 , v100
	.byte	W24
@ 002   ----------------------------------------
	.byte		        Cn1 , v120
	.byte	W54
	.byte		N17   
	.byte	W42
@ 003   ----------------------------------------
	.byte		N23   
	.byte	W48
	.byte		N05   , En1 , v100
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
@ 004   ----------------------------------------
mclubwithbass_8_004:
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 007   ----------------------------------------
mclubwithbass_8_007:
	.byte		N23   , Cn1 , v080
	.byte		N23   , En2 , v100
	.byte	W24
	.byte		        En1 , v120
	.byte	W24
	.byte		N05   , Cn1 
	.byte	W06
	.byte		        En1 , v116
	.byte	W12
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte	PEND
@ 008   ----------------------------------------
mclubwithbass_8_008:
	.byte		N23   , Cn1 , v120
	.byte		N23   , Cs2 , v100
	.byte	W24
	.byte		        En1 , v120
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte	PEND
@ 009   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_008
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 014   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 015   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 016   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte		N23   , Gn2 , v100
	.byte	W24
	.byte		        En1 , v120
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        En1 
	.byte	W24
@ 017   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 018   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 022   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 023   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_007
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_008
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 026   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 027   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_008
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 030   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 031   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 032   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte		N23   , En2 , v100
	.byte	W24
	.byte		        En1 , v120
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		        En1 
	.byte	W24
@ 033   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_004
@ 039   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        En1 
	.byte	W24
	.byte		N05   , Cn1 
	.byte	W06
	.byte		N11   , En1 , v116
	.byte	W12
	.byte		N02   
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N05   
	.byte		N05   , An2 , v100
	.byte	W06
	.byte		        En1 , v116
	.byte	W06
	.byte		N05   
	.byte		N05   , En2 , v100
	.byte	W06
	.byte		        En1 , v116
	.byte	W06
@ 040   ----------------------------------------
mclubwithbass_8_040:
	.byte		N11   , Cn1 , v120
	.byte	W18
	.byte		N05   , En1 
	.byte	W12
	.byte		N17   , Cn1 
	.byte	W30
	.byte		N11   
	.byte	W12
	.byte		N23   , En1 
	.byte	W24
	.byte	PEND
@ 041   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_040
@ 042   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_040
@ 043   ----------------------------------------
	.byte		N11   , Cn1 , v120
	.byte	W18
	.byte		N05   , En1 
	.byte	W12
	.byte		N17   , Cn1 
	.byte	W30
	.byte		N11   
	.byte	W12
	.byte		N05   , En1 
	.byte	W06
	.byte		        En1 , v080
	.byte	W18
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_040
@ 045   ----------------------------------------
	.byte		N11   , Cn1 , v120
	.byte	W18
	.byte		N05   , En1 
	.byte	W12
	.byte		N17   , Cn1 
	.byte	W36
	.byte		N02   , En1 , v116
	.byte	W03
	.byte		N02   
	.byte	W03
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 046   ----------------------------------------
	.byte		N23   , Bn0 , v080
	.byte		N23   , Cs2 
	.byte	W24
	.byte		        Dn1 , v120
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N05   , En1 , v116
	.byte	W12
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v056
	.byte	W06
@ 047   ----------------------------------------
mclubwithbass_8_047:
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N05   , En1 , v116
	.byte	W12
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v056
	.byte	W06
	.byte	PEND
@ 048   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 049   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte		N23   , En2 , v080
	.byte	W24
	.byte		N05   , En1 , v116
	.byte	W24
	.byte		        En1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N03   
	.byte	W04
	.byte		        Dn1 , v080
	.byte	W04
	.byte		N03   
	.byte	W04
	.byte		N05   , En1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 050   ----------------------------------------
	.byte		N23   , Cs2 
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N05   , En1 , v116
	.byte	W12
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v056
	.byte	W06
@ 051   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 052   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 053   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 054   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 055   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 056   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 057   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N11   , Cn1 
	.byte	W12
	.byte		N05   , Dn1 
	.byte	W06
	.byte		        Dn1 , v080
	.byte	W06
	.byte		        Dn1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   
	.byte	W12
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 061   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 062   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 063   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 064   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 065   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N02   , Cn1 , v080
	.byte		N02   , En1 , v116
	.byte	W03
	.byte		N02   
	.byte	W03
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
	.byte		        En1 , v076
	.byte	W06
@ 066   ----------------------------------------
	.byte		N23   , Bn0 , v120
	.byte		N23   , Cs2 
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		        Cn1 
	.byte	W24
	.byte		N05   , En1 , v116
	.byte	W12
	.byte		        En1 , v080
	.byte	W06
	.byte		        En1 , v056
	.byte	W06
@ 067   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_8_047
@ 068   ----------------------------------------
	.byte		N23   , Cn1 , v120
	.byte	W24
	.byte		        Dn1 
	.byte	W24
	.byte		N11   , Cn1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		N11   
	.byte		N11   , En2 , v100
	.byte	W12
@ 069   ----------------------------------------
	.byte	W72
	.byte		N23   , Cs2 , v120
	.byte	W24
@ 070   ----------------------------------------
	.byte		        Cn1 
	.byte	W54
	.byte		N17   
	.byte	W18
	.byte		N23   , En0 , v100
	.byte	W23
	.byte	GOTO
	 .word	mclubwithbass_8_B1
mclubwithbass_8_B2:
	.byte	FINE

@**************** Track 9 (Midi-Chn.11) ****************@

mclubwithbass_9:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 87
	.byte		VOL   , 110*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_9_B1:
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W96
@ 004   ----------------------------------------
mclubwithbass_9_004:
	.byte	W24
	.byte		N11   , An2 , v100
	.byte	W24
	.byte		        An2 , v060
	.byte	W24
	.byte		        An2 , v048
	.byte	W24
	.byte	PEND
@ 005   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 006   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 007   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 008   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 009   ----------------------------------------
mclubwithbass_9_009:
	.byte	W24
	.byte		N11   , Gn2 , v100
	.byte	W24
	.byte		        Gn2 , v060
	.byte	W24
	.byte		        Gn2 , v048
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 011   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 012   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 015   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 016   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 017   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 018   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 019   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 020   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 021   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 022   ----------------------------------------
mclubwithbass_9_022:
	.byte	W24
	.byte		N11   , Fs2 , v100
	.byte	W24
	.byte		        Fs2 , v060
	.byte	W24
	.byte		        Fs2 , v048
	.byte	W24
	.byte	PEND
@ 023   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 024   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 025   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 026   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 027   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 028   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 029   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 031   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 032   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 033   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 034   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 035   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_004
@ 036   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 037   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_009
@ 038   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_022
@ 039   ----------------------------------------
	.byte	W24
	.byte		N11   , An2 , v100
	.byte	W24
	.byte		        An2 , v060
	.byte	W24
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		        Cs1 
	.byte	W12
@ 040   ----------------------------------------
mclubwithbass_9_040:
	.byte		N08   , Cn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N08   
	.byte	W06
	.byte		N05   , Gn2 
	.byte	W06
	.byte		        Cn3 
	.byte	W06
	.byte		N11   , Cn2 
	.byte		N11   , En3 
	.byte	W24
	.byte	PEND
@ 041   ----------------------------------------
	.byte		N08   , Cn2 
	.byte	W18
	.byte		N05   , Cn1 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N17   , Gn1 
	.byte	W18
	.byte		N05   , Cn1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 042   ----------------------------------------
	.byte		N08   , Dn2 
	.byte	W18
	.byte		N05   , Dn1 
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		        Dn2 
	.byte	W06
	.byte		        Fs2 
	.byte	W06
	.byte		        An2 
	.byte	W06
	.byte		N11   , Dn3 
	.byte	W24
@ 043   ----------------------------------------
	.byte		N08   , Dn2 
	.byte	W18
	.byte		N05   , Dn1 
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N11   , An2 , v060
	.byte	W24
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		        Cs1 
	.byte	W12
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_040
@ 045   ----------------------------------------
	.byte		N08   , Cn1 , v100
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N05   
	.byte	W18
	.byte		N17   
	.byte	W18
	.byte		N05   , Cs1 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
@ 046   ----------------------------------------
	.byte		        En1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Bn1 
	.byte	W12
@ 047   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        En2 
	.byte	W06
	.byte		        En1 
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
@ 048   ----------------------------------------
	.byte		N05   , An1 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   , An0 
	.byte	W12
	.byte		        An1 
	.byte	W06
	.byte		        An0 
	.byte	W12
	.byte		N11   , An1 
	.byte	W12
	.byte		        En1 
	.byte	W12
@ 049   ----------------------------------------
	.byte		N05   , An0 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N11   
	.byte	W24
	.byte		        As0 
	.byte	W12
	.byte		        Bn0 
	.byte	W12
	.byte		        Cn1 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
@ 050   ----------------------------------------
mclubwithbass_9_050:
	.byte		N05   , An2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 051   ----------------------------------------
mclubwithbass_9_051:
	.byte		N05   , Bn2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 052   ----------------------------------------
mclubwithbass_9_052:
	.byte		N05   , Cs3 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 053   ----------------------------------------
mclubwithbass_9_053:
	.byte		N05   , Dn3 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 054   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_053
@ 055   ----------------------------------------
	.byte		N05   , Bn2 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		        Fs3 
	.byte	W12
	.byte		        An2 
	.byte	W12
@ 056   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_053
@ 057   ----------------------------------------
	.byte		N05   , Cs3 , v100
	.byte	W12
	.byte		N05   
	.byte	W24
	.byte	W03
	.byte		N02   , As2 
	.byte	W03
	.byte		N05   , Bn2 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs2 
	.byte	W12
	.byte		        En2 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_050
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_051
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_052
@ 061   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_051
@ 062   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_053
@ 063   ----------------------------------------
	.byte		N05   , Dn3 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N11   , Fs1 
	.byte	W12
@ 064   ----------------------------------------
	.byte		N05   , En1 
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        En1 
	.byte	W06
	.byte		N11   , Fs1 
	.byte	W12
	.byte		        Gn1 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
@ 065   ----------------------------------------
	.byte		N05   , An1 
	.byte	W12
	.byte		        An0 
	.byte	W12
	.byte		N11   
	.byte	W15
	.byte		N02   , As0 
	.byte	W03
	.byte		N05   , Bn0 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		        Cs0 
	.byte	W12
@ 066   ----------------------------------------
mclubwithbass_9_066:
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 067   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_9_066
@ 068   ----------------------------------------
	.byte		N05   , Dn1 , v100
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W12
	.byte		N78   , Gn1 
	.byte	W12
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_9_B1
mclubwithbass_9_B2:
	.byte	FINE

@**************** Track 10 (Midi-Chn.12) ****************@

mclubwithbass_10:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 119*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_10_B1:
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
	.byte	W96
@ 038   ----------------------------------------
	.byte	W96
@ 039   ----------------------------------------
mclubwithbass_10_039:
	.byte	W54
	.byte		N08   , Dn4 , v100
	.byte	W18
	.byte		N05   
	.byte	W12
	.byte		        Cs4 
	.byte	W12
	.byte	PEND
@ 040   ----------------------------------------
mclubwithbass_10_040:
	.byte		N08   , Cn4 , v100
	.byte	W18
	.byte		N05   , Gn3 
	.byte	W18
	.byte		N05   
	.byte	W60
	.byte	PEND
@ 041   ----------------------------------------
mclubwithbass_10_041:
	.byte	W54
	.byte		N17   , Bn3 , v100
	.byte	W18
	.byte		N05   , An3 
	.byte	W12
	.byte		        Gn3 
	.byte	W12
	.byte	PEND
@ 042   ----------------------------------------
	.byte		N08   , An3 
	.byte	W18
	.byte		N32   , Fs3 
	.byte	W78
@ 043   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_039
@ 044   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_040
@ 045   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_041
@ 046   ----------------------------------------
	.byte		TIE   , An3 , v100
	.byte	W96
@ 047   ----------------------------------------
	.byte	W40
	.byte		EOT   
	.byte	W08
	.byte		N17   , Dn4 
	.byte	W18
	.byte		N05   , Cs4 
	.byte	W18
	.byte		        Bn3 
	.byte	W12
@ 048   ----------------------------------------
	.byte		N08   
	.byte	W18
	.byte		TIE   , An3 
	.byte	W78
@ 049   ----------------------------------------
	.byte	W40
	.byte	W01
	.byte		EOT   
	.byte	W54
	.byte	W01
@ 050   ----------------------------------------
mclubwithbass_10_050:
	.byte		N68   , Fs3 , v100
	.byte	W72
	.byte		N05   , Gn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte	PEND
@ 051   ----------------------------------------
mclubwithbass_10_051:
	.byte		N11   , Bn3 , v100
	.byte	W24
	.byte		N44   , Fs4 
	.byte	W48
	.byte		N05   , En4 
	.byte	W12
	.byte		        Dn4 
	.byte	W12
	.byte	PEND
@ 052   ----------------------------------------
mclubwithbass_10_052:
	.byte		N08   , Cs4 , v100
	.byte	W18
	.byte		N48   , An3 
	.byte	W54
	.byte		N05   , Fs3 
	.byte	W12
	.byte		N56   , Bn3 
	.byte	W12
	.byte	PEND
@ 053   ----------------------------------------
mclubwithbass_10_053:
	.byte	W48
	.byte		N22   , An3 , v100
	.byte	W24
	.byte		        Gn3 
	.byte	W24
	.byte	PEND
@ 054   ----------------------------------------
mclubwithbass_10_054:
	.byte		N56   , Fs3 , v100
	.byte	W60
	.byte		N05   , Gn3 
	.byte	W12
	.byte		        An3 
	.byte	W12
	.byte		N56   , Dn3 
	.byte	W12
	.byte	PEND
@ 055   ----------------------------------------
	.byte	W48
	.byte		N11   , En3 
	.byte	W12
	.byte		        Fs3 
	.byte	W24
	.byte		TIE   , An3 
	.byte	W12
@ 056   ----------------------------------------
	.byte	W96
@ 057   ----------------------------------------
	.byte	W28
	.byte		EOT   
	.byte	W68
@ 058   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_050
@ 059   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_051
@ 060   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_052
@ 061   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_053
@ 062   ----------------------------------------
	.byte	PATT
	 .word	mclubwithbass_10_054
@ 063   ----------------------------------------
	.byte	W48
	.byte		N11   , En3 , v100
	.byte	W12
	.byte		        Fs3 
	.byte	W24
	.byte		N32   , An3 
	.byte	W12
@ 064   ----------------------------------------
	.byte	W24
	.byte		N11   , Gn3 
	.byte	W12
	.byte		        Fs3 
	.byte	W24
	.byte		        En3 
	.byte	W24
	.byte		N32   , Gn3 
	.byte	W12
@ 065   ----------------------------------------
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W12
	.byte		        En3 
	.byte	W24
	.byte		        Dn3 
	.byte	W24
	.byte		TIE   
	.byte	W12
@ 066   ----------------------------------------
	.byte	W96
@ 067   ----------------------------------------
	.byte	W84
	.byte	W01
	.byte		EOT   
	.byte	W11
@ 068   ----------------------------------------
	.byte		N68   
	.byte	W84
	.byte		N78   
	.byte	W12
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_10_B1
mclubwithbass_10_B2:
	.byte	FINE

@**************** Track 11 (Midi-Chn.13) ****************@

mclubwithbass_11:
	.byte	KEYSH , mclubwithbass_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 109*mclubwithbass_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W96
mclubwithbass_11_B1:
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
	.byte	W96
@ 043   ----------------------------------------
	.byte	W96
@ 044   ----------------------------------------
	.byte	W96
@ 045   ----------------------------------------
	.byte	W54
	.byte		N17   , Gn3 , v100
	.byte	W18
	.byte		N05   , Fs3 
	.byte	W12
	.byte		        Dn3 
	.byte	W12
@ 046   ----------------------------------------
	.byte		TIE   , En3 
	.byte	W96
@ 047   ----------------------------------------
	.byte	W40
	.byte		EOT   
	.byte	W08
	.byte		N17   , An3 
	.byte	W18
	.byte		N05   , Gn3 
	.byte	W18
	.byte		        En3 
	.byte	W12
@ 048   ----------------------------------------
	.byte		N08   
	.byte	W18
	.byte		N72   , Dn3 
	.byte	W78
@ 049   ----------------------------------------
	.byte		N44   , Cs3 
	.byte	W96
@ 050   ----------------------------------------
	.byte	W96
@ 051   ----------------------------------------
	.byte	W96
@ 052   ----------------------------------------
	.byte	W96
@ 053   ----------------------------------------
	.byte	W96
@ 054   ----------------------------------------
	.byte	W96
@ 055   ----------------------------------------
	.byte	W96
@ 056   ----------------------------------------
	.byte	W96
@ 057   ----------------------------------------
	.byte	W96
@ 058   ----------------------------------------
	.byte	W96
@ 059   ----------------------------------------
	.byte	W96
@ 060   ----------------------------------------
	.byte	W96
@ 061   ----------------------------------------
	.byte	W96
@ 062   ----------------------------------------
	.byte	W96
@ 063   ----------------------------------------
	.byte	W96
@ 064   ----------------------------------------
	.byte		N22   , Fs3 
	.byte	W24
	.byte		N11   , En3 
	.byte	W12
	.byte		        Dn3 
	.byte	W24
	.byte		        Cs3 
	.byte	W24
	.byte		N32   , En3 
	.byte	W12
@ 065   ----------------------------------------
	.byte	W24
	.byte		N11   , Dn3 
	.byte	W12
	.byte		        Cs3 
	.byte	W24
	.byte		        Bn2 
	.byte	W24
	.byte		        An2 
	.byte	W12
@ 066   ----------------------------------------
	.byte		N78   , Gn2 
	.byte	W84
	.byte		TIE   , Fs2 
	.byte	W12
@ 067   ----------------------------------------
	.byte	W90
	.byte		EOT   
	.byte	W06
@ 068   ----------------------------------------
	.byte		N68   , Gn2 
	.byte	W84
	.byte		N78   
	.byte	W12
@ 069   ----------------------------------------
	.byte	W96
@ 070   ----------------------------------------
	.byte	W92
	.byte	W03
	.byte	GOTO
	 .word	mclubwithbass_11_B1
mclubwithbass_11_B2:
	.byte	FINE

@******************************************************@
	.align	2

mclubwithbass:
	.byte	11	@ NumTrks
	.byte	0	@ NumBlks
	.byte	mclubwithbass_pri	@ Priority
	.byte	mclubwithbass_rev	@ Reverb.

	.word	mclubwithbass_grp

	.word	mclubwithbass_1
	.word	mclubwithbass_2
	.word	mclubwithbass_3
	.word	mclubwithbass_4
	.word	mclubwithbass_5
	.word	mclubwithbass_6
	.word	mclubwithbass_7
	.word	mclubwithbass_8
	.word	mclubwithbass_9
	.word	mclubwithbass_10
	.word	mclubwithbass_11

	.end
