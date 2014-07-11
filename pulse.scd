(
~p0 = Synth("pulse", [ch0: 0, ch1: 1, amp: 0]);
~p1 = Synth("pulse", [ch0: 2, ch1: 3, amp: 0]);
~d0 = Synth("dust",  [ch0: 0, ch1: 3, amp: 0]);
~d1 = Synth("dust",  [ch0: 1, ch1: 2, amp: 0]);
~volume = 0.5
)


~p0.set("amp", ~volume);
~p0.set("freq", 0.5);
~p0.set("freq", 4);
~p0.set("freq", 16);
~p0.set("freq", 440);
~p0.set("freq", 10000);

~p0.set("amp", 0);

~p1.set("amp", ~volume);
~p1.set("freq", 0.5);
~p1.set("freq", 4);
~p1.set("freq", 16);
~p1.set("freq", 440);
~p1.set("freq", 10000);

~p1.set("amp", 0);

~d0.set("amp", ~volume);
~d0.set("freq", 0.5);
~d0.set("freq", 4);
~d0.set("freq", 16);
~d0.set("freq", 440);
~d0.set("freq", 10000); 

~d0.set("amp", 0);

~d1.set("amp", ~volume);
~d1.set("freq", 0.5);
~d1.set("freq", 4);
~d1.set("freq", 16);
~d1.set("freq", 440);
~d1.set("freq", 10000);

~d1.set("amp", 0);


~p0.set("amp", ~volume); ~p1.set("amp", ~volume);
~p0.set("amp", 0); ~p1.set("amp", 0);

~p0.set("freq", 0.5);  ~p1.set("freq", 0.5);
~p0.set("freq", 4);    ~p1.set("freq", 4);
~p0.set("freq", 16);   ~p1.set("freq", 16);
~p0.set("freq", 440);  ~p1.set("freq", 440);
~p0.set("freq", 10000);~p1.set("freq", 10000);


~d0.set("amp", ~volume); ~d1.set("amp", ~volume);
~d0.set("amp", 0); ~d1.set("amp", 0);

~d0.set("freq", 0.5);  ~d1.set("freq", 0.5);
~d0.set("freq", 4);    ~d1.set("freq", 4);
~d0.set("freq", 16);   ~d1.set("freq", 16);
~d0.set("freq", 440);  ~d1.set("freq", 440);
~d0.set("freq", 10000);~d1.set("freq", 10000);


s.queryAllNodes;
s.sendMsg("/n_free", 1335);

~p0.free; ~d0.free; ~p1.free; ~d1.free;
