program BackTracking;
const
    MaxN = 10000;
type
    vector = Array[1..MaxN] of integer;
var
    n, k : integer;
    x : vector;
    
procedure Input;
begin
    readln(n);
end;

procedure Output(x : vector ; k : integer);
var
    i : integer;
begin
    for i := 1 to k do write(x[i],' ');
    writeln;
end;

procedure Process(k, i : integer);
var
    nSi, j, xi : integer;
    Si : vector;
    ok : boolean;
begin
    
    nSi := 0;
    
    for xi := 1 to n do
    begin
        
        ok := true;
        
            //unclock here
        
{        for j := 1 to i-1 do
            if (xi <= x[j]) then    // xi = x[j]
            begin
                ok := false;
                break;
            end;        }
        
        if ok then 
        begin
            nSi := nSi + 1;
            Si[nSi] := xi;
        end;    
            
    end;
    
    for j := 1 to nSi do
    begin
        x[i] := Si[j];
        if i = k then Output(x,k) else Process(k,i+1);
        x[i] := 0;
    end;
    
end;

begin
    Input;
    for k := 1 to n do Process(k,1);
end.
