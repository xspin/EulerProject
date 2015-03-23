runtime =. (6!:2)
an=: 2%~(]*>:)
f=: -.@*@(i. | <:)@>:
ff=: +/@f
g=: (< & 500) @ff

h=: ]`($:@>:)@. (g@an)
NB. echo an h 30
echo an i. 5
