program Minpath_Dijkstra;
const
    MaxN = 10000;
type
    vector = Array[1..MaxN,1..MaxN] of integer;
var
    c : vector;
    trace : Array[1..MaxN] of integer;
    Free : Array[1..MaxN] of boolean;
    n, m, S, F : integer;
procedure Input;
var
    i, u, v : integer;
begin
    readln(n,m,S,F);
    for i := 1 to m do readln(u,v,c[u,v]);
    for i := 1 to n do 
    begin
        Free[i] := true;
        trace[i] := S;
    end;
    for u := 1 to n do
        for v := 1 to n do 
            if c[u,v] = 0 then c[u,v] := MaxN;
    c[S][S] := 0;
end;
procedure Process;
var
    i, v, u, min : integer;
begin
    u   := 0;
    min := MaxN;
    for i := 1 to n do
        if Free[i] and (c[S][i] < min) then
        begin
            min := c[S][i];
            u   := i;
        end;
    if (u = 0) or (u = F) then exit;
    Free[u] := false;
    for v := 1 to n do
        if Free[v] and (c[S][v] > c[S][u] + c[u][v]) then
        begin
            c[S][v] := c[S][u] + c[u][v];
            trace[v] := u;
        end;
    Process;
end;
procedure Output;
begin
    if c[S][F] = MaxN then writeln('There is no path from ',S,' to ',F,'.') else
    begin
        writeln('Distance from ',S,' to ',F,': ',c[S][F]);
        while (F <> S) do
        begin
            write(F,'<-');
            F := trace[F];
        end;
        writeln(S);
    end;
end;
begin
    Input;
    Process;
    Output;
end.
