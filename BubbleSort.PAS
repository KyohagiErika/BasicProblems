program BubbleSort;
var
    A : Array[1..10000] of integer;
    n : integer;
procedure Input;
var
    i : integer;
begin
    readln(n);
    for i := 1 to n do readln(A[i]);
end;
procedure Process;
var
    i, j, temp : integer;
begin
    for i := 1 to n-1 do 
        for j := i+1 to n do if A[i] > A[j] then
        begin
            temp := A[i];
            A[i] := A[j];
            A[j] := temp;
        end;
end;
procedure Output;
var
    i : integer;
begin
    for i := 1 to n do write(A[i],' ');
    writeln;
end;
begin
    Input;
    Process;
    Output;
end.
