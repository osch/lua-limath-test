-- test bigint library

local B=require"imath"
print(B.version)

------------------------------------------------------------------------------
print""
print("RSA")

header="="
assert(#header==1)

function B2hex(x)
	return B.tostring(x,16)
end

function B2text(x)
	x=x:totext()
	assert(x:sub(1,1)==header)
	return x:sub(2)
end

-- https://primes.utm.edu/lists/small/
p=B.new("2074722246773485207821695222107608587480996474721117292752992589912196684750549658310084416732550077")
q=B.new("58021664585639791181184025950440248398226136069516938232493687505822471836536824298822733710342250697739996825938232641940670857624514103125986134050997697160127301547995788468137887651823707102007839")

public="10001"

d=B.new(public,16)
	print("public key")
	print(d)

n=(p-1)*(q-1)
e=B.invmod(d,n)
	print("private key")
	print(e)
	assert((d*e)%n==B.new(1))

n=p*q
	print("modulus")
	print(n)
	print""

message="The quick brown fox jumps over the lazy dog"
	print("message as text")
	print(message)

m=B.text(header..message)
	print("encoded message in decimal")
	print(m)
	print("encoded message in hex")
	print(B2hex(m))
	assert(m<n)
	assert(message==B2text(m))

x=B.powmod(m,e,n)
	print("encrypted message in decimal")
	print(x)
	print("encrypted message in hex")
	print(B2hex(x))

y=B.powmod(x,d,n)
	print("decrypted message in decimal")
	print(y)
	print("decrypted message in hex")
	print(B2hex(y))
	assert(y==m)

y=B2text(y)
	print("decoded message as text")
	print(y)
	assert(y==message)

------------------------------------------------------------------------------
print""
print(B.version)
