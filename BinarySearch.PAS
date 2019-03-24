program TimKiemNhiPhan;
const
	MAX_N = 10000;
type
	vector = array[1..MAX_N] of Integer;
var
	n,k,np: Integer;
	A,p: vector;
procedure Input();
var
	i: Integer;
begin
	readln(n,k);
	for i := 1 to n do read(A[i]);
end;
procedure HoanDoi(var a, b : Integer);
var
	tmp: Integer;
begin
	tmp := a;
	a := b;
	b := tmp;
end;
procedure Sort(x,y:Integer);  // Sorting Array
var
	i, j, lock: Integer;
begin
	if (x >= y) then exit;
	lock := A[(x+y) div 2];
	i := x;
	j := y;
	repeat
		while A[i] < lock do i := i + 1;
		while A[j] > lock do j := j - 1;
		if i <= j then
		begin
			HoanDoi(A[i],A[j]);
			i := i + 1;
			j := j - 1;
		end;
	until i>j;
	Sort(x,j); Sort(i,y);
end;
procedure Update(pos:Integer);
begin
	np := np + 1;
	p[np] := pos;
end;
procedure Find(x,y:Integer);  // Binary Search
var
	lock: Integer;
begin
	lock := (x+y) div 2;
	if A[lock] = k then Update(lock) else
	if (lock = 1) then exit else
	if (A[lock] < k) then Find(lock+1,y) else
		Find(lock-1,x);
end;
procedure Output();
var
	i: Integer;
begin
	if np = 0 then writeln(np) else
		for i := 1 to np do write(p[i],' ');
end;
begin
	Input;
	Sort(1,n);
	Find(1,n);
	Output;
end.
