

%Bitte Funktion auch in der Form [z,s]=pivot_el(T) aufrufen, um z und s
%wiederzubekommen



function [z,s] = pivot_el(T)


[k,l] = size(T);
m=k-1;                               %Zeilen von T = m+1
n=l-1;                               %Spalten von T = n+1

C=zeros(1,n+1);
r=zeros(m+1,1);
b=zeros(m+1,1);
q=zeros(m,1);



for j=1:n
    
    C(j)=T(1,j);                    %Initialisierung der 1. Zeile als C, d.h. der reduzierten Kosten
      
end


if C(:) >= 0                            %Überprüfung auf etwaige Optimalität
   
       % disp('LP ist jetzt optimal. Reduzierte Kosten sind positiv');
        z=Inf;                          %Inf ist Platzhalter für z, wenn LP optimal ist
        s=Inf;                          %Inf ist Platzhalter für s, wenn LP optimal ist
        return
end





[~,s]=min(C);                        %Kleinste reduzierte Kosten s. Matlab wählt automatisch kleinsten Index bei Uneindeutigkeit

for i=1:m+1
    r(i)=T(i,s);                     %Pivotspalte r entspricht s-te Spalte von T
end


for i=1:m+1                          %Auswahl der rechten Seite, d.h. der b-Spalte
    b(i)=T(i,n+1);
end

for i=2:m+1
    if b(i)<0
        disp('LP ist unzulässig! b-Vektor enthält Negative!');  %return bei unzulässigem b-Vektor
        z=-Inf;
        return
    end
end


for i=2:m+1
    
    if r(i) <= 0
        q(i-1)=1;           %Initialisierung eines Vektors q, der Einsen speichert bei Negativeinträgen von der Pivotspalte
    else
        q(i-1)=0;       
    end
end

if ones(m,1)==q
    z=0;
    disp('LP ist unbeschränkt! Eine Spalte von T wird kleiner 0 iteriert!');
    return
end                                            %Falle ALLE Einträge der Pivotspalte negativ sind, ist LP unbeschränkt
        
z=2;    
for i=2:m+1         %Start in der zweiten Zeile
    
    if r(i)>0           %Nur positive Einträge der Pivotspalte berücksichtigen
        if b(i)==0      %Falls der Eintrag bei b schon 0 ist, reicht der zugehörige Pivotspalteneintrag als Pivot. Diese Wahl ist auch nicht eindeutig, Matlab nimmt automatisch den kleinsten Index.
            minquo(i-1) = 0;
        else
            
    minquo(i-1)=b(i)/r(i);      %Quotientenregel sonst
    
        end
    else
        minquo(i-1)=inf;        %Falls Pivotspalteneintrag negativ, setze "unendlich" als Quotientenwert              
    end        
end

%hilfsvektor=zeros(1,m);         %Erstellung eines Hilfsvektors

%for i=1:m
 %   hilfsvektor(i)=inf;         %Hilfsvektor hat nur "unendlich" als Einträge
%end

%if minquo==hilfsvektor          %Falls die Quotienten aber schon alle "unendlich" sind, sprich die Pivotspalte negativ oder 0 ist, dann Fehlermeldung
 %   disp('Evtl. muss andere Pivotspalte ausgewählt werden oder LP nicht lösbar!Ausgegebene z und s sind falsch!');
%return
%end



[~,e]=min(minquo);              %Kleinsten Quotient ausmachen und mit e kennzeichnen
z=e+1;                          %z entspricht gerade e+1

end

