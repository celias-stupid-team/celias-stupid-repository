	.include "MPlayDef.s"

	.equ	Castle_grp, voicegroup000
	.equ	Castle_pri, 0
	.equ	Castle_rev, 0
	.equ	Castle_mvl, 127
	.equ	Castle_key, 0
	.equ	Castle_tbs, 1
	.equ	Castle_exg, 0
	.equ	Castle_cmp, 1

	.section .rodata
	.global	Castle
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

Castle_1:
	.byte	KEYSH , Castle_key+0
Castle_1_B1:
@ 000   ----------------------------------------
	.byte	TEMPO , 145*Castle_tbs/2
	.byte		VOICE , 48
	.byte		VOL   , 0*Castle_mvl/mxv
	.byte	W10
	.byte		VOICE , 48
	.byte		PAN   , c_v-44
	.byte		VOL   , 127*Castle_mvl/mxv
	.byte		N04   , Gn3 , v104
	.byte	W36
	.byte		N07   , An3 , v100
	.byte	W24
	.byte		        Gn3 , v104
	.byte	W24
	.byte		N12   , Fs3 , v088
	.byte	W02
@ 001   ----------------------------------------
Castle_1_001:
	.byte	W10
	.byte		N10   , Gn3 , v096
	.byte	W12
	.byte		N14   , Cn4 
	.byte	W12
	.byte		N04   , En4 , v104
	.byte	W60
	.byte	W02
	.byte	PEND
@ 002   ----------------------------------------
Castle_1_002:
	.byte	W10
	.byte		N05   , Fn3 , v104
	.byte	W36
	.byte		N04   , Gn3 , v108
	.byte	W24
	.byte		N06   , Fn3 , v092
	.byte	W24
	.byte		N07   , En3 
	.byte	W02
	.byte	PEND
@ 003   ----------------------------------------
Castle_1_003:
	.byte	W10
	.byte		N07   , Fn3 , v100
	.byte	W12
	.byte		N11   , An3 , v096
	.byte	W12
	.byte		N03   , Dn4 , v100
	.byte	W60
	.byte	W02
	.byte	PEND
@ 004   ----------------------------------------
Castle_1_004:
	.byte	W10
	.byte		N07   , En3 , v100
	.byte	W36
	.byte		N04   , Fn3 , v104
	.byte	W24
	.byte		N07   , En3 , v100
	.byte	W24
	.byte		N11   , Ds3 , v092
	.byte	W02
	.byte	PEND
@ 005   ----------------------------------------
	.byte	W10
	.byte		N12   , En3 
	.byte	W12
	.byte		N13   , An3 , v096
	.byte	W12
	.byte		N07   , Cn4 , v092
	.byte	W36
	.byte		N09   
	.byte	W12
	.byte		N10   , Dn4 , v088
	.byte	W12
	.byte		N08   , En4 , v084
	.byte	W02
@ 006   ----------------------------------------
	.byte	W10
	.byte		N14   , Dn4 , v092
	.byte	W12
	.byte		N10   , Cn4 
	.byte	W12
	.byte		N16   , An3 , v084
	.byte	W12
	.byte		N24   , Fs3 , v096
	.byte	W24
	.byte		N12   , En3 , v076
	.byte	W12
	.byte		N13   , Ds3 , v084
	.byte	W12
	.byte		N12   , Dn3 , v092
	.byte	W02
@ 007   ----------------------------------------
	.byte	W10
	.byte		N11   , Cn3 
	.byte	W12
	.byte		N12   , An2 , v084
	.byte	W12
	.byte		        Fs2 , v088
	.byte	W12
	.byte		N54   , Dn2 
	.byte	W48
	.byte	W02
@ 008   ----------------------------------------
	.byte	W10
	.byte		N04   , Gn3 , v104
	.byte	W36
	.byte		N07   , An3 , v100
	.byte	W24
	.byte		        Gn3 , v104
	.byte	W24
	.byte		N12   , Fs3 , v088
	.byte	W02
@ 009   ----------------------------------------
	.byte	PATT
	 .word	Castle_1_001
@ 010   ----------------------------------------
	.byte	PATT
	 .word	Castle_1_002
@ 011   ----------------------------------------
	.byte	PATT
	 .word	Castle_1_003
@ 012   ----------------------------------------
	.byte	PATT
	 .word	Castle_1_004
@ 013   ----------------------------------------
	.byte	W10
	.byte		N12   , En3 , v092
	.byte	W12
	.byte		N13   , An3 , v096
	.byte	W12
	.byte		N07   , Cn4 , v092
	.byte	W36
	.byte		N09   , An3 
	.byte	W12
	.byte		N10   , Bn3 , v088
	.byte	W12
	.byte		N08   , Cn4 , v084
	.byte	W02
@ 014   ----------------------------------------
	.byte	W10
	.byte		N13   , Dn4 , v096
	.byte	W12
	.byte		N12   , Cn4 , v092
	.byte	W12
	.byte		        Dn4 , v104
	.byte	W12
	.byte		N24   , An3 , v096
	.byte	W24
	.byte		N12   , Bn3 , v092
	.byte	W12
	.byte		N15   , An3 
	.byte	W12
	.byte		N07   , Bn3 , v084
	.byte	W02
@ 015   ----------------------------------------
	.byte	W10
	.byte		        Cn4 , v104
	.byte	W24
	.byte		N07   
	.byte	W36
	.byte		N05   , Cn4 , v108
	.byte	W12
	.byte		        Cn4 , v104
	.byte	W12
	.byte		N09   , Cn4 , v100
	.byte	W02
@ 016   ----------------------------------------
	.byte	W96
@ 017   ----------------------------------------
	.byte	W10
	.byte		N32   , Cn2 , v084
	.byte	W36
	.byte		N54   , Gn2 , v088
	.byte	W48
	.byte	W02
@ 018   ----------------------------------------
	.byte	W10
	.byte		N36   , Fn2 , v080
	.byte	W36
	.byte		N13   , En2 
	.byte	W12
	.byte		N15   , Fn2 
	.byte	W12
	.byte		N12   , En2 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
	.byte		N15   , Cn2 
	.byte	W02
@ 019   ----------------------------------------
	.byte	W10
	.byte		N12   , Dn2 
	.byte	W12
	.byte		N13   , Fn2 , v076
	.byte	W12
	.byte		N08   , An2 , v072
	.byte	W12
	.byte		N36   , Cn3 , v080
	.byte	W36
	.byte		N24   , An2 
	.byte	W14
@ 020   ----------------------------------------
	.byte	W10
	.byte		        Fn2 
	.byte	W36
	.byte		N32   
	.byte	W36
	.byte		N22   , Dn2 
	.byte	W14
@ 021   ----------------------------------------
	.byte	W10
	.byte		N14   , En2 , v072
	.byte	W12
	.byte		N13   , Gn2 , v084
	.byte	W12
	.byte		N11   , Bn2 , v076
	.byte	W12
	.byte		N24   , En3 , v084
	.byte	W24
	.byte		N11   , Dn3 , v080
	.byte	W12
	.byte		N15   , Cn3 
	.byte	W12
	.byte		        En3 , v084
	.byte	W02
@ 022   ----------------------------------------
	.byte	W10
	.byte		        Dn3 , v076
	.byte	W12
	.byte		N07   , Cn3 , v080
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N24   
	.byte	W24
	.byte		N12   , Bn2 
	.byte	W12
	.byte		        An2 , v072
	.byte	W12
	.byte		N11   , Cn3 , v076
	.byte	W02
@ 023   ----------------------------------------
	.byte	W10
	.byte		N07   , An2 , v080
	.byte	W12
	.byte		        An2 , v064
	.byte	W12
	.byte		N05   , An2 , v080
	.byte	W12
	.byte		N21   , Fs2 
	.byte	W24
	.byte		N07   , An2 
	.byte	W12
	.byte		N05   , An2 , v084
	.byte	W12
	.byte		        An2 , v088
	.byte	W02
@ 024   ----------------------------------------
	.byte	W10
	.byte		N07   , An2 , v084
	.byte	W12
	.byte		N05   , An2 , v080
	.byte	W12
	.byte		N07   , An2 , v076
	.byte	W12
	.byte		N23   , Fn2 
	.byte	W24
	.byte		N06   , An2 , v080
	.byte	W12
	.byte		N05   , An2 , v084
	.byte	W12
	.byte		N09   , An2 , v076
	.byte	W02
@ 025   ----------------------------------------
	.byte	W10
	.byte		N07   , Gn2 , v080
	.byte	W12
	.byte		N05   , Gn2 , v084
	.byte	W12
	.byte		N07   , Gn2 , v088
	.byte	W12
	.byte		N20   , En2 , v080
	.byte	W24
	.byte		N12   
	.byte	W12
	.byte		N13   , Gn2 , v084
	.byte	W12
	.byte		N12   , Bn2 , v080
	.byte	W02
@ 026   ----------------------------------------
	.byte	W10
	.byte		N15   , Dn3 , v088
	.byte	W12
	.byte		N07   , Cn3 , v080
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N08   , Bn2 
	.byte	W12
	.byte		N12   , Bn2 , v084
	.byte	W12
	.byte		N06   , An2 , v076
	.byte	W12
	.byte		N11   , Fn2 
	.byte	W12
	.byte		N08   , Gn2 , v080
	.byte	W02
@ 027   ----------------------------------------
	.byte	W10
	.byte		N30   , Cn2 , v088
	.byte	W36
	.byte		N52   , Gn2 
	.byte	W48
	.byte	W02
@ 028   ----------------------------------------
	.byte	W10
	.byte		N36   , Fn2 , v080
	.byte	W36
	.byte		N10   , En2 , v084
	.byte	W12
	.byte		N15   , Fn2 
	.byte	W12
	.byte		N10   , En2 , v080
	.byte	W12
	.byte		N12   , Dn2 , v076
	.byte	W12
	.byte		N11   , Cn2 , v080
	.byte	W02
@ 029   ----------------------------------------
	.byte	W10
	.byte		N14   , Dn2 
	.byte	W12
	.byte		N10   , Fn2 , v072
	.byte	W12
	.byte		N11   , An2 
	.byte	W12
	.byte		N32   , Cn3 , v088
	.byte	W36
	.byte		N21   , An2 , v080
	.byte	W14
@ 030   ----------------------------------------
	.byte	W10
	.byte		N24   , Fn2 , v084
	.byte	W36
	.byte		N32   , Fn2 , v080
	.byte	W36
	.byte		N22   , Dn2 
	.byte	W14
@ 031   ----------------------------------------
	.byte	W10
	.byte		N15   , En2 , v084
	.byte	W12
	.byte		N12   , Gn2 , v080
	.byte	W12
	.byte		N10   , Bn2 
	.byte	W12
	.byte		N28   , En3 
	.byte	W24
	.byte		N13   , Dn3 
	.byte	W12
	.byte		N12   , Cn3 
	.byte	W12
	.byte		N13   , En3 , v084
	.byte	W02
@ 032   ----------------------------------------
	.byte	W10
	.byte		N15   , Dn3 , v080
	.byte	W12
	.byte		N07   , Cn3 
	.byte	W12
	.byte		N05   , Cn3 , v084
	.byte	W12
	.byte		N21   
	.byte	W24
	.byte		N10   , Bn2 , v080
	.byte	W12
	.byte		N12   , An2 , v076
	.byte	W12
	.byte		N11   , Cn3 , v080
	.byte	W02
@ 033   ----------------------------------------
	.byte	W10
	.byte		N05   , An2 
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N07   , An2 , v076
	.byte	W12
	.byte		N24   , Fs2 , v084
	.byte	W24
	.byte		N06   , An2 , v080
	.byte	W12
	.byte		N04   , An2 , v084
	.byte	W12
	.byte		N05   , An2 , v080
	.byte	W02
@ 034   ----------------------------------------
	.byte	W10
	.byte		N06   
	.byte	W12
	.byte		N04   , An2 , v084
	.byte	W12
	.byte		N07   , An2 , v080
	.byte	W12
	.byte		N22   , Fn2 
	.byte	W24
	.byte		N05   , Fn2 , v084
	.byte	W12
	.byte		        Fn2 , v080
	.byte	W12
	.byte		N06   , Fn2 , v076
	.byte	W02
@ 035   ----------------------------------------
	.byte	W10
	.byte		        En2 , v088
	.byte	W24
	.byte		N08   , En2 , v084
	.byte	W36
	.byte		N07   , Fn2 , v080
	.byte	W12
	.byte		N08   , Fn2 , v068
	.byte	W12
	.byte		N12   , En2 , v084
	.byte	W02
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W12
	.byte	GOTO
	 .word	Castle_1_B1
Castle_1_B2:
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

Castle_2:
	.byte	KEYSH , Castle_key+0
Castle_2_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte	W10
	.byte		        48
	.byte		VOL   , 127*Castle_mvl/mxv
	.byte		PAN   , c_v-24
	.byte		N04   , En3 , v104
	.byte	W36
	.byte		N07   , Fn3 , v100
	.byte	W14
	.byte	W10
	.byte		        En3 , v104
	.byte	W24
	.byte		N12   , Ds3 , v088
	.byte	W02
@ 001   ----------------------------------------
Castle_2_001:
	.byte	W10
	.byte		N11   , En3 , v096
	.byte	W06
	.byte		N14   , Gn3 
	.byte	W18
	.byte		N04   , Cn4 , v104
	.byte	W60
	.byte	W02
	.byte	PEND
@ 002   ----------------------------------------
Castle_2_002:
	.byte	W10
	.byte		N05   , Dn3 , v104
	.byte	W36
	.byte		N04   , En3 , v108
	.byte	W24
	.byte		N06   , Dn3 , v092
	.byte	W24
	.byte		N07   , Cs3 
	.byte	W02
	.byte	PEND
@ 003   ----------------------------------------
Castle_2_003:
	.byte	W10
	.byte		N07   , Dn3 , v100
	.byte	W12
	.byte		N11   , Fn3 , v096
	.byte	W12
	.byte		N03   , Bn3 , v100
	.byte	W60
	.byte	W02
	.byte	PEND
@ 004   ----------------------------------------
Castle_2_004:
	.byte	W10
	.byte		N07   , Cn3 , v100
	.byte	W36
	.byte		N04   , Dn3 , v104
	.byte	W24
	.byte		N07   , Cn3 , v100
	.byte	W24
	.byte		N11   , Bn2 , v092
	.byte	W02
	.byte	PEND
@ 005   ----------------------------------------
	.byte	W10
	.byte		N12   , Cn3 
	.byte	W12
	.byte		N13   , En3 , v096
	.byte	W12
	.byte		N07   , An3 , v092
	.byte	W36
	.byte		N09   
	.byte	W12
	.byte		N10   , Bn3 , v088
	.byte	W12
	.byte		N08   , Cn4 , v084
	.byte	W02
@ 006   ----------------------------------------
	.byte	W10
	.byte		N14   , Bn3 , v092
	.byte	W12
	.byte		N10   , An3 
	.byte	W12
	.byte		N16   , Fs3 , v084
	.byte	W12
	.byte		N24   , Dn3 , v096
	.byte	W24
	.byte		N06   , Cn3 , v076
	.byte	W06
	.byte		        Cn3 , v084
	.byte	W18
	.byte		N13   , Cn3 , v092
	.byte	W02
@ 007   ----------------------------------------
	.byte	W10
	.byte		N11   , An2 
	.byte	W06
	.byte		N12   , Fs2 , v084
	.byte	W18
	.byte		        Cn2 , v088
	.byte	W12
	.byte		N54   , An1 
	.byte	W48
	.byte	W02
@ 008   ----------------------------------------
	.byte	W10
	.byte		N04   , En3 , v104
	.byte	W36
	.byte		N07   , Fn3 , v100
	.byte	W24
	.byte		        En3 , v104
	.byte	W24
	.byte		N12   , Ds3 , v088
	.byte	W02
@ 009   ----------------------------------------
	.byte	PATT
	 .word	Castle_2_001
@ 010   ----------------------------------------
	.byte	PATT
	 .word	Castle_2_002
@ 011   ----------------------------------------
	.byte	PATT
	 .word	Castle_2_003
@ 012   ----------------------------------------
	.byte	PATT
	 .word	Castle_2_004
@ 013   ----------------------------------------
	.byte	W10
	.byte		N12   , Cn3 , v092
	.byte	W12
	.byte		N13   , En3 , v096
	.byte	W12
	.byte		N07   , An3 , v092
	.byte	W36
	.byte		N09   , En3 
	.byte	W12
	.byte		N10   , En3 , v088
	.byte	W12
	.byte		N08   , En3 , v084
	.byte	W02
@ 014   ----------------------------------------
	.byte	W10
	.byte		N12   , Fs3 , v092
	.byte	W12
	.byte		N10   
	.byte	W24
	.byte		N24   , Cn3 , v096
	.byte	W24
	.byte		N12   , Dn3 , v076
	.byte	W06
	.byte		N13   , Cn3 , v084
	.byte	W18
	.byte		        Dn3 , v092
	.byte	W02
@ 015   ----------------------------------------
	.byte	W10
	.byte		N05   , En3 , v104
	.byte	W24
	.byte		N05   
	.byte	W36
	.byte		N06   , Fn3 
	.byte	W12
	.byte		N07   , Fn3 , v100
	.byte	W12
	.byte		N09   , En3 , v104
	.byte	W02
@ 016   ----------------------------------------
	.byte	W68
	.byte	W02
	.byte		N11   , Gn2 , v100
	.byte	W12
	.byte		        Fs2 , v092
	.byte	W12
	.byte		N12   , Gn2 , v084
	.byte	W02
@ 017   ----------------------------------------
	.byte	W10
	.byte		        En2 , v092
	.byte	W12
	.byte		N13   , Gn2 , v084
	.byte	W12
	.byte		N12   , Cn3 , v088
	.byte	W12
	.byte		N24   , En3 , v104
	.byte	W24
	.byte		N13   , Cn3 , v092
	.byte	W12
	.byte		N12   , Bn2 , v084
	.byte	W12
	.byte		        Cn3 , v092
	.byte	W02
@ 018   ----------------------------------------
	.byte	W10
	.byte		N11   , Bn2 
	.byte	W12
	.byte		N07   , An2 , v084
	.byte	W12
	.byte		N05   
	.byte	W12
	.byte		N16   , An2 , v092
	.byte	W24
	.byte		N11   , An2 , v096
	.byte	W12
	.byte		N09   , Gs2 , v092
	.byte	W12
	.byte		N12   , An2 , v088
	.byte	W02
@ 019   ----------------------------------------
	.byte	W10
	.byte		        Fn2 , v092
	.byte	W12
	.byte		        An2 , v084
	.byte	W12
	.byte		N13   , En3 , v096
	.byte	W12
	.byte		N23   , Fn3 , v100
	.byte	W24
	.byte		N12   , En3 , v084
	.byte	W12
	.byte		N10   , Dn3 , v096
	.byte	W12
	.byte		N12   , Fn3 
	.byte	W02
@ 020   ----------------------------------------
	.byte	W10
	.byte		        Cn3 
	.byte	W12
	.byte		N07   , Bn2 , v092
	.byte	W12
	.byte		N06   
	.byte	W12
	.byte		N19   , Bn2 , v096
	.byte	W24
	.byte		N09   , Bn2 , v100
	.byte	W12
	.byte		N08   , As2 , v088
	.byte	W12
	.byte		        Bn2 
	.byte	W02
@ 021   ----------------------------------------
	.byte	W10
	.byte		N12   , Gn2 
	.byte	W12
	.byte		        Bn2 , v104
	.byte	W12
	.byte		N09   , En3 , v112
	.byte	W12
	.byte		N22   , Gn3 , v116
	.byte	W24
	.byte		N09   , Fn3 , v112
	.byte	W12
	.byte		N11   , En3 , v104
	.byte	W12
	.byte		        Gn3 , v092
	.byte	W02
@ 022   ----------------------------------------
	.byte	W10
	.byte		N13   , Fn3 
	.byte	W12
	.byte		N06   , En3 , v096
	.byte	W12
	.byte		N04   , En3 , v092
	.byte	W12
	.byte		N24   , En3 , v096
	.byte	W24
	.byte		N10   , Dn3 , v100
	.byte	W12
	.byte		N07   , Cn3 , v084
	.byte	W12
	.byte		N10   , En3 , v104
	.byte	W02
@ 023   ----------------------------------------
	.byte	W10
	.byte		N12   , Dn3 
	.byte	W12
	.byte		N09   , Cn3 , v088
	.byte	W12
	.byte		        Dn3 , v096
	.byte	W06
	.byte		N18   , An2 , v088
	.byte	W30
	.byte		N11   , Dn3 , v092
	.byte	W12
	.byte		N10   , Cn3 
	.byte	W12
	.byte		N09   , En3 , v088
	.byte	W02
@ 024   ----------------------------------------
	.byte	W10
	.byte		N13   , Dn3 , v100
	.byte	W12
	.byte		N10   , Cn3 , v096
	.byte	W12
	.byte		N07   , Dn3 , v092
	.byte	W12
	.byte		N19   , An2 , v088
	.byte	W24
	.byte		N11   , Dn3 , v096
	.byte	W12
	.byte		N09   , Cn3 , v092
	.byte	W12
	.byte		N12   , En3 
	.byte	W02
@ 025   ----------------------------------------
	.byte	W10
	.byte		N14   , Dn3 , v104
	.byte	W12
	.byte		N08   , Cn3 , v092
	.byte	W12
	.byte		        Dn3 , v096
	.byte	W12
	.byte		N19   , Gn2 , v092
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N10   , Cn3 , v104
	.byte	W12
	.byte		N08   , Gn3 , v116
	.byte	W02
@ 026   ----------------------------------------
	.byte	W10
	.byte		N15   
	.byte	W12
	.byte		N06   , Fn3 , v112
	.byte	W12
	.byte		N11   , Fn3 , v108
	.byte	W12
	.byte		N06   , En3 , v092
	.byte	W12
	.byte		N12   , En3 , v096
	.byte	W12
	.byte		N09   , Dn3 
	.byte	W12
	.byte		N11   , An2 , v084
	.byte	W12
	.byte		N06   , Bn2 , v088
	.byte	W02
@ 027   ----------------------------------------
	.byte	W10
	.byte		N10   , En2 , v092
	.byte	W12
	.byte		N09   , Gn2 
	.byte	W12
	.byte		N10   , Cn3 , v088
	.byte	W12
	.byte		N19   , En3 , v104
	.byte	W24
	.byte		N12   , Cn3 , v096
	.byte	W12
	.byte		N15   , Bn2 , v092
	.byte	W12
	.byte		N12   , Cn3 , v096
	.byte	W02
@ 028   ----------------------------------------
	.byte	W10
	.byte		        Bn2 , v092
	.byte	W12
	.byte		N08   , An2 , v088
	.byte	W12
	.byte		N07   , An2 , v096
	.byte	W12
	.byte		N16   
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		        Gs2 
	.byte	W12
	.byte		        An2 , v092
	.byte	W02
@ 029   ----------------------------------------
	.byte	W10
	.byte		        Fn2 
	.byte	W12
	.byte		        An2 
	.byte	W12
	.byte		N09   , En3 , v096
	.byte	W12
	.byte		N20   , Fn3 , v100
	.byte	W24
	.byte		N11   , En3 , v092
	.byte	W12
	.byte		N09   , Dn3 , v100
	.byte	W12
	.byte		N12   , Fn3 , v096
	.byte	W02
@ 030   ----------------------------------------
	.byte	W10
	.byte		N11   , Cn3 , v092
	.byte	W12
	.byte		N07   , Bn2 , v088
	.byte	W12
	.byte		N06   , Bn2 , v096
	.byte	W12
	.byte		N20   , Bn2 , v100
	.byte	W24
	.byte		N10   
	.byte	W12
	.byte		N09   , As2 , v092
	.byte	W12
	.byte		        Bn2 
	.byte	W02
@ 031   ----------------------------------------
	.byte	W10
	.byte		N10   , Gn2 , v088
	.byte	W12
	.byte		N11   , Bn2 
	.byte	W12
	.byte		N09   , En3 , v092
	.byte	W12
	.byte		N20   , Gn3 , v108
	.byte	W24
	.byte		N11   , Fn3 , v092
	.byte	W12
	.byte		        En3 , v088
	.byte	W12
	.byte		N10   , Gn3 , v096
	.byte	W02
@ 032   ----------------------------------------
	.byte	W10
	.byte		N13   , Fn3 , v100
	.byte	W12
	.byte		N06   , En3 , v092
	.byte	W12
	.byte		N04   , En3 , v096
	.byte	W12
	.byte		N22   
	.byte	W24
	.byte		N07   , Dn3 
	.byte	W12
	.byte		N09   , Cn3 , v076
	.byte	W12
	.byte		N11   , En3 , v104
	.byte	W02
@ 033   ----------------------------------------
	.byte	W10
	.byte		N08   , Dn3 , v100
	.byte	W12
	.byte		        Cn3 , v096
	.byte	W12
	.byte		        Dn3 , v100
	.byte	W12
	.byte		N20   , An2 , v084
	.byte	W24
	.byte		N08   , Dn3 , v100
	.byte	W12
	.byte		N06   , Cn3 
	.byte	W12
	.byte		N07   , En3 , v096
	.byte	W02
@ 034   ----------------------------------------
	.byte	W10
	.byte		N11   , Dn3 , v104
	.byte	W12
	.byte		N07   , Cn3 , v092
	.byte	W12
	.byte		N09   , Dn3 , v096
	.byte	W12
	.byte		N19   , An2 
	.byte	W24
	.byte		N10   , Bn2 , v092
	.byte	W12
	.byte		        An2 , v076
	.byte	W12
	.byte		N09   , Bn2 , v088
	.byte	W02
@ 035   ----------------------------------------
	.byte	W10
	.byte		N07   , Cn3 , v100
	.byte	W24
	.byte		N08   , Cn3 , v104
	.byte	W36
	.byte		N05   
	.byte	W12
	.byte		N07   , Cn3 , v096
	.byte	W12
	.byte		N09   , Cn3 , v108
	.byte	W02
@ 036   ----------------------------------------
	.byte	W68
	.byte	W02
	.byte		N07   , Gn3 , v100
	.byte	W12
	.byte		N07   
	.byte	W12
	.byte		N07   
	.byte	W02
@ 037   ----------------------------------------
	.byte	W12
	.byte	GOTO
	 .word	Castle_2_B1
Castle_2_B2:
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

Castle_3:
	.byte	KEYSH , Castle_key+0
Castle_3_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte	W10
	.byte		        48
	.byte		VOL   , 127*Castle_mvl/mxv
	.byte		PAN   , c_v+6
	.byte		N04   , Cn3 , v104
	.byte	W32
	.byte	W03
	.byte		N08   , Bn2 , v100
	.byte	W24
	.byte		N07   , As2 , v104
	.byte	W24
	.byte		N12   , An2 , v088
	.byte	W03
@ 001   ----------------------------------------
Castle_3_001:
	.byte	W09
	.byte		N10   , Gn2 , v096
	.byte	W12
	.byte		N15   , Fs2 
	.byte	W12
	.byte		N06   , Gn2 , v104
	.byte	W60
	.byte	W03
	.byte	PEND
@ 002   ----------------------------------------
Castle_3_002:
	.byte	W09
	.byte		N06   , Bn2 , v104
	.byte	W36
	.byte	W01
	.byte		N05   , As2 , v108
	.byte	W24
	.byte		N06   , An2 , v092
	.byte	W23
	.byte		        Gs2 
	.byte	W03
	.byte	PEND
@ 003   ----------------------------------------
Castle_3_003:
	.byte	W10
	.byte		N08   , Gn2 , v100
	.byte	W11
	.byte		N11   , Fn2 , v096
	.byte	W12
	.byte		N04   , Gn2 , v100
	.byte	W60
	.byte	W03
	.byte	PEND
@ 004   ----------------------------------------
Castle_3_004:
	.byte	W09
	.byte		N07   , An2 , v100
	.byte	W36
	.byte		N04   , Gs2 , v104
	.byte	W24
	.byte	W01
	.byte		N07   , Gn2 , v100
	.byte	W23
	.byte		N12   , Fs2 , v092
	.byte	W03
	.byte	PEND
@ 005   ----------------------------------------
Castle_3_005:
	.byte	W09
	.byte		N12   , Gn2 , v092
	.byte	W12
	.byte		N13   , Fs2 , v096
	.byte	W12
	.byte		N07   , Gn2 , v092
	.byte	W60
	.byte	W03
	.byte	PEND
@ 006   ----------------------------------------
	.byte	W09
	.byte		N36   , Fs2 
	.byte	W36
	.byte		N60   , Dn2 , v096
	.byte	W48
	.byte	W03
@ 007   ----------------------------------------
	.byte	W09
	.byte		N36   , Cn2 , v092
	.byte	W36
	.byte		N56   , An1 , v088
	.byte	W02
	.byte		N24   , Dn1 , v064
	.byte	W48
	.byte	W01
@ 008   ----------------------------------------
	.byte	W10
	.byte		N04   , Cn3 , v104
	.byte	W32
	.byte	W03
	.byte		N08   , Bn2 , v100
	.byte	W24
	.byte		N07   , As2 , v104
	.byte	W24
	.byte		N12   , An2 , v088
	.byte	W03
@ 009   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_001
@ 010   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_002
@ 011   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_003
@ 012   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_004
@ 013   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_005
@ 014   ----------------------------------------
	.byte	W10
	.byte		N36   , Fs2 , v092
	.byte	W36
	.byte		N60   , Dn2 , v096
	.byte	W36
	.byte		N36   , Bn1 , v092
	.byte	W14
@ 015   ----------------------------------------
	.byte	W10
	.byte		N24   , Cn2 , v088
	.byte	W60
	.byte		        Fn1 , v092
	.byte	W12
	.byte		        Cn1 
	.byte	W14
@ 016   ----------------------------------------
Castle_3_016:
	.byte	W68
	.byte	W02
	.byte		N36   , Bn0 , v080
	.byte	W24
	.byte	W02
	.byte	PEND
@ 017   ----------------------------------------
	.byte	W10
	.byte		N44   , Cn1 , v100
	.byte	W36
	.byte		N56   , En1 
	.byte	W48
	.byte	W02
@ 018   ----------------------------------------
	.byte	W10
	.byte		N42   , Fn1 , v088
	.byte	W36
	.byte		N54   , En1 , v104
	.byte	W48
	.byte	W02
@ 019   ----------------------------------------
	.byte	W10
	.byte		TIE   , Dn1 , v096
	.byte	W84
	.byte	W02
@ 020   ----------------------------------------
	.byte	W10
	.byte		N48   , Gn1 , v100
	.byte	W04
	.byte		EOT   , Dn1 
	.byte	W44
	.byte		N48   , Fn1 , v096
	.byte	W36
	.byte	W02
@ 021   ----------------------------------------
	.byte	W10
	.byte		N56   , En1 
	.byte	W48
	.byte		N44   , Gs1 , v100
	.byte	W36
	.byte	W02
@ 022   ----------------------------------------
	.byte	W10
	.byte		N01   , Gn1 , v068
	.byte		N48   , An1 , v076
	.byte	W48
	.byte		N44   , Gn1 , v096
	.byte	W36
	.byte	W02
@ 023   ----------------------------------------
	.byte	W10
	.byte		N92   , Fs1 
	.byte	W84
	.byte	W02
@ 024   ----------------------------------------
	.byte	W10
	.byte		TIE   , Fn1 
	.byte	W84
	.byte	W02
@ 025   ----------------------------------------
	.byte	W10
	.byte		N92   , En1 , v100
	.byte	W02
	.byte		EOT   , Fn1 
	.byte	W84
@ 026   ----------------------------------------
	.byte	W10
	.byte		N48   , Dn1 , v096
	.byte	W48
	.byte		        Gn1 
	.byte	W36
	.byte	W02
@ 027   ----------------------------------------
	.byte	W10
	.byte		        Cn1 , v100
	.byte	W48
	.byte		        En1 , v096
	.byte	W36
	.byte	W02
@ 028   ----------------------------------------
	.byte	W10
	.byte		N52   , Fn1 
	.byte	W48
	.byte		N48   , En1 , v092
	.byte	W36
	.byte	W02
@ 029   ----------------------------------------
	.byte	W10
	.byte		TIE   , Dn1 , v084
	.byte	W84
	.byte	W02
@ 030   ----------------------------------------
	.byte	W10
	.byte		N48   , Gn1 , v100
	.byte	W04
	.byte		EOT   , Dn1 
	.byte	W44
	.byte		N48   , Fn1 
	.byte	W36
	.byte	W02
@ 031   ----------------------------------------
	.byte	W10
	.byte		N56   , En1 
	.byte	W48
	.byte		N42   , Gs1 
	.byte	W36
	.byte	W02
@ 032   ----------------------------------------
	.byte	W10
	.byte		N52   , An1 , v096
	.byte	W48
	.byte		N48   , Gn1 , v100
	.byte	W36
	.byte	W02
@ 033   ----------------------------------------
	.byte	W10
	.byte		N92   , Fs1 
	.byte	W84
	.byte	W02
@ 034   ----------------------------------------
	.byte	W10
	.byte		N48   , Fn1 
	.byte	W48
	.byte		N44   , Gn1 , v096
	.byte	W36
	.byte	W02
@ 035   ----------------------------------------
	.byte	W10
	.byte		N06   , Cn1 , v100
	.byte	W24
	.byte		N07   , Cn1 , v104
	.byte	W36
	.byte		N04   , Cs1 , v096
	.byte	W12
	.byte		N07   , Cs1 , v100
	.byte	W12
	.byte		        Cn1 
	.byte	W02
@ 036   ----------------------------------------
	.byte	PATT
	 .word	Castle_3_016
@ 037   ----------------------------------------
	.byte	W12
	.byte	GOTO
	 .word	Castle_3_B1
Castle_3_B2:
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

Castle_4:
	.byte	KEYSH , Castle_key+0
Castle_4_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 45
	.byte	W10
	.byte		        45
	.byte		VOL   , 110*Castle_mvl/mxv
	.byte		PAN   , c_v+36
	.byte	W48
	.byte	W01
	.byte	W36
	.byte	W01
@ 001   ----------------------------------------
Castle_4_001:
	.byte	W22
	.byte		N07   , Cn1 , v096
	.byte	W12
	.byte		        Gn1 , v100
	.byte	W12
	.byte		        Cn2 
	.byte	W12
	.byte		N05   , Gn2 , v088
	.byte	W12
	.byte		N04   , Cn3 , v096
	.byte	W12
	.byte		        Gn3 , v100
	.byte	W12
	.byte		N02   , Cn4 , v108
	.byte	W02
	.byte	PEND
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
Castle_4_003:
	.byte	W22
	.byte		N07   , Bn0 , v100
	.byte	W12
	.byte		        Gn1 , v096
	.byte	W12
	.byte		N05   , Bn1 , v100
	.byte	W12
	.byte		        Gn2 
	.byte	W12
	.byte		N04   , Bn2 
	.byte	W12
	.byte		        Gn3 , v096
	.byte	W12
	.byte		N03   , Bn3 , v104
	.byte	W02
	.byte	PEND
@ 004   ----------------------------------------
	.byte	W96
@ 005   ----------------------------------------
Castle_4_005:
	.byte	W22
	.byte		N08   , An0 , v096
	.byte	W12
	.byte		N07   , En1 , v080
	.byte	W12
	.byte		N05   , An1 , v092
	.byte	W12
	.byte		N06   , En2 , v096
	.byte	W12
	.byte		N04   , An2 , v092
	.byte	W12
	.byte		N03   , Cn3 , v064
	.byte	W12
	.byte		        En3 , v100
	.byte	W02
	.byte	PEND
@ 006   ----------------------------------------
	.byte	W96
@ 007   ----------------------------------------
	.byte	W96
@ 008   ----------------------------------------
	.byte	W96
@ 009   ----------------------------------------
	.byte	PATT
	 .word	Castle_4_001
@ 010   ----------------------------------------
	.byte	W96
@ 011   ----------------------------------------
	.byte	PATT
	 .word	Castle_4_003
@ 012   ----------------------------------------
	.byte	W96
@ 013   ----------------------------------------
	.byte	PATT
	 .word	Castle_4_005
@ 014   ----------------------------------------
	.byte	W96
@ 015   ----------------------------------------
	.byte	W10
	.byte		N05   , Cn2 , v104
	.byte	W24
	.byte		N05   
	.byte	W36
	.byte		N06   , Cs2 
	.byte	W12
	.byte		N07   , Cs2 , v100
	.byte	W12
	.byte		N12   , Cn2 , v104
	.byte	W02
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
	.byte	W12
	.byte	GOTO
	 .word	Castle_4_B1
Castle_4_B2:
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

Castle_5:
	.byte	KEYSH , Castle_key+0
Castle_5_B1:
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte	W10
	.byte		        48
	.byte		PAN   , c_v-49
	.byte	W48
	.byte	W01
	.byte		VOL   , 80*Castle_mvl/mxv
	.byte	W36
	.byte	W01
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
	.byte	W10
	.byte		N90   , En2 , v092
	.byte	W84
	.byte	W02
@ 028   ----------------------------------------
	.byte	W10
	.byte		N72   , Fn2 , v080
	.byte	W72
	.byte		N19   , En2 , v084
	.byte	W14
@ 029   ----------------------------------------
	.byte	W10
	.byte		N72   , Dn2 , v080
	.byte	W72
	.byte		N24   , An2 , v076
	.byte	W14
@ 030   ----------------------------------------
	.byte	W10
	.byte		N60   , Bn2 
	.byte	W60
	.byte		N13   , An2 
	.byte	W12
	.byte		N11   , Gn2 , v084
	.byte	W12
	.byte		N13   , Fn2 , v064
	.byte	W02
@ 031   ----------------------------------------
	.byte	W10
	.byte		N72   , Gn2 , v084
	.byte	W72
	.byte		N17   , Bn2 , v076
	.byte	W12
	.byte		N15   , Dn3 
	.byte	W02
@ 032   ----------------------------------------
	.byte	W10
	.byte		N48   , Cn3 , v088
	.byte	W48
	.byte		N44   , Bn2 , v080
	.byte	W36
	.byte	W02
@ 033   ----------------------------------------
	.byte	W10
	.byte		N96   , An2 , v068
	.byte	W84
	.byte	W02
@ 034   ----------------------------------------
	.byte	W10
	.byte		N44   , An2 , v096
	.byte	W48
	.byte		N48   , Bn2 
	.byte	W36
	.byte	W02
@ 035   ----------------------------------------
	.byte	W10
	.byte		N05   , Cn3 
	.byte	W24
	.byte		N08   
	.byte	W36
	.byte		N07   , Cn3 , v084
	.byte	W12
	.byte		        Cn3 , v088
	.byte	W12
	.byte		N08   , Cn3 , v076
	.byte	W02
@ 036   ----------------------------------------
	.byte	W96
@ 037   ----------------------------------------
	.byte	W12
	.byte	GOTO
	 .word	Castle_5_B1
Castle_5_B2:
	.byte	FINE

@******************************************************@
	.align	2

Castle:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	Castle_pri	@ Priority
	.byte	Castle_rev	@ Reverb.

	.word	Castle_grp

	.word	Castle_1
	.word	Castle_2
	.word	Castle_3
	.word	Castle_4
	.word	Castle_5

	.end
