//////////////////////////////////////////////////////////////////////////

// i found these two to be particularly interesting - they feed into my infatuation with synths that sound like glass - or that space tape-y irridecent reflective color.

(
// harmonic swimming - i thought the artifacting (i think it's lossy?) sounded really cool when pushed to the higher register
// i am usually pretty cautious when editing code - i always fear if i break something not even ctrl z will save me
play({
	var f, p, z, offset;
	f = 80;		// fundamental frequency
	p = 50;		// number of partials per channel
	z = 0.0;		// start of oscil daisy chain
	offset = Line.kr(0, -0.01, 90); // causes sound to separate and fade
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				max(0, 			// clip negative amplitudes to zero
					LFNoise1.kr(
						6 + [4.0.rand2, 4.0.rand2],	// amplitude rate
						0.02, 					// amplitude scale
						offset					// amplitude offset
					)
				),
				z
		)
	});
	z
}))

//////////////////////////////////////////////////////////////////////////

(
// harmonic tumbling - the longer, dreamier one
play({
	var f, p, z, trig;
	f = 100;	// fundamental frequency !i like 100 as the fundamental - it sounds like windchimes!
	p = 5;	// number of partials per channel !i like 5 for number of particals!
	z = 0.0;	// start of oscil daisy chain
	trig = XLine.kr([10,10], 0.5, 100);	// trigger probability decreases over time
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				Decay2.kr(
					Dust.kr(
						trig,		// trigger rate
						0.05		// trigger amplitude
					),
				1, 	// grain attack time //!OH YOU CAN MAKE IT LESS BUBBLY THIS WAY!//
					0.5.rand	// grain decay time
				),
				z
		)
	});
	z
}))

//////////////////////////////////////////////////////////////////////////

(
// harmonic tumbling - bubbly, fishbowl-y, sticking your hands in a tub of marbels :)
play({
	var f, p, z, trig;
	f = 200;	// fundamental frequency
	p = 10;	// number of partials per channel
	z = 0.0;	// start of oscil daisy chain
	trig = XLine.kr([10,10], 0.1, 100);	// trigger probability decreases over time
	p.do({ arg i;
		z = FSinOsc.ar(
				f * (i+1), 		// freq of partial
				0,
				Decay2.kr(
					Dust.kr(
						trig,		// trigger rate
						0.05		// trigger amplitude
					),
					0.005, 	// grain attack time
					0.5.rand	// grain decay time
				),
				z
		)
	});
	z
}))

//////////////////////////////////////////////////////////////////////////