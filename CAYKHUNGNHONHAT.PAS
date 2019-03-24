program Prim_algorithm;
uses crt;
const
	MAX_N_M = 10000;
type
	matrix = array[1..MAX_N_M,1..MAX_N_M] of Integer;
	vector = array[1..MAX_N_M] of Integer;
var
	n,m,total: Integer;
	c,g: matrix;
	checked: array[1..MAX_N_M] of Boolean;
procedure Input();
var
	i,u,v: Integer;
begin
	readln(n,m);
	for i := 1 to m do
	begin
		read(u,v,c[u,v]);
		c[v,u] := c[u,v];
	end;
end;
procedure Init();
var
	tmp: Integer;
begin
	total := 0;
	randomize();
	tmp := random(n);
	checked[tmp] := true;
end;
procedure Process();
var
	i,j,min,u,v: Integer;
	stop: Boolean;
begin
	repeat
		stop := true;
		for i := 1 to n do
			if not checked[i] then
			begin
				stop := false;
				break;
			end;
		if stop then break;
		min := MAX_N_M;
		u := 0;
		v := 0;
		for i := 1 to n do
			if checked[i] then 
				for j := 1 to n do
					if (not checked[j]) and (c[i,j] <> 0) and (c[i,j] < min) then
					begin
						min := c[i,j];
						u := i;
						v := j;
					end;
		g[u,v] := min;
		g[v,u] := min;
		total := total + min;
		checked[v] := true;
	until false;
end;
procedure Output();
var
	i,j: Integer;
begin
	writeln('min: ',total);
	for i := 1 to n do
		for j := 1 to n do
			if (i < j) and (g[i,j] <> 0) then writeln(i,' ',j,' ',g[i,j]);
end;
begin
	Input();
	Init();
	Process();
	Output();
end.
