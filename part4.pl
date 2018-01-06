intersect_emptyL([],S,[]).
intersect_emptyS(L,[],[]).
intersect_emptyLS([],[],[]).

intersect_s_contains_e(E,S,[E]).
intersect_s_doesnt_contain_e(E,S,[]).

intersect_contains(E,S,U) :-
	member(E,S),
	intersect_s_contains_e(E,S,U).

intersect_contains(E,S,U) :-
	\+ member(E,S),
	intersect_s_doesnt_contain_e(E,S,U).

intersect_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	LengthS > 0,
	LengthL = 0,
	intersect_emptyL(L,S,U).

intersect_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	LengthL > 0,
	LengthS = 0,
	intersect_emptyS(L,S,U).

intersect_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	(LengthL = 0),
	(LengthS = 0),
	intersect_emptyLS(L,S,U).

intersect_my(L,S,U) :-
	[H|T] = L,
	intersect_contains(H,S,Temp1),
	intersect_my(T,S,Temp2),
	append(Temp1,Temp2,U).

%% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% 

substruct_emptyL([],S,[]).
substruct_emptyS(L,[],L).
substruct_emptyLS([],[],[]).

substruct_s_contains_e(E,S,[]).
substruct_s_doesnt_contain_e(E,S,[E]).

substruct_contains(E,S,U) :-
	member(E,S),
	substruct_s_contains_e(E,S,U).

substruct_contains(E,S,U) :-
	\+ member(E,S),
	substruct_s_doesnt_contain_e(E,S,U).

substruct_my(L,S,U) :-
	length(S,Length),
	Length > 0,
	substruct_emptyL(L,S,U).

substruct_my(L,S,U) :-
	length(L,Length),
	Length > 0,
	substruct_emptyS(L,S,U).

substruct_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	(LengthL = 0),
	(LengthS = 0),
	substruct_emptyLS(L,S,U).

substruct_my(L,S,U) :-
	[H | T] = L,
	substruct_contains(H,S,Temp1),
	substruct_my(T,S,Temp2),
	append(Temp1,Temp2,U).

union_emptyL([],S,S).
union_emptyS(L,[],L).
union_emptyLS([],[],[]).

union_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	(LengthS > 0),
	(LengthL = 0),
	union_emptyL(L,S,U).

union_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	(LengthL > 0),
	(LengthS = 0),
	union_emptyS(L,S,U).

union_my(L,S,U) :-
	length(L,LengthL),
	length(S,LengthS),
	(LengthL = 0),
	(LengthS = 0),
	union_emptyLS(L,S,U).

union_my(L,S,U) :-
	intersect_my(L,S,Intersection),
	substruct_my(L,Intersection,Temp1),
	substruct_my(S,Intersection,Temp2),
	append(Temp1,Temp2,Temp3),
	append(Intersection,Temp3,U).

%% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% %% 

empty_list([]).
list(Element,[Element]).

flatten_my(Element,List) :-
	\+ length(Element,Length),
	list(Element,List).

flatten_my(List,Flattened) :-
	length(List,Length),
	(Length = 0),
	empty_list(Flattened).

flatten_my(List,Flattened) :-
	[H | T] = List,
	flatten_my(H,Temp1),
	flatten_my(T,Temp2),
	append(Temp1,Temp2,Flattened).




