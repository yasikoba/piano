// (setq sclang-runtime-directory "~/supercollider/hyper/")

"boot.scd".load;
"score.scd".load;
"instruments.scd".load;

s.makeGui; // L, F
s.scope;

TempoClock.default.tempo = 40/60;
TempoClock.default.tempo = 80/60;

(
~ring = 1;
~sus = 3;
~ch = [0, 1, 2, 3];
)

~ch = [0];
~ch = [0, 1];

~midinote;
~midinote = [72, \, \, \];
~midinote = [60, \, \, 63];
~midinote = [60, 61, 62, 63];

~midinote = ~midinote.add(\);
~midinote.removeAt(4); ~midinote;

~midinote = ~midinote + 12;
~midinote = ~midinote - 12;

~midinote = ~midinote + [12, 0, 0, -12];
~midinote = ~midinote + [-12, 0, 12, 0];

~midinote = ~midinote.reverse;
~midinote = ~midinote.rotate(1);

~midinote_pattern = Pseq(~midinote, inf);
~midinote_pattern = Pshuf(~midinote, inf);

(
Pdef(\p,
	Pbind(*[		
		instrument: "piano",
		midinote:    ~midinote_pattern,
		dur:         Pseq(~duration, inf),
		amp:         0.5,
		sustain:     Pseq(~sustain, inf) * Pfunc({~sus}),
		tone:        2200 + ((~midinote_pattern % 4) * 700),
		ring:        Pseq([0, 0, 0, 1], inf) * Pfunc({~ring}),
		pan:         ~midinote_pattern % ~ch.size // .trace
	]));

Pdef(\x,
	Pbindf(*[
		Pdef(\p)
	]));
)

Pdef(\x).play;

(
Pdef(\x,
	Pbindf(*[
		Pdef(\p),
		tone: 3000
	]));
)

(
Pdef(\x,
	Pbindf(*[
		Pdef(\p),
		ring: Pfunc({~ring}),
		pan:  Pseq(~ch.stutter(4), inf)
	]));
)

~ring = 1;
~ring = 0;

~sus = 3;
~sus = 0.1;

Pdef(\x).play;
Pdef(\x).pause;


(
Pdef(\y,
	Pbind(*[		
		instrument: "piano",
		midinote:    58,
		amp:         0.3,
		dur:         8,
		tone:        3000,
		ring:        1,
		pan:         ~midinote_pattern % ~ch.size
	]));

)

Pdef(\y).play;
Pdef(\y).pause;
