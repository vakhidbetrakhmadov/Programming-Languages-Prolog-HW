% knowledge base

flight(istanbul,izmir,3). % fact: Istanbul and Izmir has a flight with cost 3.
flight(istanbul,trabzon,3).
flight(istanbul,ankara,5).

flight(trabzon,istanbul,3).
flight(trabzon,ankara,2).

flight(ankara,istanbul,5).
flight(ankara,trabzon,2).
flight(ankara,izmir,6).
flight(ankara,konya,8).

flight(izmir,istanbul,3).
flight(izmir,ankara,6).
flight(izmir,antalya,1).

flight(antalya,izmir,1).
flight(antalya,diyarbakir,5).

flight(konya,ankara,8).
flight(konya,kars,5).
flight(konya,diyarbakir,1).

flight(diyarbakir,konya,1).
flight(diyarbakir,antalya,5).

flight(kars,konya,5).
flight(kars,gaziantep,3).

flight(gaziantep,kars,3).

flight(edirne,edremit,5).

flight(edremit,edirne,5).
flight(edremit,erzincan,7).

flight(erzincan,edremit,7).

% rules

route(From,To,Cost) :- 
	\+ route_h(From,To,Cost,[],0,[]).

add(Element,List,[Element|List]).

list2(Element1, Element2, [Element1 | [Element2]]).

list1(Element, [Element]).

not_member(Element,List) :- 
	\+ member(Element,List).

route_h(From,To,Cost,VisitedList,CostSoFar,RoutesList) :-
	flight(From,Transit,ToTransitCost),
	not_member(Transit,VisitedList),
	list1(From,FromAsList),
	append(FromAsList,VisitedList,NewVisitedList),
	NewCostSoFar is (CostSoFar + ToTransitCost),
	list2(Transit,NewCostSoFar,Route),
	add(Route,RoutesList,NewRoutesList),
	[H | T ] = NewRoutesList,
	write(H),nl,
	route_h(Transit,To,FromTransitCost,NewVisitedList,NewCostSoFar,NewRoutesList).
