// instruments

(
// synthetic piano patch (James McCartney)
SynthDef("piano",
	{ arg freq = 440, amp = 0.5, pan = 0, gate = 1,
		ring = 0, tone = 3000;
		var strike, hammerEnv, hammer, pitch, delayTime,
		detune, out, ampEnv;

		strike = Impulse.ar(0.01);
		hammerEnv = Decay2.ar(strike, 0.008, 0.04);
		// excitation envelope
		pitch = freq.cpsmidi;

		out = Mix.ar(Array.fill(3, { arg i;
			// detune strings, calculate delay time
			detune = #[-0.05, 0, 0.04].at(i);
			delayTime = 1 / (pitch + detune).midicps;
			// each string gets own exciter :
			hammer = LFNoise2.ar(tone, hammerEnv);
			// 3000 Hz was chosen by ear..
			CombL.ar(hammer,
				// used as a string resonator				
				delayTime, // max delay time
				delayTime, // actual delay time
				6) // decay time of string
		}));
		ampEnv= EnvGen.kr(Env.asr(0, 1, 0.2), gate, doneAction:2);

		out = out * amp * ampEnv;
		out = out * abs(ring - 1) + (out * SinOsc.ar(1000) * ring);

		Out.ar(pan, out);
	}).add;


SynthDef("pulse",
	{ arg freq = 440, amp = 0.5, ch0 = 0, ch1 = 1;
		var pan, out;
		pan = [ch0, ch1];
		out = Impulse.ar(freq, 0, amp);
		Out.ar(pan, out);
	}).add;

SynthDef("dust",
	{ arg freq = 440, amp = 0.5, ch0 = 0, ch1 = 1;
		var pan, out;
		pan = [ch0, ch1];
		out = Dust.ar(freq, amp);
		Out.ar(pan, out);
}).add;
)
