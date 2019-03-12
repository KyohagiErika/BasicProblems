program QuickSort;
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
procedure Process(S, T : integer);
var
    i, j, lock, temp : integer;
begin
    if S >= T then exit;
    lock := A[(S+T) div 2];
    i    := S;
    j    := T;
    repeat
        while A[i] < lock do i := i + 1;
        while A[j] > lock do j := j - 1;
        if i <= j then
        begin
            temp := A[i];
            A[i] := A[j];
            A[j] := temp;
            i := i + 1;
            j := j - 1;
        end;
    until i > j;
    Process(S,j);
    Process(i,T);
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
    Process(1,n);
    Output;
end.
