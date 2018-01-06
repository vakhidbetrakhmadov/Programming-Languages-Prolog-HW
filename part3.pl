session('A',10,101).
session('B',12,104).
session('C',11,102).
session('D',16,103).
session('E',17,103).
session('F',12,101).
session('G',14,103).
session('H',13,103).

enrollment(1,'A').
enrollment(1,'B').
enrollment(2,'A').
enrollment(3,'B').
enrollment(4,'C').
enrollment(5,'D').
enrollment(6,'D').
enrollment(6,'A').
enrollment(7,'A').
enrollment(7,'B').
enrollment(8,'F').
enrollment(8,'D').
enrollment(9,'C').
enrollment(9,'E').
enrollment(10,'G').
enrollment(10,'D').
enrollment(11,'F').
enrollment(11,'G').

when(Session,Time) :-
	session(Session,Time,Room).

where(Session,Room) :-
	session(Session,Time,Room).

enrolled(Attandee,Session) :-
	enrollment(Attandee,Session).

schedule(Attandee,Room,Time) :- 
	enrollment(Attandee,Session),
	session(Session,Time,Room).

usage(Room,Time) :-
	session(Session,Time,Room).

conflict(SessionX,SessionY) :-
	session(SessionX,TimeX,RoomX),
	session(SessionY,TimeY,RoomY),
	\+ (SessionX = SessionY),
	(RoomX = RoomY),
	abs(TimeX - TimeY) < 2.

meet(AttandeeX,AttandeeY) :-
	schedule(AttandeeX,RoomX,TimeX),
	schedule(AttandeeY,RoomY,TimeY),
	\+ (AttandeeX = AttandeeY),
	(RoomX = RoomY),
	(TimeX = TimeY).