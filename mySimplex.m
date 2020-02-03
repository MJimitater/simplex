
%Bitte das Tableau der Form
%
%  |----------------|---|
%  |   Kostenzeile  | 0 |
%  |----------------|---|
%  |                |b1 |
%  |                |b2 |
%  |    Matrix A    |...|
%  |                |bn |
%  |----------------|---|
%
% übergeben als Matrix T der From
%
%  T = [Kostenzeile,0; MatrixA_Zeile1, b1; MatrixA_Zeile2,b2; ...;
%  MatrixA_Zeilen,bn]

%Bitte Funktion auch in der Form [Endtableau, x_opt,z_opt]=mySimplex(T) aufrufen, um
%x_opt und z_opt wiederzubekommen


function [Endtableau, x_opt, z_opt] = mySimplex(T)


[k,l] = size(T);
m=k-1;                              
n=l-1;

x_opt=zeros(n,1);

flag=true;                              %Hilfsvariable, um quasi do-while Schleife zu konstruieren (s.u.)


while flag

[z,s] = pivot_el(T);                    %Bekomme zunächst z und s von Funktion pivot_el


    if z==0                             %Falls z==0 ist, dann war T unbeschränkt
        x_opt=[];
        z_opt=-Inf;                     %...in dem Fall, returne die gewünschten x_opt, z_opt
        Endtableau = T;
        return
     
    elseif z==Inf && s==Inf
        flag=false;                     %In diesem Fall ist T (schon) optimal; Schleife muss nicht fortgeführt werden
        break
        
    elseif z==-Inf                      %Falls b-Seite negativ, also das LP unzulässig...
        x_opt=[];                       %returne x_opt=[] respektive z_opt=[]
        z_opt=[];
        
        return
        
        
    end

%T_neu
T_neu = pivot_op(T,z,s);                %Bezeichnung von T_neu


T=T_neu                               %T_neu wird umbenannt in T, damit while-Schleife wieder durchlaufen kann


end


einheitsvektor = @(n,d) [zeros(n-1,1); 1; zeros(d-n,1)];        %Einführung eines function-handles, um n-ten Einheitsvektor der Dimension d einzuführen 

for j=2:m+1                                                     %Gehe Zeilen durch - starte in Zeile 2; Zeile 1 ist ja c_n
    for i=1:n                                                   %Gehe Spalten durch - letzte Spalte, die n+1ste, ist ja die b-Spalte; die wird natürlich nicht betrachtet
    
        if T(:,i)== einheitsvektor(j,m+1)                       %Vergleich von jeder Spalte mit Einheitsvektor

            x_opt(i)=T(j,n+1);                                  % -> die ruscht in die Basislösung von x, bzw. die übrig gebliebenen sind 0 (x_N=0)
        end
    end
end

z_opt=-T(1,n+1);                                                 %Vom Endtableau beträgt der optimale Zielfunktionswert der Wert oben rechts stehend

Endtableau = T;

end