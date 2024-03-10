	.include "MPlayDef.s"

	.equ	Game_freak_logo3_grp, voicegroup000
	.equ	Game_freak_logo3_pri, 0
	.equ	Game_freak_logo3_rev, 0
	.equ	Game_freak_logo3_mvl, 127
	.equ	Game_freak_logo3_key, 0
	.equ	Game_freak_logo3_tbs, 1
	.equ	Game_freak_logo3_exg, 0
	.equ	Game_freak_logo3_cmp, 1

	.section .rodata
	.global	Game_freak_logo3
	.align	2

@**************** Track 1 (Midi-Chn.1) ****************@

Game_freak_logo3_1:
	.byte	KEYSH , Game_freak_logo3_key+0
@ 000   ----------------------------------------
	.byte	TEMPO , 150*Game_freak_logo3_tbs/2
	.byte		VOICE , 46
	.byte		VOL   , 75*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		BENDR , 2
	.byte		BEND  , c_v+0
	.byte		N02   , En6 , v112
	.byte	W02
	.byte		N01   , Dn6 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		PAN   , c_v-32
	.byte		N02   , Dn6 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		PAN   , c_v+16
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		PAN   , c_v-48
	.byte		N02   , An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		PAN   , c_v+32
	.byte		N01   , En6 , v048
	.byte	W01
	.byte		N02   , Dn6 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		PAN   , c_v-32
	.byte		N02   , Dn6 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		PAN   , c_v+16
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		PAN   , c_v-48
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
@ 001   ----------------------------------------
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , An4 
	.byte	W01
	.byte		N02   , En6 , v016
	.byte	W03
	.byte		        Dn6 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , Dn6 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		PAN   , c_v-48
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , An4 
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N02   , Gs3 
	.byte	W02
	.byte		N01   , Cn4 
	.byte	W01
	.byte		N02   , Dn4 
	.byte	W03
	.byte		        Ds4 
	.byte	W02
	.byte		N01   , Gn4 
	.byte	W01
	.byte		N02   , Gs4 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Ds5 
	.byte	W03
	.byte		PAN   , c_v+16
	.byte		N02   , Dn4 
	.byte	W02
	.byte		N01   , Ds4 
	.byte	W01
	.byte		N02   , Gn4 , v024
	.byte	W03
	.byte		        Gs4 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Ds5 
	.byte	W02
	.byte		N01   , Gn5 
	.byte	W01
	.byte		N02   , Gs5 
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N02   , Ds4 
	.byte	W02
	.byte		N01   , Gn4 , v032
	.byte	W01
	.byte		N02   , Gs4 
	.byte	W03
@ 002   ----------------------------------------
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Ds5 
	.byte	W03
	.byte		        Gn5 
	.byte	W02
	.byte		N01   , Gs5 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		PAN   , c_v+16
	.byte		N02   , Gn4 
	.byte	W02
	.byte		N01   , Gs4 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Ds5 
	.byte	W01
	.byte		N02   , Gn5 
	.byte	W03
	.byte		        Gs5 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , Dn6 
	.byte	W03
	.byte		        Ds6 , v044
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , Gs5 
	.byte	W03
	.byte		        Ds5 
	.byte	W02
	.byte		PAN   , c_v+32
	.byte		N01   , Dn6 , v080
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        As5 
	.byte	W02
	.byte		N01   , Gn5 
	.byte	W01
	.byte		PAN   , c_v-16
	.byte		N02   , Ds5 
	.byte	W03
	.byte		PAN   , c_v-32
	.byte		N02   , Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , As4 
	.byte	W03
	.byte		        Gn4 
	.byte	W02
	.byte		N01   , Ds4 
	.byte	W01
	.byte		N02   , Dn4 
	.byte	W03
	.byte		PAN   , c_v+16
	.byte		N02   , As3 
	.byte	W02
	.byte		N01   , Dn6 , v048
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        As5 
	.byte	W02
	.byte		PAN   , c_v-32
	.byte		N01   , Gn5 
	.byte	W01
	.byte		N02   , Ds5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , As4 
	.byte	W03
	.byte		PAN   , c_v+32
	.byte		N02   , Cn6 , v080
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Gn5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		PAN   , c_v-16
	.byte		N01   , Dn5 
	.byte	W01
	.byte		PAN   , c_v-32
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , Gn4 
	.byte	W01
	.byte		N02   , Fn4 
	.byte	W03
@ 003   ----------------------------------------
	.byte		        Dn4 
	.byte	W02
	.byte		N01   , Cn4 
	.byte	W01
	.byte		N02   , An3 
	.byte	W03
	.byte		PAN   , c_v+16
	.byte		N02   , Cn6 , v048
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Gn5 
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N02   , Fn5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , Gn4 
	.byte	W01
	.byte		N02   , Fn4 
	.byte	W03
	.byte		        Dn4 
	.byte	W02
	.byte		PAN   , c_v+16
	.byte		N01   , Cn6 , v020
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		PAN   , c_v-16
	.byte		N02   , Gn5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , As4 
	.byte	W01
	.byte		N02   , Gs4 
	.byte	W03
	.byte		VOL   , 62*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		N03   , Cn4 , v064
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W03
	.byte		N04   , Bn4 
	.byte	W06
	.byte		        Cn5 
	.byte	W06
	.byte		        En5 
	.byte	W06
	.byte		        Gn5 
	.byte	W06
	.byte		        Bn5 
	.byte	W06
	.byte		        Dn6 
	.byte	W06
	.byte		        En6 , v056
	.byte	W03
@ 004   ----------------------------------------
	.byte	W03
	.byte		VOL   , 53*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En6 , v036
	.byte	W06
	.byte		VOL   , 44*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   , En6 , v032
	.byte	W06
	.byte		VOL   , 37*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En6 , v020
	.byte	W06
	.byte		VOL   , 27*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   , En6 , v012
	.byte	W06
	.byte		VOL   , 22*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En6 , v008
	.byte	W06
	.byte		VOL   , 14*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   
	.byte	W06
	.byte		VOL   , 11*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En6 , v004
	.byte	W06
	.byte		VOL   , 7*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   
	.byte	W06
	.byte		VOL   , 6*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-17
	.byte		N72   
	.byte	W03
	.byte		VOL   , 6*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        5*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        4*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        3*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        3*Game_freak_logo3_mvl/mxv
	.byte	W06
@ 005   ----------------------------------------
	.byte	W03
	.byte		        2*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        1*Game_freak_logo3_mvl/mxv
	.byte	W09
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	W11
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	FINE

@**************** Track 2 (Midi-Chn.2) ****************@

Game_freak_logo3_2:
	.byte	KEYSH , Game_freak_logo3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 46
	.byte		VOL   , 50*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BENDR , 2
	.byte		BEND  , c_v+0
	.byte		N02   , Cn6 , v112
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , An4 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , Fn4 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , An4 
	.byte	W01
	.byte		N02   , Fn4 
	.byte	W03
	.byte		        En4 
	.byte	W02
	.byte		N01   , Cn6 , v064
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , An4 
	.byte	W01
	.byte		N02   , Fn4 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , An4 
	.byte	W03
@ 001   ----------------------------------------
	.byte		        Fn4 
	.byte	W02
	.byte		N01   , En4 
	.byte	W01
	.byte		N02   , Cn6 , v032
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , An4 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , An4 
	.byte	W03
	.byte		        Fn4 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , Fn4 
	.byte	W01
	.byte		N02   , En4 
	.byte	W44
	.byte	W01
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W42
	.byte		VOL   , 40*Game_freak_logo3_mvl/mxv
	.byte		N03   , Cn3 , v064
	.byte	W06
	.byte		        En3 
	.byte	W06
	.byte		        Gn3 
	.byte	W03
	.byte		N04   , Bn3 
	.byte	W06
	.byte		        Cn4 
	.byte	W06
	.byte		        En4 
	.byte	W06
	.byte		        Gn4 
	.byte	W06
	.byte		        Bn4 , v056
	.byte	W06
	.byte		        Dn5 , v052
	.byte	W06
	.byte		        En5 
	.byte	W03
@ 004   ----------------------------------------
	.byte	W03
	.byte		VOL   , 41*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   , En5 , v040
	.byte	W06
	.byte		VOL   , 37*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En5 , v032
	.byte	W06
	.byte		VOL   , 29*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   , En5 , v024
	.byte	W06
	.byte		VOL   , 22*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En5 , v016
	.byte	W06
	.byte		VOL   , 17*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   , En5 , v008
	.byte	W06
	.byte		VOL   , 9*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   , En5 , v004
	.byte	W06
	.byte		VOL   , 4*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N04   
	.byte	W06
	.byte		VOL   , 2*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-32
	.byte		N04   
	.byte	W06
	.byte		VOL   , 1*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+32
	.byte		N76   
	.byte	W42
	.byte		VOL   , 0*Game_freak_logo3_mvl/mxv
	.byte	W03
@ 005   ----------------------------------------
	.byte	W36
	.byte	W03
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	FINE

@**************** Track 3 (Midi-Chn.3) ****************@

Game_freak_logo3_3:
	.byte	KEYSH , Game_freak_logo3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 80
	.byte		VOL   , 31*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+0
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		BEND  , c_v+1
	.byte	W96
@ 001   ----------------------------------------
	.byte	W96
@ 002   ----------------------------------------
	.byte	W96
@ 003   ----------------------------------------
	.byte	W42
	.byte		N72   , CnM2, v048
	.byte	W54
@ 004   ----------------------------------------
	.byte	W18
	.byte	FINE

@**************** Track 4 (Midi-Chn.4) ****************@

Game_freak_logo3_4:
	.byte	KEYSH , Game_freak_logo3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 46
	.byte		VOL   , 25*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+33
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		BEND  , c_v+0
	.byte	W03
	.byte		N02   , En6 , v112
	.byte	W03
	.byte		        Dn6 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , Dn6 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        Cn5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , An4 
	.byte	W03
	.byte		        En6 , v048
	.byte	W02
	.byte		N01   , Dn6 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , Dn6 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , Cn5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
@ 001   ----------------------------------------
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        An4 
	.byte	W02
	.byte		N01   , En6 , v016
	.byte	W01
	.byte		N02   , Dn6 
	.byte	W03
	.byte		        Cn6 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        Dn6 
	.byte	W02
	.byte		N01   , Cn6 
	.byte	W01
	.byte		N02   , An5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Cn6 
	.byte	W03
	.byte		        An5 
	.byte	W02
	.byte		N01   , Fn5 
	.byte	W01
	.byte		N02   , En5 
	.byte	W03
	.byte		        Dn5 
	.byte	W02
	.byte		N01   , An5 
	.byte	W01
	.byte		N02   , Fn5 
	.byte	W03
	.byte		        En5 
	.byte	W02
	.byte		N01   , Dn5 
	.byte	W01
	.byte		N02   , Cn5 
	.byte	W03
	.byte		        Fn5 
	.byte	W02
	.byte		N01   , En5 
	.byte	W01
	.byte		N02   , Dn5 
	.byte	W03
	.byte		VOICE , 1
	.byte		VOL   , 3*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v+16
	.byte		VOL   , 3*Game_freak_logo3_mvl/mxv
	.byte		BEND  , c_v+0
	.byte		N80   , Cn4 , v124
	.byte	W02
	.byte		VOL   , 4*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        6*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        7*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        8*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        9*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        10*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        12*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        13*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        15*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        17*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        19*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        21*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        23*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        26*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        27*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W01
@ 002   ----------------------------------------
	.byte		        30*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        31*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        34*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        35*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        36*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        38*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        39*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        42*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        43*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        44*Game_freak_logo3_mvl/mxv
	.byte		BEND  , c_v-6
	.byte	W02
	.byte		VOL   , 44*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        46*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v-11
	.byte	W01
	.byte		VOL   , 48*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        48*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        49*Game_freak_logo3_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W02
	.byte		VOL   , 50*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v-22
	.byte	W05
	.byte		        c_v+0
	.byte		N12   , Gn3 , v064
	.byte	W12
	.byte		        Gs3 
	.byte	W12
	.byte		        As3 
	.byte	W12
	.byte		N13   , Cn4 , v124
	.byte	W13
	.byte		N30   , An3 
	.byte	W09
@ 003   ----------------------------------------
	.byte	W21
	.byte		N20   , Fn3 
	.byte	W21
	.byte		TIE   , Gn3 
	.byte	W54
@ 004   ----------------------------------------
	.byte		VOL   , 48*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        47*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        45*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        44*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        43*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        42*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        41*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        39*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        38*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        36*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        35*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        34*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        32*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        31*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        30*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        27*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        24*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        21*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        20*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        19*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        17*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        16*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        15*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        13*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        12*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        10*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        9*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        8*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        7*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        6*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        4*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        3*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        1*Game_freak_logo3_mvl/mxv
	.byte	W03
@ 005   ----------------------------------------
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	W28
	.byte		EOT   
	.byte	FINE

@**************** Track 5 (Midi-Chn.5) ****************@

Game_freak_logo3_5:
	.byte	KEYSH , Game_freak_logo3_key+0
@ 000   ----------------------------------------
	.byte		VOICE , 1
	.byte		VOL   , 36*Game_freak_logo3_mvl/mxv
	.byte		PAN   , c_v-17
	.byte		BENDR , 12
	.byte		LFOS  , 44
	.byte		BEND  , c_v+0
	.byte	W96
@ 001   ----------------------------------------
	.byte	W54
	.byte		VOL   , 3*Game_freak_logo3_mvl/mxv
	.byte		N80   , Cn2 , v124
	.byte	W02
	.byte		VOL   , 4*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        6*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        7*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        8*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        9*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        10*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        12*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        13*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        15*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        17*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        19*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        21*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        23*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        26*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        27*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W01
@ 002   ----------------------------------------
	.byte		        30*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        31*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        34*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        35*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        36*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        38*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        39*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        42*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        43*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        44*Game_freak_logo3_mvl/mxv
	.byte		BEND  , c_v-6
	.byte	W02
	.byte		VOL   , 44*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        46*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		BEND  , c_v-11
	.byte	W01
	.byte		VOL   , 48*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        48*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        49*Game_freak_logo3_mvl/mxv
	.byte		BEND  , c_v-16
	.byte	W02
	.byte		VOL   , 50*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		BEND  , c_v-22
	.byte	W05
	.byte		        c_v+0
	.byte		N12   , Gn1 , v064
	.byte	W12
	.byte		        Gs1 
	.byte	W12
	.byte		        As1 
	.byte	W12
	.byte		N13   , Cn2 , v124
	.byte	W13
	.byte		N30   , An1 
	.byte	W09
@ 003   ----------------------------------------
	.byte	W21
	.byte		N20   , Dn1 
	.byte	W21
	.byte		TIE   , En1 
	.byte	W54
@ 004   ----------------------------------------
	.byte		VOL   , 48*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        47*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        45*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        44*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        43*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        42*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        41*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        40*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        39*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        38*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        37*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        36*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        35*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        34*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        33*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        32*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        31*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        30*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        29*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        27*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        25*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        24*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        22*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        21*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        20*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        19*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        18*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        17*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        16*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        15*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        14*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        13*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        12*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        11*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        10*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        9*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        8*Game_freak_logo3_mvl/mxv
	.byte	W01
	.byte		        7*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        6*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        4*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        3*Game_freak_logo3_mvl/mxv
	.byte	W03
	.byte		        1*Game_freak_logo3_mvl/mxv
	.byte	W03
@ 005   ----------------------------------------
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	W02
	.byte		        0*Game_freak_logo3_mvl/mxv
	.byte	W28
	.byte		EOT   
	.byte	FINE

@******************************************************@
	.align	2

Game_freak_logo3:
	.byte	5	@ NumTrks
	.byte	0	@ NumBlks
	.byte	Game_freak_logo3_pri	@ Priority
	.byte	Game_freak_logo3_rev	@ Reverb.

	.word	Game_freak_logo3_grp

	.word	Game_freak_logo3_1
	.word	Game_freak_logo3_2
	.word	Game_freak_logo3_3
	.word	Game_freak_logo3_4
	.word	Game_freak_logo3_5

	.end
