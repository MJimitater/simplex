


function [T_neu] = pivot_op(T,z,s)


[k,l] = size(T);
m=k-1;                               %Zeilen von T = m+1
n=l-1;                               %Spalten von T = n+1

T_neu = zeros(m+1,n+1);

p=T(z,s);                            %Pivotelement in Zeile z und Spalte s



for i=1:n+1
    T_neu(z,i)=T(z,i)/p;            %Pivotzeile durch Pivot teilen, damit das Pivot zu 1 wird                       
end

for j=0:(n+1-s)
    
    for i=1:z-1
        T_neu(i,s+j)=(T_neu(z,s+j)*(-T(i,s))+T(i,s+j));     %Gaußoperation; Erstellung des oben-rechten Quadranten vom Pivot aus gesehen in eine neue Matrix T_neu
    end

    for i=z+1:m+1
        T_neu(i,s+j)=(T_neu(z,s+j)*(-T(i,s))+T(i,s+j));     %Gaußoperation; Erstellung des unten-rechten Quadranten vom Pivot aus gesehen in T_neu
    end

end

for j=1:(s-1)
    
    for i=1:z-1
        T_neu(i,s-j)=(T_neu(z,s-j)*(-T(i,s))+T(i,s-j));     %Gaußoperation; Erstellung des oben-linken Quadranten
    end

    for i=z+1:m+1
        T_neu(i,s-j)=(T_neu(z,s-j)*(-T(i,s))+T(i,s-j));     %Gauß; Erstellung des unten-linken Quadranten
    end

end


end