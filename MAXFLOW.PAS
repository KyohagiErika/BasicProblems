program MaxFlow;
const
	MAX_N = 10000;
type
	vector = array[1..MAX_N] of Integer;
	matrix = array[1..MAX_N,1..MAX_N] of Integer;
var
	f:text;
	n,m,s,t,flow: Integer;
	x: vector;
	c,g: matrix;
procedure Input();
var
	i,u,v: Integer;
begin
	readln(n,m,s,t);
	for i := 1 to m do readln(u,v,c[u,v]);
	flow := 0;
end;
procedure Update(x:vector;k:Integer);
var
	min,i: Integer;
begin
	min := MAX_N;
	for i := 1 to k-1 do 
		if (c[x[i],x[i+1]] < min) then min := c[x[i],x[i+1]];
	for i := 1 to k-1 do
	begin
		g[x[i],x[i+1]] := g[x[i],x[i+1]] + min;
		c[x[i],x[i+1]] := c[x[i],x[i+1]] - min;
	end;
	flow := flow + min;
end;
procedure Process(i : Integer);
var
	xi: Integer;
begin
	if i = 1 then
	begin
		x[i] := s;
		Process(i+1);
	end else
		for xi := 1 to n do
			if c[x[i-1],xi] <> 0 then
			begin
				x[i] := xi;
				if x[i] = t then Update(x,i) else Process(i+1);
				x[i] := 0;
			end;
end;
procedure Output();
var
	i,j: Integer;
begin
	writeln(flow);
	for i := 1 to n do 
	begin
		for j := 1 to n do write(c[i,j],':',g[i,j],' ');
		writeln();
	end;
end;
begin
	Input();
	Process(1);
	Output();
end.
