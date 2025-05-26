CLS :Print "All Ten solver"
Print

Dim lst(4) As string
Dim op(5) As string

op(0)="+"
op(1)="-"
op(2)="*"
op(3)="/"
op(4)=""

n=5

For i=0 To 3
  Print "Number",i+1;
  Input lst(i)
Next i

Print "Number to solve for ";
Print "(empty for all)";
Input n
Print

c=0
'p=0

For i=0 To 3
For j=0 To 3
If j=i Then
  Continue For
EndIf
For k=0 To 3
If k=i Or k=j Then
  Continue For
EndIf
m=6-i-j-k

For o1=0 To 4
For o2=0 To 4
For o3=0 To 4
e$="r="+lst(i)+op(o1)+lst(j)+op(o2)
e$=e$+lst(k)+op(o3)+lst(m)
exe e$

e$="r=("+lst(i)+op(o1)+lst(j)+")"
If o2=4 Then
  opp$="*"
Else
  opp$=op(o2)
EndIf
e$=e$+opp$+lst(k)+opp$+lst(m)
exe e$

If o1=3 And o2=1 Then
  If Val(lst(j))-Val(lst(k))=0 Then
    GoTo z1
  EndIf
EndIf
If o1=4 Then
  opp$="*"
Else
  opp$=op(o1)
EndIf
e$="r="+lst(i)+opp$+"("+lst(j)
If o3=4 Then
  opp2$="*"
Else
  opp2$=op(o3)
EndIf
e$=e$+opp$+lst(k)+")"+opp2$+lst(m)
exe e$

z1:
If o2=3 And o3=1 Then
  If Val(lst(k))-Val(lst(m))=0 Then
    GoTo z2
  EndIf
EndIf
If o2=4 Then
opp$="*"
Else
opp$=op(o2)
EndIf
e$="r="+lst(i)+op(o1)+lst(j)+opp$
e$=e$+"("+lst(k)+op(o3)+lst(m)+")"
exe e$

z2:
e$="r=("+lst(i)+op(o1)+lst(j)+op(o2)
If o3=4 Then
opp$="*"
Else
opp$=op(o3)
EndIf
e$=e$+lst(k)+")"+opp$+lst(m)
exe e$

If o1=3 Then
  z$="r="+lst(j)+op(o2)
  z$=z$+lst(k)+op(o3)+lst(m)
  Execute z$
  If r=0 Then
    GoTo z3
  EndIf
EndIf
If o1=4 Then
opp$="*"
Else
opp$=op(o1)
EndIf
e$="r="+lst(i)+opp$+"("+lst(j)+op(o2)
e$=e$+lst(k)+op(o3)+lst(m)+")"
exe e$

' 1
z3:
e$="r=(("+lst(i)+op(o1)+lst(j)+")"
If o3=4 Then
opp$="*"
Else
opp$=op(o3)
EndIf
If o2=4 Then
opp2$="*"
Else
opp2$=op(o2)
EndIf
e$=e$+opp2$+lst(k)+")"+opp$+lst(m)
exe e$

' 2
If o1=3 And o2=1 Then
  If Val(lst(j))-Val(lst(k))=0 Then
    GoTo z4
  EndIf
EndIf
If o1=4 Then
opp$="*"
Else
opp$=op(o1)
EndIf
e$="r=("+lst(i)+opp$+"("+lst(j)
If o3=4 Then
  opp$="*"
Else
  opp$=op(o3)
EndIf
e$=e$+op(o2)+lst(k)+"))"+opp$+lst(m)
exe e$

' 3
z4:
If o1=3 Then
  z$="r=("+lst(j)
If o3=4 Then
opp$="*"
Else
opp$=op(o3)
EndIf
z$=z$+op(o2)+lst(k)+")"+opp$+lst(m)
  Execute z$
  If r=0 Then
    GoTo z5
  EndIf
EndIf
If o1=4 Then
opp$="*"
Else
opp$=op(o1)
EndIf
If o3=4 Then
opp2$="*"
Else
opp2$=op(o3)
EndIf
If o2=1 Then
  If lst(j)=lst(k) Then
    If o3=3 Then
      GoTo z5
    EndIf
  EndIf
EndIf
e$="r="+lst(i)+opp$+"(("+lst(j)
e$=e$+op(o2)+lst(k)+")"+opp2$+lst(m)
e$=e$+")"
exe e$

' 4
z5:
If o2=3 And o3=1 Then
  If Val(lst(k))-Val(lst(m))=0 Then
    GoTo z6
  EndIf
EndIf
If o1=3 Then
  If o2=4 Then
    opp$="*"
  Else
    opp$=op(o2)
  EndIf
  z$="r="+lst(j)+opp$
  z$=z$+"("+lst(k)+op(o3)+lst(m)+")"
  Execute z$
  If r=0 Then
    GoTo z6
  EndIf
EndIf
If o1=4 Then
opp$="*"
Else
opp$=op(1)
EndIf
If o2=4 Then
opp2$="*"
Else
opp2$=op(o2)
EndIf
e$="r="+lst(i)+opp$+"("+lst(j)+opp2$
e$=e$+"("+lst(k)+op(o3)+lst(m)+"))"
exe e$

' 5
z6:
If o2=3 And o3=1 Then
  If Val(lst(k))-Val(lst(m))=0 Then
    GoTo z7
  EndIf
EndIf
If o2=4 Then
opp$="*"
Else
opp$=op(o2)
EndIf
e$="r=("+lst(i)+op(o1)+lst(j)+")"+opp$
e$=e$+"("+lst(k)+op(o3)+lst(m)+")"
exe e$

z7:
'End

Next o3
Next o2
Next o1

Next k
Next j
Next i

Print Str$(c)+" solutions found"
'Print Str$(p)+" permutations tried"

Sub exe e$
p=p+1
Execute e$
If n=0 Then
  If r>0 And r<11 And r=Int(r) Then
    Print r;Mid$(e$,2)
    'Print r
    If c Mod 24=0 And c>0 Then
Input "Press Enter to continue...",q
    EndIf
    c=c+1
  EndIf
Else
  If r=n Then
    Print r;Mid$(e$,2)
    If c Mod 24=0 And c>0 Then
Input "Press Enter to continue...",q
    EndIf
    c=c+1
  EndIf
EndIf
End Sub
