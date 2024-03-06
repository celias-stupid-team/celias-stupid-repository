	.include "MPlayDef.s"

	.equ	The_Gay_Agenda_FINAL_3_grp, voicegroup000
	.equ	The_Gay_Agenda_FINAL_3_pri, 0
	.equ	The_Gay_Agenda_FINAL_3_rev, 0
	.equ	The_Gay_Agenda_FINAL_3_mvl, 127
	.equ	The_Gay_Agenda_FINAL_3_key, 0
	.equ	The_Gay_Agenda_FINAL_3_tbs, 1
	.equ	The_Gay_Agenda_FINAL_3_exg, 0
	.equ	The_Gay_Agenda_FINAL_3_cmp, 1

	.section .rodata
	.global	The_Gay_Agenda_FINAL_3
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

The_Gay_Agenda_FINAL_3_1:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 123*The_Gay_Agenda_FINAL_3_tbs/2
	.byte		VOICE , 80
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		TIE   , Cs1 , v092
	.byte	W72
@ 002   ----------------------------------------
	.byte	W24
	.byte	W48
@ 003   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   
	.byte	W01
	.byte		TIE   
	.byte	W24
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W23
	.byte		EOT   
	.byte	W01
	.byte		N32   , Cs1 , v100
	.byte	W36
	.byte		N01   , Cs1 , v092
	.byte	W06
	.byte		        Cs1 , v096
	.byte	W06
@ 007   ----------------------------------------
	.byte		N32   , Cs1 , v104
	.byte	W36
	.byte		N01   , Cs1 , v092
	.byte	W06
	.byte		        Cs1 , v096
	.byte	W06
	.byte		N92   , Cs1 , v108
	.byte	W24
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_1_B1:
@ 009   ----------------------------------------
The_Gay_Agenda_FINAL_3_1_009:
	.byte		N11   , Fs0 , v080
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_1_009
@ 011   ----------------------------------------
	.byte		N11   , Fs0 , v080
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Ds1 
	.byte	W24
@ 012   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 013   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W48
@ 014   ----------------------------------------
	.byte	W24
	.byte		        Bn0 
	.byte	W01
	.byte		TIE   , Fs2 , v072
	.byte	W23
	.byte		N11   , Bn0 , v080
	.byte	W24
@ 015   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 016   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W22
	.byte		EOT   , Fs2 
	.byte	W02
@ 017   ----------------------------------------
	.byte		N11   , Gs2 , v092
	.byte	W36
	.byte		        Fs2 
	.byte	W36
@ 018   ----------------------------------------
	.byte		        Fn2 
	.byte	W36
	.byte		        Ds2 
	.byte	W36
@ 019   ----------------------------------------
	.byte		        Cs2 
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Cs2 , v112
	.byte	W24
@ 020   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 021   ----------------------------------------
	.byte		N92   , Cs1 
	.byte	W72
@ 022   ----------------------------------------
	.byte	W24
	.byte		N11   , Fs1 
	.byte	W24
	.byte		N11   
	.byte	W24
@ 023   ----------------------------------------
	.byte		        Fs1 , v116
	.byte	W24
	.byte		        Cs1 , v108
	.byte	W12
	.byte		        Fs1 , v116
	.byte	W12
	.byte		        Fs0 , v084
	.byte	W12
	.byte		N02   , Fs1 , v080
	.byte	W06
	.byte		N05   , Fs1 , v084
	.byte	W06
@ 024   ----------------------------------------
	.byte		N11   , Fs0 , v080
	.byte	W12
	.byte		        Fs1 
	.byte	W24
	.byte		        Fs2 , v096
	.byte	W12
	.byte		        Fs2 , v092
	.byte	W24
@ 025   ----------------------------------------
	.byte		N23   , Ds2 , v112
	.byte	W24
	.byte		N11   , As1 
	.byte	W24
	.byte		        Cs1 , v084
	.byte	W12
	.byte		        Cs2 , v080
	.byte	W12
@ 026   ----------------------------------------
	.byte		        Dn1 , v084
	.byte	W12
	.byte		        Dn2 , v080
	.byte	W60
@ 027   ----------------------------------------
	.byte	W48
	.byte		N44   , Gs1 , v112
	.byte	W24
@ 028   ----------------------------------------
The_Gay_Agenda_FINAL_3_1_028:
	.byte	W24
	.byte		N44   , Gs1 , v112
	.byte	W48
	.byte	PEND
@ 029   ----------------------------------------
The_Gay_Agenda_FINAL_3_1_029:
	.byte		N44   , Gs1 , v112
	.byte	W48
	.byte		N44   
	.byte	W24
	.byte	PEND
@ 030   ----------------------------------------
	.byte	W24
	.byte		        Fs2 
	.byte	W48
@ 031   ----------------------------------------
	.byte		        Fs2 , v116
	.byte	W48
	.byte		N92   , Cs1 , v112
	.byte	W24
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte		N11   , Fs1 
	.byte	W24
	.byte		        Cs1 
	.byte	W24
	.byte		        Fs1 , v116
	.byte	W24
@ 034   ----------------------------------------
	.byte		        Cs1 , v108
	.byte	W12
	.byte		        Fs1 , v116
	.byte	W12
	.byte		        Fs0 , v084
	.byte	W12
	.byte		N02   , Fs1 , v080
	.byte	W06
	.byte		N05   , Fs1 , v084
	.byte	W06
	.byte		N11   , Fs0 , v080
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 035   ----------------------------------------
	.byte	W12
	.byte		        Fs2 , v096
	.byte	W12
	.byte		        Fs2 , v092
	.byte	W24
	.byte		        Ds2 , v112
	.byte	W24
@ 036   ----------------------------------------
	.byte		        As1 
	.byte	W24
	.byte		        Ds2 , v116
	.byte	W24
	.byte		        As1 , v108
	.byte	W12
	.byte		        Ds2 , v116
	.byte	W12
@ 037   ----------------------------------------
	.byte		N44   , Ds2 , v080
	.byte	W48
	.byte		N23   , As2 
	.byte	W24
@ 038   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N44   , Gs1 , v112
	.byte	W48
@ 039   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_1_029
@ 040   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_1_028
@ 041   ----------------------------------------
	.byte		N44   , Fs2 , v112
	.byte	W48
	.byte		        Fs2 , v116
	.byte	W24
@ 042   ----------------------------------------
	.byte	W24
	.byte		N92   , Cs1 , v112
	.byte	W48
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_1_B1
The_Gay_Agenda_FINAL_3_1_B2:
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

The_Gay_Agenda_FINAL_3_2:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 81
	.byte		VOL   , 87*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		TIE   , Cs1 , v064
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W48
	.byte		EOT   
	.byte		TIE   
	.byte	W24
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W24
	.byte		EOT   
	.byte	W48
@ 007   ----------------------------------------
	.byte	W72
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_2_B1:
@ 009   ----------------------------------------
	.byte		TIE   , Cs3 , v032
	.byte	W72
@ 010   ----------------------------------------
	.byte	W72
@ 011   ----------------------------------------
	.byte	W48
	.byte		EOT   
	.byte		TIE   , Ds3 
	.byte	W24
@ 012   ----------------------------------------
	.byte	W72
@ 013   ----------------------------------------
	.byte	W72
@ 014   ----------------------------------------
	.byte	W24
	.byte		EOT   
	.byte		TIE   , Ds3 , v048
	.byte	W48
@ 015   ----------------------------------------
	.byte	W48
	.byte	W24
@ 016   ----------------------------------------
	.byte	W24
	.byte	W44
	.byte	W03
	.byte		EOT   
	.byte	W01
@ 017   ----------------------------------------
	.byte		N11   , Cs3 , v092
	.byte	W36
	.byte		        Bn2 
	.byte	W36
@ 018   ----------------------------------------
	.byte		        As2 
	.byte	W36
	.byte		        Gs2 
	.byte	W36
@ 019   ----------------------------------------
	.byte		        Fs2 
	.byte	W24
	.byte		        Fn2 
	.byte	W24
	.byte		        Fs3 
	.byte	W24
@ 020   ----------------------------------------
	.byte		        Fs3 , v096
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Fs3 , v100
	.byte	W24
@ 021   ----------------------------------------
	.byte	W12
	.byte		N05   , As2 , v112
	.byte	W12
	.byte		N11   , Cs3 
	.byte	W12
	.byte		N05   , As2 
	.byte	W12
	.byte		N11   , Cs3 
	.byte	W12
	.byte		N05   , As2 
	.byte	W12
@ 022   ----------------------------------------
	.byte		N11   , Cs3 
	.byte	W72
@ 023   ----------------------------------------
	.byte	W72
@ 024   ----------------------------------------
	.byte	W72
@ 025   ----------------------------------------
	.byte	W60
	.byte		N02   , As2 , v100
	.byte	W06
	.byte		        As2 , v096
	.byte	W06
@ 026   ----------------------------------------
	.byte		N11   , As2 , v104
	.byte	W36
	.byte		        Gs3 , v112
	.byte	W12
	.byte		N05   , As3 
	.byte	W06
	.byte		        Bn3 
	.byte	W12
	.byte		        Cs4 
	.byte	W06
@ 027   ----------------------------------------
	.byte	W12
	.byte		N23   , As3 
	.byte	W24
	.byte		N11   , Fs3 
	.byte	W12
	.byte		N44   , Gs3 
	.byte	W24
@ 028   ----------------------------------------
	.byte	W24
	.byte		        Gn3 
	.byte	W48
@ 029   ----------------------------------------
	.byte		        Fs3 
	.byte	W48
	.byte		        Gs2 
	.byte	W24
@ 030   ----------------------------------------
The_Gay_Agenda_FINAL_3_2_030:
	.byte	W24
	.byte		N44   , Bn2 , v112
	.byte	W48
	.byte	PEND
@ 031   ----------------------------------------
	.byte		N44   
	.byte	W48
	.byte		N92   
	.byte	W24
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte	W72
@ 034   ----------------------------------------
	.byte	W24
	.byte		N17   , As2 , v096
	.byte	W18
	.byte		N02   , As2 , v092
	.byte	W18
	.byte		N05   , As2 , v096
	.byte	W12
@ 035   ----------------------------------------
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        As2 , v092
	.byte	W48
@ 036   ----------------------------------------
	.byte	W36
	.byte		N02   , As2 , v100
	.byte	W06
	.byte		        As2 , v096
	.byte	W06
	.byte		N11   , As2 , v104
	.byte	W24
@ 037   ----------------------------------------
	.byte	W72
@ 038   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_2_030
@ 039   ----------------------------------------
The_Gay_Agenda_FINAL_3_2_039:
	.byte		N44   , Bn2 , v112
	.byte	W48
	.byte		N44   
	.byte	W24
	.byte	PEND
@ 040   ----------------------------------------
	.byte	W24
	.byte		        Gs2 
	.byte	W48
@ 041   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_2_039
@ 042   ----------------------------------------
	.byte	W24
	.byte		N92   , Bn2 , v112
	.byte	W48
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_2_B1
The_Gay_Agenda_FINAL_3_2_B2:
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

The_Gay_Agenda_FINAL_3_3:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 92
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W72
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W72
@ 007   ----------------------------------------
	.byte	W72
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_3_B1:
@ 009   ----------------------------------------
	.byte		TIE   , As2 , v052
	.byte	W48
	.byte	W24
@ 010   ----------------------------------------
	.byte	W24
	.byte	W48
@ 011   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   
	.byte	W01
	.byte		TIE   
	.byte	W24
@ 012   ----------------------------------------
	.byte	W24
	.byte	W48
@ 013   ----------------------------------------
	.byte	W48
	.byte	W24
@ 014   ----------------------------------------
	.byte	W23
	.byte		EOT   
	.byte	W01
	.byte	W48
@ 015   ----------------------------------------
	.byte	W48
	.byte	W24
@ 016   ----------------------------------------
	.byte	W24
	.byte	W48
@ 017   ----------------------------------------
	.byte	W72
@ 018   ----------------------------------------
	.byte	W72
@ 019   ----------------------------------------
	.byte	W72
@ 020   ----------------------------------------
	.byte	W72
@ 021   ----------------------------------------
	.byte	W72
@ 022   ----------------------------------------
	.byte	W72
@ 023   ----------------------------------------
	.byte	W72
@ 024   ----------------------------------------
	.byte	W72
@ 025   ----------------------------------------
	.byte	W72
@ 026   ----------------------------------------
	.byte	W24
	.byte		N11   , Fs2 , v088
	.byte	W12
	.byte		        Fs2 , v092
	.byte	W18
	.byte		N08   , Fs2 , v088
	.byte	W18
@ 027   ----------------------------------------
	.byte		N23   
	.byte	W24
	.byte		N11   , Fs2 , v092
	.byte	W24
	.byte		N44   , Bn2 , v080
	.byte	W24
@ 028   ----------------------------------------
	.byte	W24
	.byte		N44   
	.byte	W48
@ 029   ----------------------------------------
	.byte		N44   
	.byte	W72
@ 030   ----------------------------------------
	.byte	W72
@ 031   ----------------------------------------
	.byte	W48
	.byte		N92   , Ds3 
	.byte	W24
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte	W72
@ 034   ----------------------------------------
	.byte	W24
	.byte		N17   , Cs3 , v096
	.byte	W18
	.byte		N02   , Cs3 , v092
	.byte	W18
	.byte		N05   , Cs3 , v096
	.byte	W12
@ 035   ----------------------------------------
	.byte	W12
	.byte		N11   
	.byte	W12
	.byte		        Cs3 , v092
	.byte	W48
@ 036   ----------------------------------------
	.byte	W72
@ 037   ----------------------------------------
	.byte	W72
@ 038   ----------------------------------------
	.byte	W24
	.byte		N44   , Gs3 , v080
	.byte	W48
@ 039   ----------------------------------------
	.byte		        Gn3 
	.byte	W48
	.byte		        Fs3 
	.byte	W24
@ 040   ----------------------------------------
	.byte	W72
@ 041   ----------------------------------------
	.byte	W72
@ 042   ----------------------------------------
	.byte	W24
	.byte		N92   , Ds3 
	.byte	W48
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_3_B1
The_Gay_Agenda_FINAL_3_3_B2:
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

The_Gay_Agenda_FINAL_3_4:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 127
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 002   ----------------------------------------
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 003   ----------------------------------------
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 004   ----------------------------------------
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 005   ----------------------------------------
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 006   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_006:
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	PEND
@ 007   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_007:
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	PEND
@ 008   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_007
The_Gay_Agenda_FINAL_3_4_B1:
@ 009   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_009:
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	PEND
@ 010   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 011   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_011:
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	PEND
@ 012   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 013   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 014   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 015   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 016   ----------------------------------------
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 017   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_017:
	.byte	W01
	.byte		N02   , Fs4 , v064
	.byte	W23
	.byte		N02   
	.byte	W24
	.byte		N02   
	.byte	W24
	.byte	PEND
@ 018   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_017
@ 019   ----------------------------------------
	.byte	W01
	.byte		N02   , Fs4 , v064
	.byte	W24
	.byte		N02   
	.byte	W24
	.byte		N05   
	.byte	W23
@ 020   ----------------------------------------
	.byte	W01
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W24
	.byte		N05   
	.byte	W23
@ 021   ----------------------------------------
	.byte	W01
	.byte		N05   
	.byte	W68
	.byte	W03
@ 022   ----------------------------------------
	.byte	W24
	.byte	W01
	.byte		N01   
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W11
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 023   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_006
@ 024   ----------------------------------------
The_Gay_Agenda_FINAL_3_4_024:
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	PEND
@ 025   ----------------------------------------
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
@ 026   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_007
@ 027   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_024
@ 028   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 029   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 030   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_006
@ 031   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_007
@ 032   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_007
@ 033   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 034   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_007
@ 035   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_011
@ 036   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_006
@ 037   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_024
@ 038   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_011
@ 039   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 040   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 041   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 042   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_4_009
@ 043   ----------------------------------------
	.byte		N01   , Fs4 , v064
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte		N01   , Fs4 
	.byte	W06
	.byte		N01   
	.byte	W06
	.byte		N02   , As4 
	.byte	W12
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_4_B1
The_Gay_Agenda_FINAL_3_4_B2:
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

The_Gay_Agenda_FINAL_3_5:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 17
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		TIE   , Gs3 , v084
	.byte		TIE   , Bn3 , v064
	.byte		TIE   , Ds4 
	.byte		TIE   , Fs4 , v084
	.byte	W72
@ 002   ----------------------------------------
	.byte	W24
	.byte	W48
@ 003   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   , Gs3 
	.byte		        Fs4 
	.byte	W01
	.byte		        Bn3 
	.byte		        Ds4 
	.byte		TIE   , Gs3 , v092
	.byte		TIE   , Bn3 , v064
	.byte		TIE   , Ds4 
	.byte		TIE   , Fs4 , v080
	.byte	W24
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W23
	.byte		EOT   , Gs3 
	.byte		        Fs4 
	.byte	W01
	.byte		        Bn3 
	.byte		        Ds4 
	.byte		TIE   , Gs3 , v092
	.byte		TIE   , Bn3 , v064
	.byte		TIE   , Ds4 
	.byte		TIE   , Fs4 , v080
	.byte	W48
@ 007   ----------------------------------------
	.byte	W48
	.byte	W24
@ 008   ----------------------------------------
	.byte	W66
	.byte		EOT   , Ds4 
	.byte	W05
	.byte		        Gs3 
	.byte		        Fs4 
	.byte	W01
	.byte		        Bn3 
The_Gay_Agenda_FINAL_3_5_B1:
@ 009   ----------------------------------------
	.byte		N11   , Fs3 , v092
	.byte		N11   , As3 , v096
	.byte		N11   , Cs4 , v080
	.byte	W13
	.byte		N04   , Fs3 , v088
	.byte		N04   , As3 
	.byte		N04   , Cs4 , v080
	.byte	W23
	.byte		N05   , Fs3 , v084
	.byte		N05   , As3 , v092
	.byte		N05   , Cs4 , v080
	.byte	W12
	.byte		N23   , Fs3 , v084
	.byte		N23   , As3 , v088
	.byte		N23   , Cs4 , v080
	.byte	W24
@ 010   ----------------------------------------
	.byte	W24
	.byte		N17   , Fs3 , v092
	.byte		N17   , As3 , v080
	.byte		N17   , Cs4 
	.byte	W18
	.byte		N05   , Fs3 , v084
	.byte		N05   , As3 , v080
	.byte		N05   , Cs4 
	.byte	W18
	.byte		        Fs3 , v088
	.byte		N05   , As3 , v080
	.byte		N05   , Cs4 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W06
	.byte		N17   , Fs3 , v084
	.byte		N17   , As3 , v080
	.byte		N17   , Cs4 
	.byte	W18
	.byte		N11   , Fs3 , v088
	.byte		N11   , As3 , v080
	.byte		N11   , Cs4 
	.byte	W24
	.byte		        Fs3 , v096
	.byte		N11   , As3 , v080
	.byte		N11   , Ds4 
	.byte	W13
	.byte		N02   , Fs3 , v084
	.byte		N02   , As3 , v080
	.byte		N02   , Ds4 
	.byte	W11
@ 012   ----------------------------------------
	.byte	W12
	.byte		N11   , Fs3 , v088
	.byte		N11   , Cs4 , v080
	.byte		N11   , Ds4 
	.byte	W12
	.byte		        Fs3 , v092
	.byte		N11   , Cs4 , v080
	.byte		N11   , Ds4 
	.byte	W48
@ 013   ----------------------------------------
	.byte		N17   , Fs3 , v084
	.byte		N17   , Cs4 , v080
	.byte		N17   , Ds4 
	.byte	W18
	.byte		N05   , Fs3 , v088
	.byte		N05   , Cs4 , v080
	.byte		N05   , Ds4 
	.byte	W18
	.byte		        Fs3 , v084
	.byte		N05   , Cs4 , v080
	.byte		N05   , Ds4 
	.byte	W24
	.byte		N23   , Fs3 , v084
	.byte		N23   , Cs4 , v080
	.byte		N23   , Ds4 
	.byte	W12
@ 014   ----------------------------------------
	.byte	W12
	.byte		N05   , Fs3 , v084
	.byte		N05   , Cs4 , v080
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 , v092
	.byte		N11   , Bn3 , v080
	.byte		N11   , Ds4 
	.byte	W13
	.byte		N02   , Fs3 , v084
	.byte		N02   , Bn3 , v080
	.byte		N02   , Ds4 
	.byte	W23
	.byte		N11   , Fs3 , v088
	.byte		N11   , Bn3 , v080
	.byte		N11   , Ds4 
	.byte	W12
@ 015   ----------------------------------------
	.byte		        Fs3 , v092
	.byte		N11   , Bn3 , v080
	.byte		N11   , Ds4 
	.byte	W48
	.byte		N17   , Fs3 , v092
	.byte		N17   , Bn3 , v080
	.byte		N17   , Ds4 
	.byte	W18
	.byte		N05   , Fs3 , v088
	.byte		N05   , Bn3 , v080
	.byte		N05   , Ds4 
	.byte	W06
@ 016   ----------------------------------------
	.byte	W12
	.byte		        Fs3 , v084
	.byte		N05   , Bn3 , v080
	.byte		N05   , Ds4 
	.byte	W18
	.byte		N17   , Fs3 , v084
	.byte		N17   , Bn3 , v080
	.byte		N17   , Ds4 
	.byte	W18
	.byte		N23   , Fs3 , v088
	.byte		N23   , Bn3 , v080
	.byte		N23   , Ds4 
	.byte	W24
@ 017   ----------------------------------------
	.byte		N17   , Gs3 , v104
	.byte		N17   , Cs4 , v080
	.byte		N17   , Fn4 
	.byte	W36
	.byte		N32   , Fs3 , v100
	.byte		N32   , Bn3 , v080
	.byte		N32   , Ds4 
	.byte	W12
	.byte	W24
@ 018   ----------------------------------------
	.byte		N11   , Fn3 , v100
	.byte		N11   , As3 , v080
	.byte		N11   , Cs4 
	.byte	W36
	.byte		N17   , Ds3 , v100
	.byte		N17   , Gs3 , v080
	.byte		N17   , Bn3 
	.byte	W36
@ 019   ----------------------------------------
	.byte		N11   , Cs3 , v104
	.byte		N11   , Fs3 , v080
	.byte		N11   , As3 
	.byte	W24
	.byte		        Cs3 , v104
	.byte		N11   , Fn3 , v080
	.byte		N11   , Gs3 
	.byte	W24
	.byte		        Gs3 , v092
	.byte		N11   , Bn3 , v096
	.byte		N11   , Ds4 , v092
	.byte		N11   , Fs4 , v080
	.byte	W24
@ 020   ----------------------------------------
	.byte		        Gs3 , v092
	.byte		N11   , Bn3 , v088
	.byte		N11   , Ds4 , v092
	.byte		N11   , Fs4 , v080
	.byte	W24
	.byte		        Gs3 , v088
	.byte		N11   , Bn3 , v096
	.byte		N11   , Ds4 
	.byte		N11   , Fs4 , v080
	.byte	W24
	.byte		        Gs3 , v096
	.byte		N11   , Bn3 
	.byte		N11   , Ds4 , v092
	.byte		N11   , Fs4 , v080
	.byte	W24
@ 021   ----------------------------------------
	.byte		N05   , Cs3 , v100
	.byte	W72
@ 022   ----------------------------------------
	.byte	W24
	.byte		N92   , Fs3 , v080
	.byte		N92   , As3 
	.byte		N92   , Cs4 
	.byte	W48
@ 023   ----------------------------------------
	.byte	W48
	.byte		N11   , Fs3 
	.byte		N11   , As3 
	.byte		N11   , Cs4 , v092
	.byte	W18
	.byte		N05   , Fs3 
	.byte		N05   , As3 , v080
	.byte		N05   , Cs4 
	.byte	W06
@ 024   ----------------------------------------
	.byte	W12
	.byte		N23   
	.byte	W12
	.byte		        Fs3 , v096
	.byte		N23   , As3 , v080
	.byte	W12
	.byte		N11   , Ds4 , v096
	.byte	W12
	.byte		        Fs3 , v080
	.byte		N11   , As3 
	.byte		N11   , Cs4 , v092
	.byte	W24
@ 025   ----------------------------------------
	.byte		N44   , Fs3 
	.byte		N44   , As3 , v096
	.byte		N44   , Ds4 , v080
	.byte	W48
	.byte		N56   , Fs3 , v088
	.byte		N56   , As3 , v096
	.byte		N56   , Ds4 , v080
	.byte	W24
@ 026   ----------------------------------------
	.byte	W24
	.byte	W12
	.byte		N11   , Fs3 , v092
	.byte		N11   , As3 
	.byte		N11   , Ds4 , v080
	.byte	W18
	.byte		N08   , Fs3 , v088
	.byte		N08   , As3 , v092
	.byte	W18
@ 027   ----------------------------------------
	.byte		N23   , Fs3 , v088
	.byte		N23   , As3 , v092
	.byte		N23   , Ds4 , v080
	.byte	W24
	.byte		N11   , Fs3 , v092
	.byte		N11   , As3 
	.byte		N11   , Ds4 , v080
	.byte	W24
	.byte		N44   , Gs3 
	.byte		N44   , Bn3 , v092
	.byte		N44   , Ds4 , v100
	.byte	W24
@ 028   ----------------------------------------
	.byte	W24
	.byte		        Gn3 , v080
	.byte		N44   , Bn3 , v092
	.byte		N44   , Ds4 , v100
	.byte	W48
@ 029   ----------------------------------------
	.byte		        Fs3 , v080
	.byte		N44   , Bn3 , v100
	.byte		N44   , Ds4 
	.byte	W48
	.byte		        Gs3 
	.byte		N44   , Ds4 
	.byte		N44   , Fn4 , v080
	.byte	W24
@ 030   ----------------------------------------
	.byte	W72
@ 031   ----------------------------------------
	.byte	W72
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte		N92   , Fs3 
	.byte		N92   , As3 
	.byte		N92   , Cs4 
	.byte	W72
@ 034   ----------------------------------------
	.byte	W24
	.byte		N11   , Fs3 
	.byte		N11   , As3 
	.byte		N11   , Cs4 , v092
	.byte	W18
	.byte		N05   , Fs3 
	.byte		N05   , As3 , v080
	.byte		N05   , Cs4 
	.byte	W18
	.byte		N23   
	.byte	W12
@ 035   ----------------------------------------
	.byte		        Fs3 , v096
	.byte		N23   , As3 , v080
	.byte	W12
	.byte		N11   , Ds4 , v096
	.byte	W12
	.byte		        Fs3 , v080
	.byte		N11   , As3 
	.byte		N11   , Cs4 , v092
	.byte	W24
	.byte		N44   , Fs3 
	.byte		N44   , As3 , v096
	.byte		N44   , Ds4 , v080
	.byte	W24
@ 036   ----------------------------------------
	.byte	W24
	.byte		N56   , Fs3 , v088
	.byte		N56   , As3 , v096
	.byte		N56   , Ds4 , v080
	.byte	W48
@ 037   ----------------------------------------
	.byte	W12
	.byte		N11   , Fs3 , v092
	.byte		N11   , As3 
	.byte		N11   , Ds4 , v080
	.byte	W18
	.byte		N08   , Fs3 , v088
	.byte		N08   , As3 , v092
	.byte	W18
	.byte		N23   , Fs3 , v088
	.byte		N23   , As3 , v092
	.byte		N23   , Ds4 , v080
	.byte	W24
@ 038   ----------------------------------------
	.byte		N11   , Fs3 , v092
	.byte		N11   , As3 
	.byte		N11   , Ds4 , v080
	.byte	W24
	.byte		N44   , Gs3 
	.byte		N44   , Bn3 , v092
	.byte		N44   , Ds4 , v100
	.byte	W48
@ 039   ----------------------------------------
	.byte		        Gn3 , v080
	.byte		N44   , Bn3 , v092
	.byte		N44   , Ds4 , v100
	.byte	W48
	.byte		        Fs3 , v080
	.byte		N44   , Bn3 , v100
	.byte		N44   , Ds4 
	.byte	W24
@ 040   ----------------------------------------
	.byte	W24
	.byte		        Gs3 
	.byte		N44   , Ds4 
	.byte		N44   , Fn4 , v080
	.byte	W48
@ 041   ----------------------------------------
	.byte	W72
@ 042   ----------------------------------------
	.byte	W72
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_5_B1
The_Gay_Agenda_FINAL_3_5_B2:
	.byte	FINE

@**************** Track 6 (Midi-Chn.6) ****************@

The_Gay_Agenda_FINAL_3_6:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 24
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W72
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W72
@ 007   ----------------------------------------
	.byte	W72
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_6_B1:
@ 009   ----------------------------------------
	.byte		N05   , Cs4 , v127
	.byte	W12
	.byte		        As3 
	.byte	W60
@ 010   ----------------------------------------
	.byte		N11   
	.byte	W12
	.byte		N05   , Gs3 
	.byte	W12
	.byte		N11   , Fs3 
	.byte	W12
	.byte		N05   , Gs3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
@ 011   ----------------------------------------
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N05   , Ds4 
	.byte	W12
	.byte		        As3 
	.byte	W12
@ 012   ----------------------------------------
	.byte	W48
	.byte		N11   
	.byte	W12
	.byte		N05   , Gs3 
	.byte	W12
@ 013   ----------------------------------------
	.byte		N11   , Fs3 
	.byte	W12
	.byte		N05   , Gs3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N05   , As3 
	.byte	W12
@ 014   ----------------------------------------
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N05   , Ds4 
	.byte	W12
	.byte		        Bn3 
	.byte	W36
@ 015   ----------------------------------------
	.byte	W24
	.byte		N11   
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Gs3 
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
@ 016   ----------------------------------------
	.byte		        Bn3 
	.byte	W12
	.byte		N11   , Ds4 
	.byte	W24
	.byte		N05   , Fs4 
	.byte	W12
	.byte		N23   , Ds4 
	.byte	W24
@ 017   ----------------------------------------
	.byte	W72
@ 018   ----------------------------------------
	.byte	W72
@ 019   ----------------------------------------
	.byte	W72
@ 020   ----------------------------------------
	.byte	W72
@ 021   ----------------------------------------
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
@ 022   ----------------------------------------
	.byte		N11   , Cs4 
	.byte	W24
	.byte		N44   , Ds4 
	.byte	W48
@ 023   ----------------------------------------
	.byte		N11   , Cs4 
	.byte	W24
	.byte		        Ds4 
	.byte	W12
	.byte		N05   , Cs4 
	.byte	W24
	.byte		        As3 
	.byte	W12
@ 024   ----------------------------------------
	.byte		N11   , Cs4 
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W12
	.byte		N05   , As3 
	.byte	W12
	.byte		N11   , Cs4 
	.byte	W24
@ 025   ----------------------------------------
	.byte		N44   , Gs3 
	.byte	W48
	.byte		N11   , Fs3 
	.byte	W24
@ 026   ----------------------------------------
	.byte		        Gs3 
	.byte	W12
	.byte		N05   , Fs3 
	.byte	W24
	.byte		N11   , Ds3 
	.byte	W36
@ 027   ----------------------------------------
	.byte	W24
	.byte		        Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Fs3 
	.byte		N05   , Fs4 
	.byte	W12
@ 028   ----------------------------------------
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		N11   , Ds3 
	.byte		N11   , Ds4 
	.byte	W36
	.byte		        Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
@ 029   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		        Ds3 
	.byte		N05   , Ds4 
	.byte	W36
@ 030   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		        Cs3 
	.byte		N05   , Cs4 
	.byte	W12
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
@ 031   ----------------------------------------
	.byte	W12
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W24
	.byte		        Ds3 
	.byte		N05   , Ds4 
	.byte	W24
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
@ 032   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W24
@ 033   ----------------------------------------
	.byte		N44   , Fs3 , v112
	.byte		N44   , Fs4 
	.byte	W24
	.byte	W12
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W24
@ 034   ----------------------------------------
	.byte		        Ds3 
	.byte		N11   , Ds4 
	.byte	W12
	.byte		N05   , Fs3 
	.byte		N05   , Fs4 
	.byte	W24
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
@ 035   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W24
	.byte		N44   , Fs3 
	.byte		N44   , Fs4 
	.byte	W24
@ 036   ----------------------------------------
	.byte	W12
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W24
	.byte		        Gs3 
	.byte		N11   , Gs4 
	.byte	W12
	.byte		N05   , Fs3 
	.byte		N05   , Fs4 
	.byte	W12
@ 037   ----------------------------------------
	.byte	W12
	.byte		N44   , Ds3 
	.byte		N44   , Ds4 
	.byte	W12
	.byte	W12
	.byte	W12
	.byte	W24
@ 038   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		N11   , Ds3 
	.byte		N11   , Ds4 
	.byte	W12
@ 039   ----------------------------------------
	.byte	W24
	.byte		        Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
@ 040   ----------------------------------------
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		        Ds3 
	.byte		N05   , Ds4 
	.byte	W36
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
@ 041   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Ds3 
	.byte		N05   , Ds4 
	.byte	W12
	.byte		        Cs3 
	.byte		N05   , Cs4 
	.byte	W12
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W24
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W12
@ 042   ----------------------------------------
	.byte	W12
	.byte		N80   , Fs3 
	.byte		N80   , Fs4 
	.byte	W12
	.byte	W48
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_6_B1
The_Gay_Agenda_FINAL_3_6_B2:
	.byte	FINE

@**************** Track 7 (Midi-Chn.7) ****************@

The_Gay_Agenda_FINAL_3_7:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 38
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		N32   , Cs1 , v112
	.byte	W36
	.byte		N02   , Cs1 , v116
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N32   
	.byte	W24
@ 002   ----------------------------------------
	.byte	W12
	.byte		N02   , Cs1 , v112
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N68   
	.byte	W48
@ 003   ----------------------------------------
	.byte	W48
	.byte		N32   , Cs1 , v116
	.byte	W24
@ 004   ----------------------------------------
	.byte	W12
	.byte		N02   
	.byte	W06
	.byte		        Cs1 , v112
	.byte	W06
	.byte		N32   
	.byte	W36
	.byte		N02   
	.byte	W06
	.byte		N02   
	.byte	W06
@ 005   ----------------------------------------
	.byte		N92   
	.byte	W72
@ 006   ----------------------------------------
	.byte	W72
@ 007   ----------------------------------------
	.byte	W72
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_7_B1:
@ 009   ----------------------------------------
	.byte		N11   , Fs0 , v100
	.byte	W24
	.byte		        Fs0 , v104
	.byte	W24
	.byte		N11   
	.byte	W24
@ 010   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 011   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Ds1 
	.byte	W24
@ 012   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		        Ds1 , v100
	.byte	W24
	.byte		N11   
	.byte	W24
@ 013   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		        Ds1 , v104
	.byte	W24
	.byte		N01   , An0 , v127
	.byte	W01
	.byte		N10   , An0 , v076
	.byte	W11
	.byte		N01   , An1 , v127
	.byte	W01
	.byte		N10   , An1 , v076
	.byte	W11
@ 014   ----------------------------------------
	.byte		N01   , As0 , v127
	.byte	W01
	.byte		N10   , As0 , v080
	.byte	W11
	.byte		N01   , As1 , v127
	.byte	W01
	.byte		N10   , As1 , v084
	.byte	W11
	.byte		N11   , Bn0 , v108
	.byte	W24
	.byte		        Bn0 , v104
	.byte	W24
@ 015   ----------------------------------------
	.byte		        Bn0 , v108
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Bn0 , v104
	.byte	W24
@ 016   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 017   ----------------------------------------
	.byte		N17   , Fn2 , v108
	.byte	W36
	.byte		N32   , Ds2 
	.byte	W12
	.byte	W24
@ 018   ----------------------------------------
	.byte		N11   , Cs2 
	.byte	W36
	.byte		N17   , Bn1 
	.byte	W36
@ 019   ----------------------------------------
	.byte		N11   , As1 , v104
	.byte	W24
	.byte		        Gs1 
	.byte	W24
	.byte		        Cs1 , v100
	.byte	W24
@ 020   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		        Cs1 , v104
	.byte	W24
	.byte		N11   
	.byte	W24
@ 021   ----------------------------------------
	.byte		        Cs1 , v100
	.byte	W72
@ 022   ----------------------------------------
	.byte	W24
	.byte		        Fs0 , v120
	.byte	W12
	.byte		N02   , Fs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 023   ----------------------------------------
	.byte		        Fs0 
	.byte	W12
	.byte		N02   , Fs1 
	.byte	W06
	.byte		N05   , Fs1 , v124
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W36
@ 024   ----------------------------------------
	.byte	W24
	.byte		        Cs1 , v116
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn2 
	.byte	W12
@ 025   ----------------------------------------
	.byte		        Fs0 
	.byte	W12
	.byte		N02   , Fs1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W36
@ 026   ----------------------------------------
	.byte	W24
	.byte		        Ds1 , v124
	.byte	W12
	.byte		N05   , Ds2 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Ds2 , v120
	.byte	W12
@ 027   ----------------------------------------
	.byte		        Ds1 
	.byte	W12
	.byte		N02   , Ds2 , v116
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		N05   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 028   ----------------------------------------
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 , v112
	.byte	W12
	.byte		N02   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 , v116
	.byte	W12
@ 029   ----------------------------------------
	.byte		        Gs0 
	.byte	W12
	.byte		N05   , Gs1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		N02   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 030   ----------------------------------------
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Cs1 
	.byte	W14
	.byte		N02   , Cs2 
	.byte	W06
	.byte		N03   
	.byte	W04
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
@ 031   ----------------------------------------
	.byte		        Cs1 , v116
	.byte	W12
	.byte		N05   , Cs2 
	.byte	W07
	.byte		N04   
	.byte	W05
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Cs2 , v120
	.byte	W12
	.byte		        Cs1 
	.byte	W14
	.byte		N01   , Cs2 
	.byte	W06
	.byte		N15   
	.byte	W04
@ 032   ----------------------------------------
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Cs2 , v116
	.byte	W12
	.byte		        En0 
	.byte	W12
	.byte		        En1 , v112
	.byte	W12
	.byte		        Fn0 , v116
	.byte	W12
	.byte		        Fn1 
	.byte	W12
@ 033   ----------------------------------------
	.byte		        Fs0 
	.byte	W12
	.byte		N05   , Fs1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 , v116
	.byte	W12
	.byte		        Fs1 , v112
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		N02   , Fs1 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 034   ----------------------------------------
	.byte		N11   , Fs0 , v120
	.byte	W12
	.byte		        Fs1 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		N02   , Fs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Fs0 , v116
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 035   ----------------------------------------
	.byte		        Cs1 , v112
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Dn1 
	.byte	W12
	.byte		        Dn2 , v116
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		N05   , Ds2 
	.byte	W06
	.byte		N05   
	.byte	W06
@ 036   ----------------------------------------
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Ds1 
	.byte	W12
	.byte		N02   , Ds2 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Ds1 
	.byte	W12
	.byte		        Ds2 
	.byte	W12
@ 037   ----------------------------------------
	.byte		        Ds1 
	.byte	W12
	.byte		N02   , Ds2 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Ds1 , v112
	.byte	W12
	.byte		        Ds2 
	.byte	W12
	.byte		        Fs0 
	.byte	W12
	.byte		        Fs1 
	.byte	W12
@ 038   ----------------------------------------
	.byte		        Gn0 
	.byte	W24
	.byte		        Gs0 , v116
	.byte	W12
	.byte		N05   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
@ 039   ----------------------------------------
	.byte		        Gs0 
	.byte	W12
	.byte		N02   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Gs0 , v120
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 , v116
	.byte	W12
	.byte		N05   , Gs1 , v120
	.byte	W06
	.byte		N05   
	.byte	W06
@ 040   ----------------------------------------
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        Gs0 
	.byte	W12
	.byte		N02   , Gs1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N11   , Gs0 
	.byte	W12
	.byte		        Gs1 
	.byte	W12
@ 041   ----------------------------------------
	.byte		        Cs1 
	.byte	W14
	.byte		N02   , Cs2 
	.byte	W06
	.byte		N03   
	.byte	W04
	.byte		N11   , Cs1 , v124
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Cs1 
	.byte	W12
	.byte		N05   , Cs2 
	.byte	W07
	.byte		N04   
	.byte	W05
@ 042   ----------------------------------------
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
	.byte		        Cs1 
	.byte	W14
	.byte		N01   , Cs2 
	.byte	W06
	.byte		N15   
	.byte	W04
	.byte		N11   , Cs1 
	.byte	W12
	.byte		        Cs2 
	.byte	W12
@ 043   ----------------------------------------
	.byte		        En0 
	.byte	W12
	.byte		        En1 , v120
	.byte	W12
	.byte		        Fn0 
	.byte	W12
	.byte		        Fn1 
	.byte	W12
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_7_B1
The_Gay_Agenda_FINAL_3_7_B2:
	.byte	FINE

@**************** Track 8 (Midi-Chn.8) ****************@

The_Gay_Agenda_FINAL_3_8:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 56
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte		N32   , As3 , v124
	.byte	W36
	.byte		N02   , Gs3 , v120
	.byte	W12
	.byte		N44   , Ds3 , v124
	.byte	W24
@ 002   ----------------------------------------
	.byte	W36
	.byte		N02   , As3 
	.byte	W12
	.byte		N11   , Gs3 , v120
	.byte	W12
	.byte		N05   , Cs4 , v124
	.byte	W06
	.byte		        As3 
	.byte	W06
@ 003   ----------------------------------------
	.byte	W06
	.byte		        As3 , v116
	.byte	W06
	.byte		N02   , Gs3 , v124
	.byte	W12
	.byte		N23   , Ds3 
	.byte	W24
	.byte		N32   , As3 
	.byte		N32   , As4 , v080
	.byte	W24
@ 004   ----------------------------------------
	.byte	W12
	.byte		N02   , Gs3 , v120
	.byte		N02   , Gs4 , v080
	.byte	W12
	.byte		N44   , Ds3 , v124
	.byte		N44   , Ds4 , v080
	.byte	W48
@ 005   ----------------------------------------
	.byte	W12
	.byte		N02   , As3 , v124
	.byte		N02   , As4 , v080
	.byte	W12
	.byte		N11   , Gs3 , v120
	.byte		N11   , Gs4 , v080
	.byte	W12
	.byte		N05   , Cs4 , v124
	.byte		N05   , Cs5 , v080
	.byte	W06
	.byte		        As3 , v124
	.byte		N05   , As4 , v080
	.byte	W12
	.byte		        As3 , v116
	.byte		N05   , As4 , v080
	.byte	W06
	.byte		N02   , Gs3 , v124
	.byte		N02   , Gs4 , v080
	.byte	W12
@ 006   ----------------------------------------
	.byte		N23   , Ds3 , v124
	.byte		N23   , Ds4 , v080
	.byte	W24
	.byte		N32   , As3 , v104
	.byte		N32   , Bn3 , v100
	.byte		N32   , Ds4 
	.byte		N32   , Fs4 
	.byte	W36
	.byte		N02   , As3 , v096
	.byte		N02   , Bn3 , v100
	.byte		N02   , Ds4 
	.byte		N02   , Fs4 , v092
	.byte	W06
	.byte		        As3 , v088
	.byte		N02   , Bn3 , v092
	.byte		N02   , Ds4 , v096
	.byte		N02   , Fs4 , v080
	.byte	W06
@ 007   ----------------------------------------
	.byte		N32   , As3 , v104
	.byte		N32   , Bn3 
	.byte		N32   , Ds4 , v100
	.byte		N32   , Fs4 , v104
	.byte	W36
	.byte		N02   , As3 , v096
	.byte		N02   , Bn3 
	.byte		N02   , Ds4 
	.byte		N02   , Fs4 
	.byte	W06
	.byte		        As3 
	.byte		N02   , Bn3 
	.byte		N02   , Ds4 
	.byte		N02   , Fs4 , v092
	.byte	W06
	.byte		N92   , As3 , v104
	.byte		N92   , Bn3 
	.byte		N92   , Ds4 
	.byte		N92   , Fs4 , v100
	.byte	W24
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_8_B1:
@ 009   ----------------------------------------
	.byte		N05   , Cs4 , v080
	.byte	W12
	.byte		N23   , As3 
	.byte	W24
	.byte		        Gs3 
	.byte	W24
	.byte		N05   , As3 
	.byte	W12
@ 010   ----------------------------------------
	.byte		N92   , Cs3 
	.byte	W24
	.byte	W48
@ 011   ----------------------------------------
	.byte	W48
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N23   , As3 
	.byte	W12
@ 012   ----------------------------------------
	.byte	W12
	.byte		        Gs3 
	.byte	W24
	.byte		N05   , As3 
	.byte	W12
	.byte		N92   , Ds3 
	.byte	W24
@ 013   ----------------------------------------
	.byte	W72
@ 014   ----------------------------------------
	.byte	W24
	.byte		N05   , Ds4 
	.byte	W12
	.byte		N23   , Bn3 
	.byte	W24
	.byte		        As3 
	.byte	W12
@ 015   ----------------------------------------
	.byte	W12
	.byte		TIE   , Bn3 
	.byte	W12
	.byte	W24
	.byte	W24
@ 016   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   
	.byte	W24
	.byte	W01
@ 017   ----------------------------------------
	.byte		N17   , Cs4 , v104
	.byte		N17   , Fn4 
	.byte	W36
	.byte		N32   , Bn3 , v100
	.byte		N32   , Ds4 
	.byte	W12
	.byte	W24
@ 018   ----------------------------------------
	.byte		N11   , As3 
	.byte		N11   , Cs4 
	.byte	W36
	.byte		N17   , Gs3 
	.byte		N17   , Bn3 
	.byte	W36
@ 019   ----------------------------------------
	.byte		N11   , Fs3 , v104
	.byte		N11   , As3 
	.byte	W24
	.byte		        Fn3 
	.byte		N11   , Gs3 
	.byte	W24
	.byte		        Cs4 , v112
	.byte		N11   , Fs4 
	.byte	W24
@ 020   ----------------------------------------
	.byte		        Cs4 , v108
	.byte		N11   , Fs4 , v100
	.byte	W24
	.byte		        Cs4 , v104
	.byte		N11   , Fs4 
	.byte	W24
	.byte		        Cs4 
	.byte		N11   , Fs4 , v108
	.byte	W24
@ 021   ----------------------------------------
	.byte		        Cs4 
	.byte		N11   , Fs4 
	.byte	W72
@ 022   ----------------------------------------
	.byte	W72
@ 023   ----------------------------------------
	.byte	W12
	.byte		N02   , Fs3 , v100
	.byte		N02   , Gs3 , v096
	.byte		N02   , As3 , v100
	.byte	W06
	.byte		        Fs3 
	.byte		N02   , Gs3 
	.byte		N02   , As3 , v096
	.byte	W06
	.byte		N11   , Fs3 , v104
	.byte		N11   , Gs3 
	.byte		N11   , As3 
	.byte	W36
	.byte		N05   
	.byte		N05   , As4 , v108
	.byte	W12
@ 024   ----------------------------------------
	.byte		N11   , As3 
	.byte		N11   , As4 , v112
	.byte	W12
	.byte		N05   , Gs3 , v104
	.byte		N05   , Gs4 , v108
	.byte	W12
	.byte		N11   , Gs3 , v104
	.byte		N11   , Gs4 , v108
	.byte	W12
	.byte		N05   , Fs3 , v100
	.byte		N05   , Fs4 , v104
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 , v108
	.byte	W12
	.byte		N05   , Fn3 , v104
	.byte		N05   , Fn4 , v108
	.byte	W12
@ 025   ----------------------------------------
	.byte		N23   , Fn3 , v104
	.byte		N23   , Fn4 
	.byte	W24
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		        As2 
	.byte		N11   , As3 
	.byte	W24
	.byte		N02   , Cs3 , v096
	.byte		N02   , Ds3 , v100
	.byte		N02   , Fs3 
	.byte	W06
	.byte		        Cs3 
	.byte		N02   , Ds3 
	.byte		N02   , Fs3 , v096
	.byte	W06
@ 026   ----------------------------------------
	.byte		N11   , Cs3 , v104
	.byte		N11   , Ds3 
	.byte		N11   , Fs3 
	.byte	W72
@ 027   ----------------------------------------
	.byte	W60
	.byte		N05   , Gs3 , v088
	.byte		N05   , Gs4 
	.byte	W12
@ 028   ----------------------------------------
	.byte		N23   , Gs3 
	.byte		N23   , Gs4 
	.byte	W36
	.byte		N05   , Gn3 
	.byte		N05   , Gn4 
	.byte	W12
	.byte		N23   , Gn3 
	.byte		N23   , Gn4 
	.byte	W24
@ 029   ----------------------------------------
	.byte		N32   , Fs3 
	.byte		N32   , Fs4 
	.byte	W36
	.byte		N11   , Fn3 
	.byte		N11   , Fn4 
	.byte	W36
@ 030   ----------------------------------------
	.byte	W24
	.byte		N23   , As3 
	.byte		N32   , Bn3 
	.byte		N32   , Ds4 
	.byte		N32   , Fs4 
	.byte	W36
	.byte		N05   , As3 , v084
	.byte		N05   , Bn3 
	.byte		N05   , Ds4 
	.byte		N05   , Fs4 
	.byte	W12
@ 031   ----------------------------------------
	.byte		N23   , As3 
	.byte		N32   , Bn3 
	.byte		N32   , Ds4 
	.byte		N32   , Fs4 
	.byte	W36
	.byte	W01
	.byte		N02   , As3 
	.byte		N02   , Bn3 
	.byte		N02   , Ds4 
	.byte		N02   , Fs4 
	.byte	W05
	.byte		N05   , As3 
	.byte		N05   , Bn3 
	.byte		N05   , Ds4 
	.byte		N05   , Fs4 
	.byte	W06
	.byte		N92   , As3 
	.byte		N92   , Bn3 
	.byte		N92   , Ds4 
	.byte		N92   , Fs4 
	.byte	W24
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte	W72
@ 034   ----------------------------------------
	.byte	W36
	.byte		N05   , As3 
	.byte		N05   , As4 
	.byte	W12
	.byte		N11   , As3 
	.byte		N11   , As4 
	.byte	W12
	.byte		N05   , Gs3 
	.byte		N05   , Gs4 
	.byte	W12
@ 035   ----------------------------------------
	.byte		N11   , Gs3 , v080
	.byte		N11   , Gs4 
	.byte	W12
	.byte		N05   , Fs3 
	.byte		N05   , Fs4 
	.byte	W12
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		N05   , Fn3 
	.byte		N05   , Fn4 
	.byte	W12
	.byte		N23   , Fn3 
	.byte		N23   , Fn4 
	.byte	W24
@ 036   ----------------------------------------
	.byte		N11   , Fs3 
	.byte		N11   , Fs4 
	.byte	W12
	.byte		        As2 
	.byte		N11   , As3 
	.byte	W60
@ 037   ----------------------------------------
	.byte	W72
@ 038   ----------------------------------------
	.byte	W36
	.byte		N05   , Gs3 , v096
	.byte		N05   , Gs4 
	.byte	W12
	.byte		N23   , Gs3 
	.byte		N23   , Gs4 
	.byte	W24
@ 039   ----------------------------------------
	.byte	W12
	.byte		N05   , Gn3 , v092
	.byte		N05   , Gn4 
	.byte	W12
	.byte		N23   , Gn3 
	.byte		N23   , Gn4 
	.byte	W24
	.byte		N32   , Fs3 
	.byte		N32   , Fs4 
	.byte	W24
@ 040   ----------------------------------------
	.byte	W12
	.byte		N11   , Fn3 
	.byte		N11   , Fn4 
	.byte	W60
@ 041   ----------------------------------------
	.byte		N32   , Ds4 
	.byte	W36
	.byte		N05   , Ds4 , v088
	.byte	W12
	.byte		N32   , Ds4 , v084
	.byte	W24
@ 042   ----------------------------------------
	.byte	W13
	.byte		N02   , Ds4 , v080
	.byte	W05
	.byte		N05   , Ds4 , v076
	.byte	W06
	.byte		N23   , Ds4 , v072
	.byte	W48
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_8_B1
The_Gay_Agenda_FINAL_3_8_B2:
	.byte	FINE

@**************** Track 9 (Midi-Chn.9) ****************@

The_Gay_Agenda_FINAL_3_9:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 48
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W72
@ 001   ----------------------------------------
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W72
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W24
	.byte		N05   , As2 , v080
	.byte		N05   , As3 
	.byte	W06
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte	W06
	.byte		        Bn2 , v092
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        As2 , v084
	.byte		N05   , As3 
	.byte	W06
	.byte		        Cs3 , v088
	.byte		N05   , Cs4 
	.byte	W06
	.byte		        Bn2 
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        Ds3 , v084
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Cs3 , v076
	.byte		N05   , Cs4 
	.byte	W06
@ 007   ----------------------------------------
	.byte		        Fn3 , v084
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Ds3 , v080
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Fn3 , v076
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Gs3 , v084
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Fs3 , v080
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        As3 , v088
	.byte		N05   , As4 
	.byte	W06
	.byte		        Gs3 , v080
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Bn3 , v088
	.byte		N05   , Bn4 
	.byte	W06
	.byte		        As3 , v080
	.byte		N05   , As4 
	.byte	W06
	.byte		        Cs4 , v076
	.byte		N05   , Cs5 
	.byte	W06
	.byte		        Bn3 , v088
	.byte		N05   , Bn4 
	.byte	W06
@ 008   ----------------------------------------
	.byte		        Ds4 , v080
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        Cs4 , v076
	.byte		N05   , Cs5 
	.byte	W06
	.byte		        Fn4 , v088
	.byte		N05   , Fn5 
	.byte	W06
	.byte		        Ds4 , v080
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        Fs4 , v092
	.byte		N05   , Fs5 
	.byte	W06
	.byte		        Fn4 , v084
	.byte		N05   , Fn5 
	.byte	W06
	.byte		        Gs4 , v092
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Fs4 , v084
	.byte		N05   , Fs5 
	.byte	W06
	.byte		        As4 , v088
	.byte		N05   , As5 
	.byte	W06
	.byte		        Gs4 , v080
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Bn4 , v092
	.byte		N05   , Bn5 
	.byte	W06
	.byte		        As4 , v088
	.byte		N05   , As5 
	.byte	W06
The_Gay_Agenda_FINAL_3_9_B1:
@ 009   ----------------------------------------
	.byte	W72
@ 010   ----------------------------------------
	.byte	W72
@ 011   ----------------------------------------
	.byte	W72
@ 012   ----------------------------------------
	.byte	W72
@ 013   ----------------------------------------
	.byte	W72
@ 014   ----------------------------------------
	.byte	W72
@ 015   ----------------------------------------
	.byte	W72
@ 016   ----------------------------------------
	.byte	W72
@ 017   ----------------------------------------
	.byte		N17   , Cs4 , v104
	.byte		N17   , Fn4 
	.byte	W36
	.byte		N32   , Bn3 , v100
	.byte		N32   , Ds4 
	.byte	W12
	.byte	W24
@ 018   ----------------------------------------
	.byte		N11   , As3 
	.byte		N11   , Cs4 
	.byte	W36
	.byte		N17   , Gs3 
	.byte		N17   , Bn3 
	.byte	W36
@ 019   ----------------------------------------
	.byte		N11   , Fs3 , v104
	.byte		N11   , As3 
	.byte	W24
	.byte		        Fn3 
	.byte		N11   , Gs3 
	.byte	W24
	.byte		        Cs4 , v112
	.byte		N11   , Fs4 
	.byte	W24
@ 020   ----------------------------------------
	.byte		        Cs4 , v108
	.byte		N11   , Fs4 , v100
	.byte	W24
	.byte		        Cs4 , v104
	.byte		N11   , Fs4 
	.byte	W24
	.byte		        Cs4 
	.byte		N11   , Fs4 , v108
	.byte	W24
@ 021   ----------------------------------------
	.byte		        Cs4 
	.byte		N11   , Fs4 
	.byte	W72
@ 022   ----------------------------------------
	.byte	W24
	.byte		TIE   , As2 , v080
	.byte		TIE   , Fs3 
	.byte		N44   , Ds4 
	.byte	W48
@ 023   ----------------------------------------
	.byte		TIE   , Cs4 
	.byte	W48
	.byte	W24
@ 024   ----------------------------------------
	.byte	W68
	.byte	W03
	.byte		EOT   , As2 
	.byte		        Fs3 
	.byte		        Cs4 
	.byte	W01
@ 025   ----------------------------------------
	.byte		TIE   , As2 
	.byte		TIE   , Ds3 
	.byte		N44   , Gs3 
	.byte	W48
	.byte		TIE   , Fs3 
	.byte	W24
@ 026   ----------------------------------------
	.byte	W24
	.byte	W48
@ 027   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   , As2 
	.byte		        Ds3 
	.byte		        Fs3 
	.byte	W01
	.byte		N44   , Gs3 , v068
	.byte		N44   , Gs4 
	.byte	W24
@ 028   ----------------------------------------
	.byte	W24
	.byte		        Gn3 , v064
	.byte		N44   , Gn4 
	.byte	W48
@ 029   ----------------------------------------
	.byte		N32   , Fs3 
	.byte		N32   , Fs4 
	.byte	W36
	.byte		N56   , Gs3 
	.byte		N11   , Gs4 
	.byte	W12
	.byte		N44   
	.byte	W24
@ 030   ----------------------------------------
	.byte	W24
	.byte		N05   , As2 , v084
	.byte		N05   , As3 
	.byte	W06
	.byte		        Gs2 
	.byte		N05   , Gs3 
	.byte	W06
	.byte		        Bn2 
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        As2 
	.byte		N05   , As3 
	.byte	W06
	.byte		        Cs3 
	.byte		N05   , Cs4 
	.byte	W06
	.byte		        Bn2 
	.byte		N05   , Bn3 
	.byte	W06
	.byte		        Ds3 
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Cs3 
	.byte		N05   , Cs4 
	.byte	W06
@ 031   ----------------------------------------
	.byte		        Fn3 , v080
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Ds3 
	.byte		N05   , Ds4 
	.byte	W06
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        Fn3 
	.byte		N05   , Fn4 
	.byte	W06
	.byte		        Gs3 , v084
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Fs3 
	.byte		N05   , Fs4 
	.byte	W06
	.byte		        As3 
	.byte		N05   , As4 
	.byte	W06
	.byte		        Gs3 
	.byte		N05   , Gs4 
	.byte	W06
	.byte		        Bn3 , v080
	.byte		N05   , Bn4 
	.byte	W06
	.byte		        As3 
	.byte		N05   , As4 
	.byte	W06
	.byte		        Cs4 
	.byte		N05   , Cs5 
	.byte	W06
	.byte		        Bn3 
	.byte		N05   , Bn4 
	.byte	W06
@ 032   ----------------------------------------
	.byte		        Ds4 
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        Cs4 , v084
	.byte		N05   , Cs5 
	.byte	W06
	.byte		        Fn4 , v080
	.byte		N05   , Fn5 
	.byte	W06
	.byte		        Ds4 
	.byte		N05   , Ds5 
	.byte	W06
	.byte		        Fs4 
	.byte		N05   , Fs5 
	.byte	W06
	.byte		        Fn4 , v084
	.byte		N05   , Fn5 
	.byte	W06
	.byte		        Gs4 
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Fs4 
	.byte		N05   , Fs5 
	.byte	W06
	.byte		        As4 , v080
	.byte		N05   , As5 
	.byte	W06
	.byte		        Gs4 
	.byte		N05   , Gs5 
	.byte	W06
	.byte		        Bn4 , v084
	.byte		N05   , Bn5 
	.byte	W06
	.byte		        As4 
	.byte		N05   , As5 
	.byte	W06
@ 033   ----------------------------------------
	.byte		TIE   , As2 , v072
	.byte		TIE   , Fs3 
	.byte		N44   , Ds5 
	.byte	W48
	.byte		TIE   , Cs5 , v064
	.byte	W24
@ 034   ----------------------------------------
	.byte	W24
	.byte	W48
@ 035   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   , As2 
	.byte		        Fs3 
	.byte		        Cs5 
	.byte	W01
	.byte		TIE   , As2 , v068
	.byte		TIE   , Ds3 
	.byte		N44   , Gs3 
	.byte	W24
@ 036   ----------------------------------------
	.byte	W24
	.byte		TIE   , Fs3 
	.byte	W48
@ 037   ----------------------------------------
	.byte	W72
@ 038   ----------------------------------------
	.byte	W23
	.byte		EOT   , As2 
	.byte		        Ds3 
	.byte		        Fs3 
	.byte	W01
	.byte		N44   , Gs3 , v080
	.byte		N44   , Gs4 
	.byte	W48
@ 039   ----------------------------------------
	.byte		        Gn3 
	.byte		N44   , Gn4 
	.byte	W48
	.byte		N32   , Fs3 
	.byte		N32   , Fs4 
	.byte	W24
@ 040   ----------------------------------------
	.byte	W12
	.byte		N56   , Gs3 
	.byte		N11   , Gs4 
	.byte	W12
	.byte		N44   
	.byte	W48
@ 041   ----------------------------------------
	.byte		        Cs3 , v076
	.byte		N44   , Fs4 
	.byte	W48
	.byte		        Cs3 
	.byte		N44   , Fn4 
	.byte	W24
@ 042   ----------------------------------------
	.byte	W24
	.byte		        Cs3 , v068
	.byte		N44   , Ds4 
	.byte	W48
@ 043   ----------------------------------------
	.byte		        Cs3 , v064
	.byte		N44   , Cs4 
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_9_B1
The_Gay_Agenda_FINAL_3_9_B2:
	.byte	FINE

@**************** Track 10 (Midi-Chn.10) ****************@

The_Gay_Agenda_FINAL_3_10:
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte		VOL   , 100*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte	W48
	.byte		N23   , Dn1 , v127
	.byte	W24
@ 001   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_001:
	.byte		N23   , Cn1 , v092
	.byte	W24
	.byte		N23   
	.byte		N05   , Dn1 , v096
	.byte	W24
	.byte		N23   , Cn1 , v092
	.byte	W24
	.byte	PEND
@ 002   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_002:
	.byte		N23   , Cn1 , v092
	.byte		N05   , Dn1 , v096
	.byte	W24
	.byte		N23   , Cn1 , v092
	.byte	W24
	.byte		N23   
	.byte		N05   , Dn1 , v096
	.byte	W24
	.byte	PEND
@ 003   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_001
@ 004   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_002
@ 005   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_001
@ 006   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_002
@ 007   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_001
@ 008   ----------------------------------------
	.byte		N23   , Cn1 , v092
	.byte		N05   , Dn1 , v096
	.byte	W24
	.byte		N23   , Cn1 , v092
	.byte	W12
	.byte		N11   , Dn1 , v127
	.byte	W12
	.byte		N23   , Cn1 , v092
	.byte		N05   , Dn1 , v112
	.byte	W06
	.byte		        Dn1 , v080
	.byte	W18
The_Gay_Agenda_FINAL_3_10_B1:
@ 009   ----------------------------------------
	.byte		N23   , Cn1 , v092
	.byte		N05   , Cs2 , v080
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 010   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_010:
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 011   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_011:
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 012   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 013   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 014   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 015   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 016   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 017   ----------------------------------------
	.byte	W01
	.byte		N22   , Cn1 , v092
	.byte		N04   , Dn1 , v096
	.byte		N04   , Cs2 , v088
	.byte		N04   , Fs2 , v076
	.byte	W11
	.byte		N05   , Fs2 , v064
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Fs2 , v076
	.byte	W12
	.byte		N05   , Dn1 , v096
	.byte		N05   , Fs2 , v064
	.byte		N05   , An2 , v088
	.byte	W06
	.byte		        Fs2 , v064
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Fs2 , v076
	.byte	W12
	.byte		N05   , Fs2 , v064
	.byte	W07
	.byte		N04   
	.byte	W05
@ 018   ----------------------------------------
	.byte	W01
	.byte		N22   , Cn1 , v092
	.byte		N04   , Dn1 , v096
	.byte		N04   , Cs2 , v088
	.byte		N04   , Fs2 , v076
	.byte	W11
	.byte		N05   , Fs2 , v064
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Fs2 , v076
	.byte	W12
	.byte		N05   , Dn1 , v096
	.byte		N05   , Fs2 , v064
	.byte		N05   , An2 , v088
	.byte	W06
	.byte		        Fs2 , v064
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Fs2 , v076
	.byte	W12
	.byte		N05   , Fs2 , v064
	.byte	W07
	.byte		N04   
	.byte	W05
@ 019   ----------------------------------------
	.byte	W01
	.byte		N22   , Cn1 , v092
	.byte		N04   , Dn1 , v096
	.byte		N04   , Cs2 , v088
	.byte		N04   , Fs2 , v076
	.byte	W12
	.byte		        Fs2 , v064
	.byte	W06
	.byte		N04   
	.byte	W06
	.byte		N22   , Cn1 , v092
	.byte		N04   , Dn1 , v096
	.byte		N04   , Fs2 , v076
	.byte		N04   , An2 , v088
	.byte	W12
	.byte		        Fs2 , v064
	.byte	W06
	.byte		N04   
	.byte	W06
	.byte		N22   , Cn1 , v092
	.byte		N01   , Dn1 , v096
	.byte		N01   , Cs2 , v088
	.byte	W01
	.byte		N09   , Fs2 , v076
	.byte	W22
@ 020   ----------------------------------------
	.byte	W01
	.byte		N22   , Cn1 , v092
	.byte		N22   , Dn1 , v096
	.byte		N22   , An2 , v088
	.byte	W24
	.byte		        Cn1 , v092
	.byte		N22   , Dn1 , v096
	.byte		N22   , Cs2 , v088
	.byte	W24
	.byte		        Cn1 , v092
	.byte		N22   , Dn1 , v096
	.byte		N22   , An2 , v088
	.byte	W23
@ 021   ----------------------------------------
	.byte	W01
	.byte		        Cn1 , v092
	.byte		N04   , Dn1 , v096
	.byte		N04   , Cs2 , v088
	.byte	W11
	.byte		N05   , Dn1 , v096
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Dn1 , v096
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		        Cn2 , v092
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 
	.byte		N05   , An1 
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 022   ----------------------------------------
	.byte		N23   , Cn1 
	.byte		N05   , Fn1 , v088
	.byte	W06
	.byte		N02   
	.byte	W06
	.byte		N05   
	.byte	W07
	.byte		N04   
	.byte	W06
	.byte		N22   , Cn1 , v092
	.byte		N04   , Fs2 , v076
	.byte		N04   , An2 , v088
	.byte	W11
	.byte		N05   , Fs2 , v064
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
@ 023   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 024   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 025   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 026   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 027   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_027:
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Cs2 , v127
	.byte		N05   , Fs2 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 028   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 029   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 030   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_030:
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Cs2 , v127
	.byte		N05   , Fs2 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 031   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_027
@ 032   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 033   ----------------------------------------
The_Gay_Agenda_FINAL_3_10_033:
	.byte		N23   , Cn1 , v092
	.byte		N05   , Cs2 , v127
	.byte		N05   , Fs2 
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	PEND
@ 034   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 035   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_027
@ 036   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 037   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 038   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_030
@ 039   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_011
@ 040   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_010
@ 041   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_033
@ 042   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_10_030
@ 043   ----------------------------------------
	.byte		N23   , Cn1 , v092
	.byte		N05   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte		N23   , Cn1 , v092
	.byte		N11   , Dn1 , v080
	.byte		N11   , Fs2 , v127
	.byte	W12
	.byte		N05   
	.byte	W06
	.byte		N05   
	.byte	W06
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_10_B1
The_Gay_Agenda_FINAL_3_10_B2:
	.byte	FINE

@**************** Track 11 (Midi-Chn.11) ****************@

The_Gay_Agenda_FINAL_3_11:
	.byte		VOL   , 127*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte	W72
@ 001   ----------------------------------------
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W72
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W72
@ 007   ----------------------------------------
	.byte	W72
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_11_B1:
@ 009   ----------------------------------------
	.byte		TIE   , Cs3 , v080
	.byte	W48
	.byte	W24
@ 010   ----------------------------------------
	.byte	W24
	.byte	W48
@ 011   ----------------------------------------
	.byte	W44
	.byte	W03
	.byte		EOT   
	.byte	W01
	.byte		TIE   , Ds3 
	.byte	W24
@ 012   ----------------------------------------
	.byte	W24
	.byte	W48
@ 013   ----------------------------------------
	.byte	W48
	.byte	W01
	.byte		EOT   
	.byte	W23
@ 014   ----------------------------------------
	.byte	W72
@ 015   ----------------------------------------
	.byte	W72
@ 016   ----------------------------------------
	.byte	W72
@ 017   ----------------------------------------
	.byte	W72
@ 018   ----------------------------------------
	.byte	W72
@ 019   ----------------------------------------
	.byte	W72
@ 020   ----------------------------------------
	.byte	W72
@ 021   ----------------------------------------
	.byte	W72
@ 022   ----------------------------------------
	.byte	W72
@ 023   ----------------------------------------
	.byte	W72
@ 024   ----------------------------------------
	.byte	W72
@ 025   ----------------------------------------
	.byte		N44   , As2 
	.byte	W72
@ 026   ----------------------------------------
	.byte	W72
@ 027   ----------------------------------------
	.byte	W72
@ 028   ----------------------------------------
	.byte	W72
@ 029   ----------------------------------------
	.byte	W72
@ 030   ----------------------------------------
	.byte	W72
@ 031   ----------------------------------------
	.byte	W72
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte		N92   
	.byte	W72
@ 034   ----------------------------------------
	.byte	W72
@ 035   ----------------------------------------
	.byte	W48
	.byte		N44   
	.byte	W24
@ 036   ----------------------------------------
	.byte	W72
@ 037   ----------------------------------------
	.byte	W12
	.byte		N11   , Fs2 , v092
	.byte	W18
	.byte		N08   , Fs2 , v088
	.byte	W18
	.byte		N23   
	.byte	W24
@ 038   ----------------------------------------
	.byte		N11   , Fs2 , v092
	.byte	W72
@ 039   ----------------------------------------
	.byte	W72
@ 040   ----------------------------------------
	.byte	W72
@ 041   ----------------------------------------
	.byte	W72
@ 042   ----------------------------------------
	.byte	W72
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_11_B1
The_Gay_Agenda_FINAL_3_11_B2:
	.byte	FINE

@**************** Track 12 (Midi-Chn.12) ****************@

The_Gay_Agenda_FINAL_3_12:
	.byte		VOL   , 127*The_Gay_Agenda_FINAL_3_mvl/mxv
	.byte	KEYSH , The_Gay_Agenda_FINAL_3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 0
	.byte	W72
@ 001   ----------------------------------------
	.byte	W72
@ 002   ----------------------------------------
	.byte	W72
@ 003   ----------------------------------------
	.byte	W72
@ 004   ----------------------------------------
	.byte	W72
@ 005   ----------------------------------------
	.byte	W72
@ 006   ----------------------------------------
	.byte	W72
@ 007   ----------------------------------------
	.byte	W48
	.byte		N92   , Ds3 , v084
	.byte	W24
@ 008   ----------------------------------------
	.byte	W72
The_Gay_Agenda_FINAL_3_12_B1:
@ 009   ----------------------------------------
	.byte	W72
@ 010   ----------------------------------------
	.byte	W72
@ 011   ----------------------------------------
	.byte	W72
@ 012   ----------------------------------------
	.byte	W72
@ 013   ----------------------------------------
	.byte	W72
@ 014   ----------------------------------------
	.byte	W72
@ 015   ----------------------------------------
	.byte	W72
@ 016   ----------------------------------------
	.byte	W72
@ 017   ----------------------------------------
	.byte		N11   , Fn2 , v092
	.byte	W36
	.byte		        Ds2 
	.byte	W36
@ 018   ----------------------------------------
	.byte		        Cs2 
	.byte	W36
	.byte		        Bn1 
	.byte	W36
@ 019   ----------------------------------------
	.byte		        As1 
	.byte	W24
	.byte		        Gs1 
	.byte	W24
	.byte		        Fs2 , v112
	.byte	W24
@ 020   ----------------------------------------
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		N11   
	.byte	W24
@ 021   ----------------------------------------
	.byte		N92   , Cs2 , v076
	.byte	W72
@ 022   ----------------------------------------
The_Gay_Agenda_FINAL_3_12_022:
	.byte	W24
	.byte		N44   , Ds3 , v080
	.byte	W48
	.byte	PEND
@ 023   ----------------------------------------
	.byte		N11   , Cs3 
	.byte	W24
	.byte		        Ds3 
	.byte	W12
	.byte		N05   , Cs3 
	.byte	W24
	.byte		        As2 
	.byte	W12
@ 024   ----------------------------------------
	.byte		N11   , Cs3 
	.byte	W12
	.byte		N05   , As2 
	.byte	W12
	.byte		N11   , Cs3 
	.byte	W12
	.byte		N05   , As2 
	.byte	W12
	.byte		N11   , Cs3 
	.byte	W24
@ 025   ----------------------------------------
	.byte		N44   , Gs2 
	.byte	W48
	.byte		N11   , Fs2 
	.byte	W24
@ 026   ----------------------------------------
	.byte		        Gs2 
	.byte	W12
	.byte		N05   , Fs2 
	.byte	W60
@ 027   ----------------------------------------
	.byte	W72
@ 028   ----------------------------------------
	.byte	W72
@ 029   ----------------------------------------
	.byte	W48
	.byte		N44   , Ds3 
	.byte	W24
@ 030   ----------------------------------------
	.byte	W24
	.byte		        As2 
	.byte	W48
@ 031   ----------------------------------------
	.byte		N44   
	.byte	W72
@ 032   ----------------------------------------
	.byte	W72
@ 033   ----------------------------------------
	.byte		        Fs3 
	.byte	W48
	.byte		N11   
	.byte	W24
@ 034   ----------------------------------------
	.byte		        Ds3 
	.byte	W12
	.byte		N05   , Fs3 
	.byte	W60
@ 035   ----------------------------------------
	.byte	W48
	.byte		N44   
	.byte	W24
@ 036   ----------------------------------------
	.byte	W24
	.byte		N11   
	.byte	W24
	.byte		        Gs3 
	.byte	W12
	.byte		N05   , Fs3 
	.byte	W12
@ 037   ----------------------------------------
	.byte	W12
	.byte		N44   , Ds4 
	.byte	W12
	.byte	W48
@ 038   ----------------------------------------
	.byte		N11   , Fs3 
	.byte	W12
	.byte		N05   , Ds3 
	.byte	W60
@ 039   ----------------------------------------
	.byte	W72
@ 040   ----------------------------------------
	.byte	PATT
	 .word	The_Gay_Agenda_FINAL_3_12_022
@ 041   ----------------------------------------
	.byte		N44   , As2 , v080
	.byte	W48
	.byte		N44   
	.byte	W24
@ 042   ----------------------------------------
	.byte	W72
@ 043   ----------------------------------------
	.byte	W48
	.byte	GOTO
	 .word	The_Gay_Agenda_FINAL_3_12_B1
The_Gay_Agenda_FINAL_3_12_B2:
	.byte	FINE

@******************************************************@
	.align	2

The_Gay_Agenda_FINAL_3:
	.byte	12	@ NumTrks
	.byte	0	@ NumBlks
	.byte	The_Gay_Agenda_FINAL_3_pri	@ Priority
	.byte	The_Gay_Agenda_FINAL_3_rev	@ Reverb.

	.word	The_Gay_Agenda_FINAL_3_grp

	.word	The_Gay_Agenda_FINAL_3_1
	.word	The_Gay_Agenda_FINAL_3_2
	.word	The_Gay_Agenda_FINAL_3_3
	.word	The_Gay_Agenda_FINAL_3_4
	.word	The_Gay_Agenda_FINAL_3_5
	.word	The_Gay_Agenda_FINAL_3_6
	.word	The_Gay_Agenda_FINAL_3_7
	.word	The_Gay_Agenda_FINAL_3_8
	.word	The_Gay_Agenda_FINAL_3_9
	.word	The_Gay_Agenda_FINAL_3_10
	.word	The_Gay_Agenda_FINAL_3_11
	.word	The_Gay_Agenda_FINAL_3_12

	.end
