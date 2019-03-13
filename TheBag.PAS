program TheBag;
const
    MaxN = 10000;
type
    vector = Array[0..MaxN,0..MaxN] of integer;
var
    n, m : integer;
    A : Array[1..MaxN] of integer;
    F : vector;
    
procedure Input;
var
    i : integer;
begin
    readln(n,m);
    for i := 1 to n do read(A[i]);
end;

function max(a, b : integer) : integer;
begin
    if a > b then exit(a) else exit(b);
end;

procedure Process;
var 
    i, j : integer;
begin
    
    for i := 1 to n do F[i,0] := 0;
    for j := 1 to m do F[0,j] := 0;
    
    for i := 1 to n do
        for j := 1 to m do
            if A[i] > j then F[i,j] := F[i-1,j] else
                F[i,j] := max(F[i-1,j-A[i]]+A[i],F[i-1,j]);
    
end;
            
procedure Output;
begin
    writeln(F[n,m]);
end;

begin
    Input;
    Process;
    Output;
end.
