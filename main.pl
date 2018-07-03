/* Set total number of seats */
totalSeats( X ):-
  X is 89.

/* All the gaps in the seats */
gapleft(9).
gapleft(16).
gapleft(26).
gapleft(34).
gapleft(45).
gapleft(54).
gapleft(65).
gapleft(75).
gapleft(79).
gapleft(84).
gapleft(88).

gapright(87).
gapright(83).
gapright(78).
gapright(74).
gapright(64).
gapright(53).
gapright(44).
gapright(33).
gapright(25).
gapright(15).
gapright(8).

/* help functions */
help:-
  write('To get output on the screen run normal(10, X). \nTo get output in a file run wnormal(10) \nTo see full list of commands type "commands."').

commands:-
  write('Normal seating'),
  write('\nnormal(Number, X ) - Number is the number of students and X will be output'),
  write('\nwnormal(Number) - Number is the number of students, output will be in output.txt in the same folder.'),
  write('\nlistcheckn(List of student names, List of seat numbers) - Enter a list of students and list of seats to get full output on screen.'),
  write('\n\n'),
  write('Reverse seating'),
  write('\nreversez(Number, X ) - Number is the number of students and X will be output'),
  write('\nwnreversez(Number) - Number is the number of students, output will be in output.txt in the same folder.'),
  write('\nlistcheckr(List of student names, List of seat numbers) - Enter a list of students and list of seats to get full output on screen.').

/* global functions */
/* Takes the head off or keeps the head on */
headoff([_|T], T).
headon(T, T).

/* Makes a list from 1 to N */
makelist(N, L):-
  findall(Num, between(1, N, Num), L).

/* Write to file, change the file name here */
writetofile(X) :-
  open('output.txt', write, ID),
  write(ID, X),
  close(ID).

/* Shuffles a list */
randomnumber(N):-
  randomize,
  get_seed(R),
  totalSeats(Z),
  N is R mod Z.

/* Makes a list of 'Number' length filled with random numbers */
shufflelist( In, Ou):-
  permutation(In, Ou),
  randomnumber(N),
  Ou = [ N | T].

/* 1. Normal seat fill */
/* Calls the check function and writes the output to file */
wnormal(X):-
    normal(X, L),
    writetofile(L).

/* Makes a list of variables, makes a list of seats and then starts assigning things */
normal(X, Z):-
  length(Z, X),
  totalSeats(T),
  makelist(T, L),
  listcheckn( Z, L ).

/* If first list is NULL then ran out of students */
listcheckn([], _ ):-
  write('All seats assigned'),
      !.

/* If second list is NULL then ran out of seats */
listcheckn(_, []):-
  write('Ran out of seats'),
      !.

/* Assigns variables to each seat */
listcheckn([H|T], [H|Z]):-
  checkseatnormal(Z,W),
  listcheckn(T,W).

/* Checks if there is a gap next to seat, if there is then don't trim the head of seat list */
checkseatnormal([H|T], R):-
  (gapleft(H) -> headon([H|T], R);
  headoff([H|T], R)).

/* 2. Reverse seat fill */
/* Fills a class in reverse */
reversez(X, Z):-
  length(Z, X),
  totalSeats(T),
  makelist(T, L),
  reverse(L, A),
  listcheckr( Z, A ).

/* Calls the reverse function and writes to file */
wreversez(X) :-
    reversez(X, L),
    writetofile(L).

listcheckr(_, []):-
  write('Ran out of seats'),
  !.

listcheckr([] , _):-
  write('All seats assigned'),
  !.

/* Assigns variables to each seat */
listcheckr([H|T], [H|Z]):-
    checkseatr(Z,W),
    listcheckr(T,W).

/* Checks if there is a gap next to seat, if there is then don't trim the head of seat list */
checkseatr([H|T], R):-
  (gapright(H) -> headon([H|T], R);
    headoff([H|T], R)).

/* 3. Random seat fill */
wrandom(X) :-
    randoms(X, L),
    writetofile(L).

/* Makes a list of variables, makes a list of seats and then starts assigning things */
randoms(X, Z):-
  length(Z, X),
  totalSeats(T),
  makelist(T, L),
  shufflelist(L, N),
  listcheckrandom( Z, N ).

/* If first list is NULL then ran out of students */
listcheckrandom([], _ ):-
  write('All seats assigned'),
      !.

/* If second list is NULL then ran out of seats */
listcheckrandom(_, []):-
  write('Ran out of seats'),
      !.

/* Assigns variables to each seat */
listcheckrandom([H|T], [H|Z]):-
  checkseatrandom(Z,W),
  listcheckrandom(T,W).

/* Checks if there is a gap next to seat, if there is then don't trim the head of seat list */
checkseatrandom([H|T], R):-
  (gapleft(H) -> headon([H|T], R);
  headoff([H|T], R)).
