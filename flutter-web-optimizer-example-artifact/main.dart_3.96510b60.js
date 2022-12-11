:87}
A.Mq.prototype={
$1(a){return a+1},
$S:87}
A.a0h.prototype={
$1(a){return B.c.B(a,"StackTrace.current")||B.c.B(a,"dart-sdk/lib/_internal")||B.c.B(a,"dart:sdk_internal")},
$S:45}
A.CC.prototype={}
A.CE.prototype={}
A.CD.prototype={}
A.uT.prototype={
GA(){var s,r,q,p,o,n,m,l,k=this,j=null
A.a2j("Framework initialization",j,j)
k.Gp()
$.b1=k
s=t.h
r=A.cW(s)
q=A.b([],t.pX)
p=t.S
o=A.ib(j,j,t.tP,p)
n=A.a1x(!0,"Root Focus Scope",!1)
m=A.b([],t.e6)
l=$.bN()
o=n.w=new A.or(new A.ou(o,t.b4),n,A.bb(t.c),m,l)
n=$.hf.bM$
n===$&&A.f()
n.a=o.gJR()
$.dQ.k4$.b.l(0,o.gIN(),j)
s=new A.IG(new A.CY(r),q,o,A.y(t.uY,s))
k.a0$=s
s.a=k.gJm()
$.as().dy=k.gQi()
B.cY.jR(k.gJW())
s=new A.vD(A.y(p,t.lv),B.pJ)
B.pJ.jR(s.gLg())
k.az$=s
k.fC()
s=t.N
A.ai4("Flutter.FrameworkInitialization",A.y(s,s))
A.a2i()},
dC(){},
fC(){},
RK(a){var s,r=new A.AD(null,0,A.b([],t.vS))
r.ma(0,"Lock events");++this.b
s=a.$0()
s.iq(new A.Iv(this,r))
return s},
uK(){},
k(a){return"<BindingBase>"}}
A.Iv.prototype={
$0(){var s=this.a
if(--s.b<=0){this.b.nJ(0)
s.Gh()
if(s.x$.c!==0)s.xb()}},
$S:8}
A.ah.prototype={}
A.eh.prototype={
Y(a,b){var s,r,q,p,o=this
if(o.gbp(o)===o.gb_().length){s=t.xR
if(o.gbp(o)===0)o.sb_(A.aQ(1,null,!1,s))
else{r=A.aQ(o.gb_().length*2,null,!1,s)
for(q=0;q<o.gbp(o);++q)r[q]=o.gb_()[q]
o.sb_(r)}}s=o.gb_()
p=o.gbp(o)
o.sbp(0,p+1)
s[p]=b},
mO(a){var s,r,q,p=this
p.sbp(0,p.gbp(p)-1)
if(p.gbp(p)*2<=p.gb_().length){s=A.aQ(p.gbp(p),null,!1,t.xR)
for(r=0;r<a;++r)s[r]=p.gb_()[r]
for(r=a;r<p.gbp(p);r=q){q=r+1
s[r]=p.gb_()[q]}p.sb_(s)}else{for(r=a;r<p.gbp(p);r=q){q=r+1
p.gb_()[r]=p.gb_()[q]}p.gb_()[p.gbp(p)]=null}},
I(a,b){var s,r=this
for(s=0;s<r.gbp(r);++s)if(J.e(r.gb_()[s],b)){if(r.gdr()>0){r.gb_()[s]=null
r.sdL(r.gdL()+1)}else r.mO(s)
break}},
m(){this.sb_($.bN())
this.sbp(0,0)},
bf(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this
if(e.gbp(e)===0)return
e.sdr(e.gdr()+1)
p=e.gbp(e)
for(s=0;s<p;++s)try{o=e.gb_()[s]
if(o!=null)o.$0()}catch(n){r=A.ac(n)
q=A.ar(n)
m=e instanceof A.bx?A.cx(e):null
o=A.ba("while dispatching notifications for "+A.aW(m==null?A.aA(e):m).k(0))
l=$.ed()
if(l!=null)l.$1(new A.bm(r,q,"foundation library",o,new A.IV(e),!1))}e.sdr(e.gdr()-1)
if(e.gdr()===0&&e.gdL()>0){k=e.gbp(e)-e.gdL()
if(k*2<=e.gb_().length){j=A.aQ(k,null,!1,t.xR)
for(i=0,s=0;s<e.gbp(e);++s){h=e.gb_()[s]
if(h!=null){g=i+1
j[i]=h
i=g}}e.sb_(j)}else for(s=0;s<k;++s)if(e.gb_()[s]==null){f=s+1
for(;e.gb_()[f]==null;)++f
e.gb_()[s]=e.gb_()[f]
e.gb_()[f]=null}e.sdL(0)
e.sbp(0,k)}},
$iah:1,
gbp(a){return this.y1$},
gb_(){return this.y2$},
gdr(){return this.af$},
gdL(){return this.ah$},
sbp(a,b){return this.y1$=b},
sb_(a){return this.y2$=a},
sdr(a){return this.af$=a},
sdL(a){return this.ah$=a}}
A.IV.prototype={
$0(){var s=null,r=this.a
return A.b([A.hP("The "+A.x(r).k(0)+" sending notification was",r,!0,B.ai,s,!1,s,s,B.Y,s,!1,!0,!0,B.au,s,t.ig)],t.p)},
$S:11}
A.Du.prototype={
Y(a,b){var s,r,q
for(s=this.a,r=s.length,q=0;q<s.length;s.length===r||(0,A.P)(s),++q)s[q].Y(0,b)},
I(a,b){var s,r,q
for(s=this.a,r=s.length,q=0;q<s.length;s.length===r||(0,A.P)(s),++q)s[q].I(0,b)},
k(a){return"Listenable.merge(["+B.b.bb(this.a,", ")+"])"}}
A.kk.prototype={
w3(a){this.a3$=!0},
sp(a,b){var s=this.a
if(s==null?b==null:s===b)return
this.a=b
this.bf()},
k(a){return"<optimized out>#"+A.bW(this)+"("+A.h(this.a)+")"}}
A.nY.prototype={
E(){return"DiagnosticLevel."+this.b}}
A.fZ.prototype={
E(){return"DiagnosticsTreeStyle."+this.b}}
A.YM.prototype={}
A.cU.prototype={
uH(a,b){return this.aZ(0)},
k(a){return this.uH(a,B.Y)}}
A.ek.prototype={
gp(a){this.Ld()
return this.at},
Ld(){return}}
A.nZ.prototype={}
A.vK.prototype={}
A.V.prototype={
bs(){return"<optimized out>#"+A.bW(this)},
uH(a,b){var s=this.bs()
return s},
k(a){return this.uH(a,B.Y)}}
A.JA.prototype={
bs(){return"<optimized out>#"+A.bW(this)}}
A.f4.prototype={
k(a){return this.CG(B.kd).aZ(0)},
bs(){return"<optimized out>#"+A.bW(this)},
Td(a,b){return A.a1o(a,b,this)},
CG(a){return this.Td(null,a)}}
A.Cc.prototype={}
A.fg.prototype={}
A.xr.prototype={}
A.r1.prototype={
k(a){return"[#"+A.bW(this)+"]"}}
A.r3.prototype={
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return this.$ti.b(b)&&b.a===this.a},
gt(a){return A.J(A.x(this),this.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this.$ti,r=s.c,q=this.a,p=A.aW(r)===B.tb?"<'"+q.k(0)+"'>":"<"+q.k(0)+">"
if(A.x(this)===A.aW(s))return"["+p+"]"
return"["+A.aW(r).k(0)+" "+p+"]"}}
A.a2B.prototype={}
A.dS.prototype={}
A.oT.prototype={}
A.F.prototype={
us(a){var s=a.a,r=this.a
if(s<=r){a.a=r+1
a.jz()}},
jz(){},
gaW(){return this.b},
aw(a){this.b=a},
ab(a){this.b=null},
gar(a){return this.c},
hO(a){var s
a.c=this
s=this.b
if(s!=null)a.aw(s)
this.us(a)},
j5(a){a.c=null
if(this.b!=null)a.ab(0)}}
A.b3.prototype={
gmK(){var s,r=this,q=r.c
if(q===$){s=A.cW(r.$ti.c)
r.c!==$&&A.b2()
r.c=s
q=s}return q},
A(a,b){this.b=!0
this.gmK().M(0)
return B.b.A(this.a,b)},
M(a){this.b=!1
B.b.M(this.a)
this.gmK().M(0)},
B(a,b){var s=this,r=s.a
if(r.length<3)return B.b.B(r,b)
if(s.b){s.gmK().H(0,r)
s.b=!1}return s.gmK().B(0,b)},
gO(a){var s=this.a
return new J.eW(s,s.length)},
gK(a){return this.a.length===0},
gbo(a){return this.a.length!==0},
bN(a,b){var s=this.a,r=A.ab(s)
return b?A.b(s.slice(0),r):J.lr(s.slice(0),r.c)},
cY(a){return this.bN(a,!0)}}
A.ou.prototype={
F(a,b){var s=this.a,r=s.i(0,b)
s.l(0,b,(r==null?0:r)+1)},
A(a,b){var s=this.a,r=s.i(0,b)
if(r==null)return!1
if(r===1)s.A(0,b)
else s.l(0,b,r-1)
return!0},
B(a,b){return this.a.X(0,b)},
gO(a){var s=this.a
return A.ia(s,s.r)},
gK(a){return this.a.a===0},
gbo(a){return this.a.a!==0}}
A.pI.prototype={
Sy(a,b,c){var s=this.a,r=s==null?$.uy():s,q=r.fb(0,0,b,A.eB(b),c)
if(q===s)return this
return new A.pI(q)},
i(a,b){var s=this.a
if(s==null)return null
return s.jJ(0,0,b,J.k(b))}}
A.ZU.prototype={}
A.CM.prototype={
fb(a,b,c,d,e){var s,r,q,p,o=B.f.ku(d,b)&31,n=this.a,m=n[o]
if(m==null)m=$.uy()
s=m.fb(0,b+5,c,d,e)
if(s===m)n=this
else{r=n.length
q=A.aQ(r,null,!1,t.X)
for(p=0;p<r;++p)q[p]=n[p]
q[o]=s
n=new A.CM(q)}return n},
jJ(a,b,c,d){var s=this.a[B.f.vq(d,b)&31]
return s==null?null:s.jJ(0,b+5,c,d)}}
A.iC.prototype={
fb(a4,a5,a6,a7,a8){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c=this,b=null,a=B.f.ku(a7,a5)&31,a0=1<<a>>>0,a1=c.a,a2=(a1&a0-1)>>>0,a3=a2-(a2>>>1&1431655765)
a3=(a3&858993459)+(a3>>>2&858993459)
a3=a3+(a3>>>4)&252645135
a3+=a3>>>8
s=a3+(a3>>>16)&63
if((a1&a0)>>>0!==0){a=c.b
a2=2*s
r=a[a2]
q=a2+1
p=a[q]
if(r==null){o=J.a9W(p,a5+5,a6,a7,a8)
if(o===p)return c
a2=a.length
n=A.aQ(a2,b,!1,t.X)
for(m=0;m<a2;++m)n[m]=a[m]
n[q]=o
return new A.iC(a1,n)}if(J.e(a6,r)){if(a8==null?p==null:a8===p)a=c
else{a2=a.length
n=A.aQ(a2,b,!1,t.X)
for(m=0;m<a2;++m)n[m]=a[m]
n[q]=a8
a=new A.iC(a1,n)}return a}l=a5+5
k=J.k(r)
if(k===a7){j=A.aQ(4,b,!1,t.X)
j[0]=r
j[1]=p
j[2]=a6
j[3]=a8
o=new A.rz(a7,j)}else o=$.uy().fb(0,l,r,k,p).fb(0,l,a6,a7,a8)
l=a.length
n=A.aQ(l,b,!1,t.X)
for(m=0;m<l;++m)n[m]=a[m]
n[a2]=null
n[q]=o
return new A.iC(a1,n)}else{a3=a1-(a1>>>1&1431655765)
a3=(a3&858993459)+(a3>>>2&858993459)
a3=a3+(a3>>>4)&252645135
a3+=a3>>>8
i=a3+(a3>>>16)&63
if(i>=16){a1=c.KI(a5)
a1.a[a]=$.uy().fb(0,a5+5,a6,a7,a8)
return a1}else{h=2*s
g=2*i
f=A.aQ(g+2,b,!1,t.X)
for(a=c.b,e=0;e<h;++e)f[e]=a[e]
f[h]=a6
f[h+1]=a8
for(d=h+2,e=h;e<g;++e,++d)f[d]=a[e]
return new A.iC((a1|a0)>>>0,f)}}},
jJ(a,b,c,d){var s,r,q,p,o=1<<(B.f.vq(d,b)&31)>>>0,n=this.a
if((n&o)>>>0===0)return null
n=(n&o-1)>>>0
s=n-(n>>>1&1431655765)
s=(s&858993459)+(s>>>2&858993459)
s=s+(s>>>4)&252645135
s+=s>>>8
n=this.b
r=2*(s+(s>>>16)&63)
q=n[r]
p=n[r+1]
if(q==null)return p.jJ(0,b+5,c,d)
if(J.e(c,q))return p
return null},
KI(a){var s,r,q,p,o,n,m,l=A.aQ(32,null,!1,t.X)
for(s=this.a,r=a+5,q=this.b,p=0,o=0;o<32;++o)if((B.f.ku(s,o)&1)!==0){n=q[p]
m=p+1
if(n==null)l[o]=q[m]
else l[o]=$.uy().fb(0,r,n,J.k(n),q[m])
p+=2}return new A.CM(l)}}
A.rz.prototype={
fb(a,b,c,d,e){var s,r,q,p,o,n,m,l,k,j=this,i=j.a
if(d===i){s=j.xF(c)
if(s!==-1){i=j.b
r=s+1
q=i[r]
if(q==null?e==null:q===e)i=j
else{q=i.length
p=A.aQ(q,null,!1,t.X)
for(o=0;o<q;++o)p[o]=i[o]
p[r]=e
i=new A.rz(d,p)}return i}i=j.b
n=i.length
m=A.aQ(n+2,null,!1,t.X)
for(l=0;l<n;++l)m[l]=i[l]
m[n]=c
m[n+1]=e
return new A.rz(d,m)}i=B.f.ku(i,b)
k=A.aQ(2,null,!1,t.X)
k[1]=j
return new A.iC(1<<(i&31)>>>0,k).fb(0,b,c,d,e)},
jJ(a,b,c,d){var s=this.xF(c)
return s<0?null:this.b[s+1]},
xF(a){var s,r,q=this.b,p=q.length
for(s=J.fP(a),r=0;r<p;r+=2)if(s.j(a,q[r]))return r
return-1}}
A.cO.prototype={
E(){return"TargetPlatform."+this.b}}
A.W0.prototype={
ck(a,b){var s,r,q=this
if(q.b===q.a.length)q.Mn()
s=q.a
r=q.b
s[r]=b
q.b=r+1},
hK(a){var s=this,r=a.length,q=s.b+r
if(q>=s.a.length)s.r_(q)
B.H.cN(s.a,s.b,q,a)
s.b+=r},
k8(a,b,c){var s=this,r=c==null?s.e.length:c,q=s.b+(r-b)
if(q>=s.a.length)s.r_(q)
B.H.cN(s.a,s.b,q,a)
s.b=q},
GS(a){return this.k8(a,0,null)},
r_(a){var s=this.a,r=s.length,q=a==null?0:a,p=Math.max(q,r*2),o=new Uint8Array(p)
B.H.cN(o,0,r,s)
this.a=o},
Mn(){return this.r_(null)},
eB(a){var s=B.f.e3(this.b,a)
if(s!==0)this.k8($.a8K(),0,a-s)},
h7(){var s,r=this
if(r.c)throw A.d(A.Y("done() must not be called more than once on the same "+A.x(r).k(0)+"."))
s=A.ij(r.a.buffer,0,r.b)
r.a=new Uint8Array(0)
r.c=!0
return s}}
A.pW.prototype={
is(a){return this.a.getUint8(this.b++)},
oQ(a){var s=this.b,r=$.ce()
B.cW.v_(this.a,s,r)},
it(a){var s=this.a,r=A.cs(s.buffer,s.byteOffset+this.b,a)
this.b+=a
return r},
oR(a){var s
this.eB(8)
s=this.a
B.pF.A_(s.buffer,s.byteOffset+this.b,a)},
eB(a){var s=this.b,r=B.f.e3(s,a)
if(r!==0)this.b=s+(a-r)}}
A.eH.prototype={
gt(a){var s=this
return A.J(s.b,s.d,s.f,s.r,s.w,s.x,s.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.eH&&b.b===s.b&&b.d===s.d&&b.f===s.f&&b.r===s.r&&b.w===s.w&&b.x===s.x&&b.a===s.a},
k(a){var s=this
return"StackFrame(#"+s.b+", "+s.c+":"+s.d+"/"+s.e+":"+s.f+":"+s.r+", className: "+s.w+", method: "+s.x+")"}}
A.Uq.prototype={
$1(a){return a.length!==0},
$S:45}
A.bp.prototype={
iZ(a,b){return new A.a8($.a_,this.$ti.h("a8<1>"))},
h4(a){return this.iZ(a,null)},
dD(a,b,c){var s=a.$1(this.a)
if(c.h("a1<0>").b(s))return s
return new A.bp(s,c.h("bp<0>"))},
aU(a,b){return this.dD(a,null,b)},
iq(a){var s,r,q,p,o,n=this
try{s=a.$0()
if(t.o0.b(s)){p=s.aU(new A.UO(n),n.$ti.c)
return p}return n}catch(o){r=A.ac(o)
q=A.ar(o)
p=A.a1A(r,q,n.$ti.c)
return p}},
$ia1:1}
A.UO.prototype={
$1(a){return this.a.a},
$S(){return this.a.$ti.h("1(@)")}}
A.wU.prototype={
E(){return"GestureDisposition."+this.b}}
A.cr.prototype={}
A.wS.prototype={}
A.mB.prototype={
k(a){var s=this,r=s.a
r=r.length===0?""+"<empty>":""+new A.aJ(r,new A.XL(s),A.ab(r).h("aJ<1,u>")).bb(0,", ")
if(s.b)r+=" [open]"
if(s.c)r+=" [held]"
if(s.d)r+=" [hasPendingSweep]"
return r.charCodeAt(0)==0?r:r}}
A.XL.prototype={
$1(a){if(a===this.a.e)return a.k(0)+" (eager winner)"
return a.k(0)},
$S:119}
A.MH.prototype={
zN(a,b,c){this.a.bh(0,b,new A.MJ(this,b)).a.push(c)
return new A.wS(this,b,c)},
Op(a,b){var s=this.a.i(0,b)
if(s==null)return
s.b=!1
this.zh(b,s)},
w1(a){var s,r=this.a,q=r.i(0,a)
if(q==null)return
if(q.c){q.d=!0
return}r.A(0,a)
r=q.a
if(r.length!==0){B.b.gG(r).eF(a)
for(s=1;s<r.length;++s)r[s].fI(a)}},
QX(a){var s=this.a.i(0,a)
if(s==null)return
s.c=!0},
SJ(a,b){var s=this.a.i(0,b)
if(s==null)return
s.c=!1
if(s.d)this.w1(b)},
kt(a,b,c){var s=this.a.i(0,a)
if(s==null)return
if(c===B.M){B.b.A(s.a,b)
b.fI(a)
if(!s.b)this.zh(a,s)}else if(s.b){if(s.e==null)s.e=b}else this.yz(a,s,b)},
zh(a,b){var s=b.a.length
if(s===1)A.iW(new A.MI(this,a,b))
else if(s===0)this.a.A(0,a)
else{s=b.e
if(s!=null)this.yz(a,b,s)}},
Mr(a,b){var s=this.a
if(!s.X(0,a))return
s.A(0,a)
B.b.gG(b.a).eF(a)},
yz(a,b,c){var s,r,q,p
this.a.A(0,a)
for(s=b.a,r=s.length,q=0;q<s.length;s.length===r||(0,A.P)(s),++q){p=s[q]
if(p!==c)p.fI(a)}c.eF(a)}}
A.MJ.prototype={
$0(){return new A.mB(A.b([],t.ia))},
$S:120}
A.MI.prototype={
$0(){return this.a.Mr(this.b,this.c)},
$S:0}
A.Za.prototype={
hF(a){var s,r,q,p,o,n=this
for(s=n.a,r=s.gaF(s),r=new A.dw(J.an(r.a),r.b),q=n.r,p=A.t(r).z[1];r.q();){o=r.a;(o==null?p.a(o):o).TL(0,q)}s.M(0)
n.c=B.x
s=n.y
if(s!=null)s.b4(0)}}
A.le.prototype={
K4(a){var s=a.a,r=$.cz().w
if(r==null){r=self.window.devicePixelRatio
if(r===0)r=1}this.k3$.H(0,A.acQ(s,r))
if(this.b<=0)this.qi()},
Oc(a){var s=this.k3$
if(s.b===s.c&&this.b<=0)A.iW(this.gIL())
s.NK(A.a5a(0,0,0,0,0,B.d1,!1,0,a,B.h,1,1,0,0,0,0,0,0,B.x))},
qi(){for(var s=this.k3$;!s.gK(s);)this.Qt(s.lO())},
Qt(a){this.gyw().hF(0)
this.xy(a)},
xy(a){var s,r,q,p=this,o=!t.Y.b(a)
if(!o||t.zs.b(a)||t.hV.b(a)||t.EL.b(a)){s=A.a4t()
r=a.gaX(a)
q=p.ry$
q===$&&A.f()
q.e.bj(s,r)
p.Ey(s,r)
if(!o||t.EL.b(a))p.p2$.l(0,a.gbg(),s)
o=s}else if(t.E.b(a)||t.v.b(a)||t.zv.b(a)){s=p.p2$.A(0,a.gbg())
o=s}else o=a.gnA()||t._.b(a)?p.p2$.i(0,a.gbg()):null
if(o!=null||t.ye.b(a)||t.yg.b(a))p.t2(0,a,o)},
QU(a,b){a.F(0,new A.h3(this,t.Cq))},
t2(a,b,c){var s,r,q,p,o,n,m,l,k,j,i="gesture library"
if(c==null){try{this.k4$.CD(b)}catch(p){s=A.ac(p)
r=A.ar(p)
A.dd(A.abC(A.ba("while dispatching a non-hit-tested pointer event"),b,s,null,new A.MK(b),i,r))}return}for(n=c.a,m=n.length,l=0;l<n.length;n.length===m||(0,A.P)(n),++l){q=n[l]
try{q.a.hp(b.a8(q.b),q)}catch(s){p=A.ac(s)
o=A.ar(s)
k=A.ba("while dispatching a pointer event")
j=$.ed()
if(j!=null)j.$1(new A.oq(p,o,i,k,new A.ML(b,q),!1))}}},
hp(a,b){var s=this
s.k4$.CD(a)
if(t.Y.b(a)||t.EL.b(a))s.ok$.Op(0,a.gbg())
else if(t.E.b(a)||t.zv.b(a))s.ok$.w1(a.gbg())
else if(t.zs.b(a))s.p1$.T(a)},
Kk(){if(this.b<=0)this.gyw().hF(0)},
gyw(){var s=this,r=s.p3$
if(r===$){$.HG()
r!==$&&A.b2()
r=s.p3$=new A.Za(A.y(t.S,t.d0),B.x,new A.qF(),B.x,B.x,s.gK8(),s.gKj(),B.w5)}return r},
$iae:1}
A.MK.prototype={
$0(){var s=null
return A.b([A.hP("Event",this.a,!0,B.ai,s,!1,s,s,B.Y,s,!1,!0,!0,B.au,s,t.cL)],t.p)},
$S:11}
A.ML.prototype={
$0(){var s=null
return A.b([A.hP("Event",this.a,!0,B.ai,s,!1,s,s,B.Y,s,!1,!0,!0,B.au,s,t.cL),A.hP("Target",this.b.a,!0,B.ai,s,!1,s,s,B.Y,s,!1,!0,!0,B.au,s,t.kZ)],t.p)},
$S:11}
A.oq.prototype={}
A.Q3.prototype={
$1(a){return a.e!==B.B4},
$S:124}
A.Q4.prototype={
$1(a2){var s,r,q,p,o,n,m,l,k,j,i,h=this.a,g=new A.z(a2.w,a2.x).cf(0,h),f=new A.z(a2.y,a2.z).cf(0,h),e=a2.dx/h,d=a2.db/h,c=a2.dy/h,b=a2.fr/h,a=a2.b,a0=a2.d,a1=a2.e
switch((a1==null?B.bh:a1).a){case 0:switch(a2.c.a){case 1:h=a2.f
a1=a2.ay
s=a2.ch
return A.acN(h,a2.CW,a2.cx,0,a0,!1,a2.fx,g,s,a1,b,c,a2.fy,a)
case 3:h=a2.f
a1=a2.Q
s=a2.ay
r=a2.ch
q=a2.CW
p=a2.cx
o=a2.cy
n=a2.fx
m=a2.fy
return A.acS(a1,f,h,q,p,0,a0,!1,n,g,r,s,d,b,c,e,o,a2.at,m,a)
case 4:h=a2.r
a1=a2.f
s=A.a7a(a2.Q,a0)
r=a2.ax
q=a2.ay
p=a2.ch
o=a2.cx
n=a2.cy
return A.acO(s,a1,o,0,a0,!1,a2.fx,h,g,r,p,q,d,b,c,e,n,a2.fy,a)
case 5:h=a2.r
a1=a2.f
s=A.a7a(a2.Q,a0)
r=a2.ax
q=a2.ay
p=a2.ch
o=a2.cx
n=a2.cy
m=a2.fx
l=a2.fy
return A.acT(s,f,a1,o,0,a0,!1,m,a2.go,h,g,r,p,q,d,b,c,e,n,a2.at,l,a)
case 6:h=a2.r
a1=a2.f
s=a2.Q
r=a2.ax
q=a2.ay
p=a2.ch
o=a2.CW
n=a2.cx
m=a2.cy
return A.ad0(s,a1,o,n,0,a0,!1,a2.fx,h,g,r,p,q,d,b,c,e,m,a2.fy,a)
case 0:h=a2.r
a1=a2.f
s=a2.Q
r=a2.ay
q=a2.ch
p=a2.CW
o=a2.cx
n=a2.cy
return A.a5a(s,a1,p,o,0,a0,!1,a2.fx,h,g,q,r,d,b,c,e,n,a2.fy,a)
case 2:h=a2.f
a1=a2.ay
s=a2.ch
return A.acX(h,a2.cx,0,a0,!1,g,s,a1,b,c,a)
case 7:h=a2.r
return A.acV(a2.f,0,h,g,a2.at,a)
case 8:k=new A.z(0,0).cf(0,h)
j=new A.z(0,0).cf(0,h)
h=a2.r
return A.acW(a2.f,0,k,j,h,g,0,0,a2.at,a)
case 9:h=a2.r
return A.acU(a2.f,0,h,g,a2.at,a)}break
case 1:i=new A.z(a2.id,a2.k1).cf(0,h)
return A.acZ(a2.f,0,a0,g,i,a)
case 2:return A.ad_(a2.f,0,a0,g,a)
case 3:return A.acY(a2.f,0,a0,g,0,a)
case 4:throw A.d(A.Y("Unreachable"))}},
$S:125}
A.je.prototype={
k(a){return"DragDownDetails("+this.a.k(0)+")"}}
A.h_.prototype={
k(a){return"DragStartDetails("+this.b.k(0)+")"}}
A.h0.prototype={
k(a){return"DragUpdateDetails("+this.b.k(0)+")"}}
A.f7.prototype={
k(a){return"DragEndDetails("+this.a.k(0)+")"}}
A.av.prototype={
gcm(){return this.f},
gBJ(){return this.r},
geu(a){return this.b},
gbg(){return this.c},
gcT(a){return this.d},
gft(a){return this.e},
gaX(a){return this.f},
gkW(){return this.r},
gbQ(a){return this.w},
gnA(){return this.x},
glG(){return this.y},
gC9(a){return this.z},
gos(){return this.Q},
glL(){return this.as},
gbR(){return this.at},
gt4(){return this.ax},
giy(a){return this.ay},
gum(){return this.ch},
guq(){return this.CW},
guo(){return this.cx},
gun(){return this.cy},
guc(a){return this.db},
guE(){return this.dx},
gk6(){return this.fr},
gaQ(a){return this.fx}}
A.cb.prototype={$iav:1}
A.B3.prototype={$iav:1}
A.Ge.prototype={
geu(a){return this.gaD().b},
gbg(){return this.gaD().c},
gcT(a){return this.gaD().d},
gft(a){return this.gaD().e},
gaX(a){return this.gaD().f},
gkW(){return this.gaD().r},
gbQ(a){return this.gaD().w},
gnA(){return this.gaD().x},
glG(){this.gaD()
return!1},
gC9(a){return this.gaD().z},
gos(){return this.gaD().Q},
glL(){return this.gaD().as},
gbR(){return this.gaD().at},
gt4(){return this.gaD().ax},
giy(a){return this.gaD().ay},
gum(){return this.gaD().ch},
guq(){return this.gaD().CW},
guo(){return this.gaD().cx},
gun(){return this.gaD().cy},
guc(a){return this.gaD().db},
guE(){return this.gaD().dx},
gk6(){return this.gaD().fr},
gcm(){var s,r=this,q=r.a
if(q===$){s=A.Q6(r.gaQ(r),r.gaD().f)
r.a!==$&&A.b2()
r.a=s
q=s}return q},
gBJ(){var s,r,q,p,o=this,n=o.b
if(n===$){s=o.gaQ(o)
r=o.gaD()
q=o.gaD()
p=A.Q5(s,o.gcm(),r.r,q.f)
o.b!==$&&A.b2()
o.b=p
n=p}return n}}
A.BG.prototype={}
A.jN.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Ga(this,a)}}
A.Ga.prototype={
a8(a){return this.c.a8(a)},
$ijN:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BQ.prototype={}
A.jT.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gl(this,a)}}
A.Gl.prototype={
a8(a){return this.c.a8(a)},
$ijT:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BL.prototype={}
A.jP.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gg(this,a)}}
A.Gg.prototype={
a8(a){return this.c.a8(a)},
$ijP:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BJ.prototype={}
A.ir.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gd(this,a)}}
A.Gd.prototype={
a8(a){return this.c.a8(a)},
$iir:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BK.prototype={}
A.is.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gf(this,a)}}
A.Gf.prototype={
a8(a){return this.c.a8(a)},
$iis:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BI.prototype={}
A.hb.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gc(this,a)}}
A.Gc.prototype={
a8(a){return this.c.a8(a)},
$ihb:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BM.prototype={}
A.jQ.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gh(this,a)}}
A.Gh.prototype={
a8(a){return this.c.a8(a)},
$ijQ:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BU.prototype={}
A.jU.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gp(this,a)}}
A.Gp.prototype={
a8(a){return this.c.a8(a)},
$ijU:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.di.prototype={}
A.BS.prototype={}
A.yI.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gn(this,a)}}
A.Gn.prototype={
a8(a){return this.c.a8(a)},
$idi:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BT.prototype={}
A.yJ.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Go(this,a)}}
A.Go.prototype={
a8(a){return this.c.a8(a)},
$idi:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BR.prototype={}
A.yH.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gm(this,a)}}
A.Gm.prototype={
a8(a){return this.c.a8(a)},
$idi:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BO.prototype={}
A.hc.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gj(this,a)}}
A.Gj.prototype={
a8(a){return this.c.a8(a)},
$ihc:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BP.prototype={}
A.jS.prototype={
gtH(){return this.go},
gBK(){return this.id},
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gk(this,a)},
gui(a){return this.go},
gC1(){return this.id}}
A.Gk.prototype={
gui(a){return this.e.go},
gtH(){var s,r=this,q=r.c
if(q===$){s=A.Q6(r.f,r.e.go)
r.c!==$&&A.b2()
r.c=s
q=s}return q},
gC1(){return this.e.id},
gBK(){var s,r,q=this,p=q.d
if(p===$){s=q.e
r=A.Q5(q.f,q.gtH(),s.id,s.go)
q.d!==$&&A.b2()
q.d=r
p=r}return p},
a8(a){return this.e.a8(a)},
$ijS:1,
gaD(){return this.e},
gaQ(a){return this.f}}
A.BN.prototype={}
A.jR.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gi(this,a)}}
A.Gi.prototype={
a8(a){return this.c.a8(a)},
$ijR:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.BH.prototype={}
A.jO.prototype={
a8(a){if(a==null||a.j(0,this.fx))return this
return new A.Gb(this,a)}}
A.Gb.prototype={
a8(a){return this.c.a8(a)},
$ijO:1,
gaD(){return this.c},
gaQ(a){return this.d}}
A.E5.prototype={}
A.E6.prototype={}
A.E7.prototype={}
A.E8.prototype={}
A.E9.prototype={}
A.Ea.prototype={}
A.Eb.prototype={}
A.Ec.prototype={}
A.Ed.prototype={}
A.Ee.prototype={}
A.Ef.prototype={}
A.Eg.prototype={}
A.Eh.prototype={}
A.Ei.prototype={}
A.Ej.prototype={}
A.Ek.prototype={}
A.El.prototype={}
A.Em.prototype={}
A.En.prototype={}
A.Eo.prototype={}
A.Ep.prototype={}
A.Eq.prototype={}
A.Er.prototype={}
A.Es.prototype={}
A.Et.prototype={}
A.Eu.prototype={}
A.Ev.prototype={}
A.Ew.prototype={}
A.Ex.prototype={}
A.Ey.prototype={}
A.Ez.prototype={}
A.H4.prototype={}
A.H5.prototype={}
A.H6.prototype={}
A.H7.prototype={}
A.H8.prototype={}
A.H9.prototype={}
A.Ha.prototype={}
A.Hb.prototype={}
A.Hc.prototype={}
A.Hd.prototype={}
A.He.prototype={}
A.Hf.prototype={}
A.Hg.prototype={}
A.Hh.prototype={}
A.Hi.prototype={}
A.Hj.prototype={}
A.Hk.prototype={}
A.my.prototype={
E(){return"_ForceState."+this.b}}
A.eo.prototype={
eG(a){var s=this
if(a.glL()<=1)s.T(B.M)
else{s.pp(a)
if(s.db===B.j0){s.db=B.dp
s.cx=new A.dX(a.gcm(),a.gaX(a))}}},
ho(a){var s,r=this
if(t.U.b(a)||t.Y.b(a)){s=A.a4q(a.gos(),a.glL(),a.gC9(a))
r.cx=new A.dX(a.gcm(),a.gaX(a))
r.cy=s
if(r.db===B.dp)if(s>0.4){r.db=B.to
r.T(B.aG)}else if(a.gkW().gnz()>A.uq(a.gcT(a),r.b))r.T(B.M)
if(s>0.4&&r.db===B.tn)r.db=B.to}r.vy(a)},
eF(a){if(this.db===B.dp)this.db=B.tn},
nw(a){if(this.db===B.dp){this.T(B.M)
return}this.db=B.j0},
fI(a){this.ey(a)
this.nw(a)}}
A.vJ.prototype={
gt(a){return A.J(this.a,23,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.vJ&&b.a==this.a},
k(a){return"DeviceGestureSettings(touchSlop: "+A.h(this.a)+")"}}
A.h3.prototype={
k(a){return"<optimized out>#"+A.bW(this)+"("+this.a.k(0)+")"}}
A.mW.prototype={}
A.Dp.prototype={
ce(a,b){return this.a.tQ(b)}}
A.DT.prototype={
ce(a,b){var s,r,q,p,o=new Float64Array(16),n=new A.aT(o)
n.aE(b)
s=this.a
r=s.a
q=s.b
s=o[0]
p=o[3]
o[0]=s+r*p
o[1]=o[1]+q*p
o[2]=o[2]+0*p
o[3]=p
p=o[4]
s=o[7]
o[4]=p+r*s
o[5]=o[5]+q*s
o[6]=o[6]+0*s
o[7]=s
s=o[8]
p=o[11]
o[8]=s+r*p
o[9]=o[9]+q*p
o[10]=o[10]+0*p
o[11]=p
p=o[12]
s=o[15]
o[12]=p+r*s
o[13]=o[13]+q*s
o[14]=o[14]+0*s
o[15]=s
return n}}
A.fb.prototype={
J9(){var s,r,q,p,o=this.c
if(o.length===0)return
s=this.b
r=B.b.gJ(s)
for(q=o.length,p=0;p<o.length;o.length===q||(0,A.P)(o),++p){r=o[p].ce(0,r)
s.push(r)}B.b.M(o)},
F(a,b){this.J9()
b.b=B.b.gJ(this.b)
this.a.push(b)},
C5(){var s=this.c
if(s.length!==0)s.pop()
else this.b.pop()},
k(a){var s=this.a
return"HitTestResult("+(s.length===0?"<empty path>":B.b.bb(s,", "))+")"}}
A.ew.prototype={
hu(a){var s
switch(a.gbQ(a)){case 1:if(this.k4==null)s=!0
else s=!1
if(s)return!1
break
case 2:s=!0
if(s)return!1
break
case 4:s=!0
if(s)return!1
break
default:return!1}return this.k0(a)},
t_(){var s,r=this
r.T(B.aG)
r.go=!0
s=r.ay
s.toString
r.vS(s)
r.HA()},
Bb(a){var s,r=this
if(!a.gk6()){if(t.Y.b(a)){s=new A.km(a.gcT(a),A.aQ(20,null,!1,t.pa))
r.a3=s
s.kE(a.geu(a),a.gcm())}if(t.U.b(a)){s=r.a3
s.toString
s.kE(a.geu(a),a.gcm())}}if(t.E.b(a)){if(r.go)r.Hy(a)
else r.T(B.M)
r.qZ()}else if(t.v.b(a)){r.wv()
r.qZ()}else if(t.Y.b(a)){r.id=new A.dX(a.gcm(),a.gaX(a))
r.k1=a.gbQ(a)
r.Hx(a)}else if(t.U.b(a))if(a.gbQ(a)!==r.k1){r.T(B.M)
s=r.ay
s.toString
r.ey(s)}else if(r.go)r.Hz(a)},
Hx(a){this.id.toString
this.d.i(0,a.gbg()).toString
switch(this.k1){case 1:break
case 2:break
case 4:break}},
wv(){if(this.ax===B.cu)switch(this.k1){case 1:break
case 2:break
case 4:break}},
HA(){switch(this.k1){case 1:var s=this.k4
if(s!=null)this.f2("onLongPress",s)
break
case 2:break
case 4:break}},
Hz(a){a.gaX(a)
a.gcm()
a.gaX(a).W(0,this.id.b)
a.gcm().W(0,this.id.a)
switch(this.k1){case 1:break
case 2:break
case 4:break}},
Hy(a){this.a3.v6()
a.gaX(a)
a.gcm()
this.a3=null
switch(this.k1){case 1:break
case 2:break
case 4:break}},
qZ(){var s=this
s.go=!1
s.a3=s.k1=s.id=null},
T(a){var s=this
if(a===B.M)if(s.go)s.qZ()
else s.wv()
s.vL(a)},
eF(a){}}
A.hv.prototype={
i(a,b){return this.c[b+this.a]},
V(a,b){var s,r,q,p,o,n,m
for(s=this.b,r=this.c,q=this.a,p=b.c,o=b.a,n=0,m=0;m<s;++m)n+=r[m+q]*p[m+o]
return n}}
A.a2x.prototype={}
A.Qc.prototype={}
A.xl.prototype={
vu(a6){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4=this.a,a5=a4.length
if(a6>a5)return null
s=a6+1
r=new A.Qc(new Float64Array(s))
q=s*a5
p=new Float64Array(q)
for(o=this.c,n=0*a5,m=0;m<a5;++m){p[n+m]=o[m]
for(l=1;l<s;++l)p[l*a5+m]=p[(l-1)*a5+m]*a4[m]}q=new Float64Array(q)
n=new Float64Array(s*s)
for(k=0;k<s;++k){for(j=k*a5,m=0;m<a5;++m){i=j+m
q[i]=p[i]}for(l=0;l<k;++l){i=l*a5
h=new A.hv(j,a5,q).V(0,new A.hv(i,a5,q))
for(m=0;m<a5;++m){g=j+m
q[g]=q[g]-h*q[i+m]}}i=new A.hv(j,a5,q)
f=Math.sqrt(i.V(0,i))
if(f<1e-10)return null
e=1/f
for(m=0;m<a5;++m){i=j+m
q[i]=q[i]*e}for(i=k*s,l=0;l<s;++l){g=l<k?0:new A.hv(j,a5,q).V(0,new A.hv(l*a5,a5,p))
n[i+l]=g}}p=new Float64Array(a5)
d=new A.hv(0,a5,p)
for(j=this.b,m=0;m<a5;++m)p[m]=j[m]*o[m]
for(l=s-1,p=r.a,c=l;c>=0;--c){p[c]=new A.hv(c*a5,a5,q).V(0,d)
for(i=c*s,k=l;k>c;--k)p[c]=p[c]-n[i+k]*p[k]
p[c]=p[c]/n[i+c]}for(b=0,m=0;m<a5;++m)b+=j[m]
b/=a5
for(a=0,a0=0,m=0;m<a5;++m){q=j[m]
a1=q-p[0]
for(a2=1,l=1;l<s;++l){a2*=a4[m]
a1-=a2*p[l]}n=o[m]
n*=n
a+=n*a1*a1
a3=q-b
a0+=n*a3*a3}r.b=a0<=1e-10?1:1-a/a0
return r}}
A.rs.prototype={
E(){return"_DragState."+this.b}}
A.o4.prototype={
hu(a){var s=this
if(s.fy==null)switch(a.gbQ(a)){case 1:if(s.as==null&&s.at==null&&s.ax==null&&s.ay==null&&s.ch==null)return!1
break
default:return!1}else if(a.gbQ(a)!==s.fy)return!1
return s.k0(a)},
wc(a){var s,r=this
r.k1.l(0,a.gbg(),A.a4e(a))
s=r.dx
if(s===B.aV){r.dx=B.HQ
s=a.gaX(a)
r.dy=new A.dX(a.gcm(),s)
r.fr=B.pG
r.id=0
r.fx=a.geu(a)
r.go=a.gaQ(a)
r.Hv()}else if(s===B.dn)r.T(B.aG)},
eG(a){var s=this
s.pp(a)
if(s.dx===B.aV)s.fy=a.gbQ(a)
s.wc(a)},
rs(a){var s=this
s.Ez(a)
s.mb(a.gbg(),a.gaQ(a))
if(s.dx===B.aV)s.fy=1
s.wc(a)},
ho(a){var s,r,q,p,o,n,m,l,k,j=this
if(!a.gk6())s=t.Y.b(a)||t.U.b(a)||t.EL.b(a)||t._.b(a)
else s=!1
if(s){s=j.k1.i(0,a.gbg())
s.toString
if(t.EL.b(a))s.kE(a.geu(a),B.h)
else if(t._.b(a))s.kE(a.geu(a),a.gui(a))
else s.kE(a.geu(a),a.gcm())}s=t.U.b(a)
if(s&&a.gbQ(a)!==j.fy){j.qr(a.gbg())
return}if(s||t._.b(a)){r=s?a.gkW():t._.a(a).gC1()
q=s?a.gBJ():t._.a(a).gBK()
if(s)p=a.gaX(a)
else{o=a.gaX(a)
t._.a(a)
p=o.U(0,a.gui(a))}n=s?a.gcm():a.gcm().U(0,t._.a(a).gtH())
if(j.dx===B.dn){s=a.geu(a)
j.wz(j.ki(q),p,n,j.iM(q),s)}else{s=j.fr
s===$&&A.f()
j.fr=s.U(0,new A.dX(q,r))
j.fx=a.geu(a)
j.go=a.gaQ(a)
m=j.ki(q)
if(a.gaQ(a)==null)l=null
else{s=a.gaQ(a)
s.toString
l=A.OI(s)}s=j.id
s===$&&A.f()
o=A.Q5(l,null,m,n).gbR()
k=j.iM(m)
j.id=s+o*J.kL(k==null?1:k)
s=a.gcT(a)
o=j.b
if(j.qC(s,o==null?null:o.a))j.T(B.aG)}}if(t.E.b(a)||t.v.b(a)||t.zv.b(a))j.qr(a.gbg())},
eF(a){var s,r,q,p,o,n,m,l,k=this
k.k2.F(0,a)
if(k.dx!==B.dn){k.dx=B.dn
s=k.fr
s===$&&A.f()
r=k.fx
r.toString
q=k.go
switch(k.Q.a){case 1:p=k.dy
p===$&&A.f()
k.dy=p.U(0,s)
o=B.h
break
case 0:o=k.ki(s.a)
break
default:o=null}k.fr=B.pG
k.go=k.fx=null
k.HB(r,a)
if(!J.e(o,B.h)&&k.ax!=null){n=q!=null?A.OI(q):null
s=k.dy
s===$&&A.f()
m=A.Q5(n,null,o,s.a.U(0,o))
l=k.dy.U(0,new A.dX(o,m))
k.wz(o,l.b,l.a,k.iM(o),r)}k.T(B.aG)}},
fI(a){this.qr(a)},
nw(a){var s,r=this
switch(r.dx.a){case 0:break
case 1:r.T(B.M)
s=r.ch
if(s!=null)r.f2("onCancel",s)
break
case 2:r.Hw(a)
break}r.k1.M(0)
r.fy=null
r.dx=B.aV},
qr(a){var s,r
this.ey(a)
if(!this.k2.A(0,a)){s=this.e
r=s.i(0,a)
if(r!=null){s.A(0,a)
r.a.kt(r.b,r.c,B.M)}}},
Hv(){var s,r=this
if(r.as!=null){s=r.dy
s===$&&A.f()
r.f2("onDown",new A.Lk(r,new A.je(s.b)))}},
HB(a,b){var s,r=this
if(r.at!=null){s=r.dy
s===$&&A.f()
r.d.i(0,b).toString
r.f2("onStart",new A.Lo(r,new A.h_(s.b)))}},
wz(a,b,c,d,e){if(this.ax!=null)this.f2("onUpdate",new A.Lp(this,new A.h0(a,d,b)))},
Hw(a){var s,r,q,p,o=this,n={}
if(o.ay==null)return
s=o.k1.i(0,a)
s.toString
n.a=null
r=s.v6()
if(r!=null&&o.tz(r,s.a)){s=r.a
q=new A.hn(s).Oj(50,8000)
o.iM(q.a)
n.a=new A.f7(q)
p=new A.Ll(r,q)}else{n.a=new A.f7(B.cg)
p=new A.Lm(r)}o.Rf("onEnd",new A.Ln(n,o),p)},
m(){this.k1.M(0)
this.pq()}}
A.Lk.prototype={
$0(){return this.a.as.$1(this.b)},
$S:0}
A.Lo.prototype={
$0(){return this.a.at.$1(this.b)},
$S:0}
A.Lp.prototype={
$0(){return this.a.ax.$1(this.b)},
$S:0}
A.Ll.prototype={
$0(){return this.a.k(0)+"; fling at "+this.b.k(0)+"."},
$S:31}
A.Lm.prototype={
$0(){var s=this.a
if(s==null)return"Could not estimate velocity."
return s.k(0)+"; judged to not be a fling."},
$S:31}
A.Ln.prototype={
$0(){return this.b.ay.$1(this.a.a)},
$S:0}
A.eN.prototype={
tz(a,b){var s=A.uq(b,this.b)
return Math.abs(a.a.b)>50&&Math.abs(a.d.b)>s},
qC(a,b){var s=this.id
s===$&&A.f()
return Math.abs(s)>A.uq(a,this.b)},
ki(a){return new A.z(0,a.b)},
iM(a){return a.b}}
A.ep.prototype={
tz(a,b){var s=A.uq(b,this.b)
return Math.abs(a.a.a)>50&&Math.abs(a.d.a)>s},
qC(a,b){var s=this.id
s===$&&A.f()
return Math.abs(s)>A.uq(a,this.b)},
ki(a){return new A.z(a.a,0)},
iM(a){return a.a}}
A.ez.prototype={
tz(a,b){var s=A.uq(b,this.b)
return a.a.gnz()>2500&&a.d.gnz()>s*s},
qC(a,b){var s=this.id
s===$&&A.f()
return Math.abs(s)>A.ahc(a,this.b)},
ki(a){return a},
iM(a){return null}}
A.BV.prototype={
LD(){this.a=!0}}
A.mV.prototype={
ey(a){if(this.r){this.r=!1
$.dQ.k4$.Cq(this.b,a)}},
BH(a,b){return a.gaX(a).W(0,this.d).gbR()<=b}}
A.em.prototype={
hu(a){if(this.x==null)switch(a.gbQ(a)){case 1:if(this.f==null&&!0)return!1
break
default:return!1}return this.k0(a)},
eG(a){var s=this,r=s.x
if(r!=null)if(!r.BH(a,100))return
else{r=s.x
if(!r.f.a||a.gbQ(a)!==r.e){s.iQ()
return s.zg(a)}}s.zg(a)},
zg(a){var s,r,q,p,o,n,m=this
m.z0()
s=$.dQ.ok$.zN(0,a.gbg(),m)
r=a.gbg()
q=a.gaX(a)
p=a.gbQ(a)
o=new A.BV()
A.ca(B.w7,o.gLC())
n=new A.mV(r,s,q,p,o)
m.y.l(0,a.gbg(),n)
o=a.gaQ(a)
if(!n.r){n.r=!0
$.dQ.k4$.zR(r,m.gmJ(),o)}},
Ll(a){var s,r=this,q=r.y,p=q.i(0,a.gbg())
p.toString
if(t.E.b(a)){s=r.x
if(s==null){if(r.w==null)r.w=A.ca(B.cr,r.gLm())
s=p.b
$.dQ.ok$.QX(s)
p.ey(r.gmJ())
q.A(0,s)
r.wF()
r.x=p}else{s=s.c
s.a.kt(s.b,s.c,B.aG)
s=p.c
s.a.kt(s.b,s.c,B.aG)
p.ey(r.gmJ())
q.A(0,p.b)
q=r.f
if(q!=null)r.f2("onDoubleTap",q)
r.iQ()}}else if(t.U.b(a)){if(!p.BH(a,18))r.ks(p)}else if(t.v.b(a))r.ks(p)},
eF(a){},
fI(a){var s,r=this,q=r.y.i(0,a)
if(q==null){s=r.x
s=s!=null&&s.b===a}else s=!1
if(s)q=r.x
if(q!=null)r.ks(q)},
ks(a){var s,r=this,q=r.y
q.A(0,a.b)
s=a.c
s.a.kt(s.b,s.c,B.M)
a.ey(r.gmJ())
s=r.x
if(s!=null)if(a===s)r.iQ()
else{r.wu()
if(q.a===0)r.iQ()}},
m(){this.iQ()
this.vH()},
iQ(){var s,r=this
r.z0()
if(r.x!=null){if(r.y.a!==0)r.wu()
s=r.x
s.toString
r.x=null
r.ks(s)
$.dQ.ok$.SJ(0,s.b)}r.wF()},
wF(){var s=this.y
s=s.gaF(s)
B.b.Z(A.at(s,!0,A.t(s).h("p.E")),this.gMf())},
z0(){var s=this.w
if(s!=null){s.b4(0)
this.w=null}},
wu(){}}
A.Q7.prototype={
zR(a,b,c){J.iX(this.a.bh(0,a,new A.Q9()),b,c)},
Cq(a,b){var s,r=this.a,q=r.i(0,a)
q.toString
s=J.bq(q)
s.A(q,b)
if(s.gK(q))r.A(0,a)},
Id(a,b,c){var s,r,q,p
try{b.$1(a.a8(c))}catch(q){s=A.ac(q)
r=A.ar(q)
p=A.ba("while routing a pointer event")
A.dd(new A.bm(s,r,"gesture library",p,null,!1))}},
CD(a){var s=this,r=s.a.i(0,a.gbg()),q=s.b,p=t.yd,o=t.rY,n=A.lv(q,p,o)
if(r!=null)s.x0(a,r,A.lv(r,p,o))
s.x0(a,q,n)},
x0(a,b,c){c.Z(0,new A.Q8(this,b,a))}}
A.Q9.prototype={
$0(){return A.y(t.yd,t.rY)},
$S:127}
A.Q8.prototype={
$2(a,b){if(J.ee(this.b,a))this.a.Id(this.c,a,b)},
$S:128}
A.Qa.prototype={
T(a){return}}
A.Lq.prototype={
E(){return"DragStartBehavior."+this.b}}
A.cg.prototype={
rs(a){},
NQ(a){var s=this
s.d.l(0,a.gbg(),a.gcT(a))
if(s.hu(a))s.eG(a)
else s.ll(a)},
eG(a){},
ll(a){},
hu(a){var s=this.c
return s==null||s.B(0,a.gcT(a))},
Rq(a){var s=this.c
return s==null||s.B(0,a.gcT(a))},
m(){},
By(a,b,c){var s,r,q,p,o=null
try{o=b.$0()}catch(q){s=A.ac(q)
r=A.ar(q)
p=A.ba("while handling a gesture")
A.dd(new A.bm(s,r,"gesture",p,null,!1))}return o},
f2(a,b){return this.By(a,b,null,t.z)},
Rf(a,b,c){return this.By(a,b,c,t.z)}}
A.pu.prototype={
eG(a){this.mb(a.gbg(),a.gaQ(a))},
ll(a){this.T(B.M)},
eF(a){},
fI(a){},
T(a){var s,r,q=this.e,p=A.at(q.gaF(q),!0,t.C)
q.M(0)
for(q=p.length,s=0;s<q;++s){r=p[s]
r.a.kt(r.b,r.c,a)}},
m(){var s,r,q,p,o,n,m,l,k=this
k.T(B.M)
for(s=k.f,r=new A.ks(s,s.mk()),q=A.t(r).c;r.q();){p=r.d
if(p==null)p=q.a(p)
o=$.dQ.k4$
n=k.glj()
o=o.a
m=o.i(0,p)
m.toString
l=J.bq(m)
l.A(m,n)
if(l.gK(m))o.A(0,p)}s.M(0)
k.vH()},
H_(a){return $.dQ.ok$.zN(0,a,this)},
mb(a,b){var s=this
$.dQ.k4$.zR(a,s.glj(),b)
s.f.F(0,a)
s.e.l(0,a,s.H_(a))},
ey(a){var s=this.f
if(s.B(0,a)){$.dQ.k4$.Cq(a,this.glj())
s.A(0,a)
if(s.a===0)this.nw(a)}},
vy(a){if(t.E.b(a)||t.v.b(a)||t.zv.b(a))this.ey(a.gbg())}}
A.ot.prototype={
E(){return"GestureRecognizerState."+this.b}}
A.lH.prototype={
eG(a){var s=this
s.pp(a)
if(s.ax===B.b8){s.ax=B.cu
s.ay=a.gbg()
s.ch=new A.dX(a.gcm(),a.gaX(a))
s.cx=A.ca(s.Q,new A.Qf(s,a))}},
ll(a){if(!this.CW)this.ET(a)},
ho(a){var s,r,q,p=this
if(p.ax===B.cu&&a.gbg()===p.ay){if(!p.CW)s=p.xj(a)>18
else s=!1
if(p.CW){r=p.at
q=r!=null&&p.xj(a)>r}else q=!1
if(t.U.b(a))r=s||q
else r=!1
if(r){p.T(B.M)
r=p.ay
r.toString
p.ey(r)}else p.Bb(a)}p.vy(a)},
t_(){},
eF(a){if(a===this.ay){this.mX()
this.CW=!0}},
fI(a){var s=this
if(a===s.ay&&s.ax===B.cu){s.mX()
s.ax=B.wx}},
nw(a){var s=this
s.mX()
s.ax=B.b8
s.ch=null
s.CW=!1},
m(){this.mX()
this.pq()},
mX(){var s=this.cx
if(s!=null){s.b4(0)
this.cx=null}},
xj(a){return a.gaX(a).W(0,this.ch.b).gbR()}}
A.Qf.prototype={
$0(){this.a.t_()
return null},
$S:0}
A.dX.prototype={
U(a,b){return new A.dX(this.a.U(0,b.a),this.b.U(0,b.b))},
W(a,b){return new A.dX(this.a.W(0,b.a),this.b.W(0,b.b))},
k(a){return"OffsetPair(local: "+this.a.k(0)+", global: "+this.b.k(0)+")"}}
A.CP.prototype={}
A.m2.prototype={}
A.m3.prototype={}
A.uS.prototype={
eG(a){var s=this
if(s.ax===B.b8){if(s.k1!=null&&s.k2!=null)s.kw()
s.k1=a}if(s.k1!=null)s.F1(a)},
mb(a,b){this.EU(a,b)},
Bb(a){var s,r,q=this
if(t.E.b(a)){q.k2=a
q.wy()}else if(t.v.b(a)){q.T(B.M)
if(q.go){s=q.k1
s.toString
q.nR(a,s,"")}q.kw()}else{s=a.gbQ(a)
r=q.k1
if(s!==r.gbQ(r)){q.T(B.M)
s=q.ay
s.toString
q.ey(s)}}},
T(a){var s,r=this
if(r.id&&a===B.M){s=r.k1
s.toString
r.nR(null,s,"spontaneous")
r.kw()}r.vL(a)},
t_(){this.z7()},
eF(a){var s=this
s.vS(a)
if(a===s.ay){s.z7()
s.id=!0
s.wy()}},
fI(a){var s,r=this
r.F2(a)
if(a===r.ay){if(r.go){s=r.k1
s.toString
r.nR(null,s,"forced")}r.kw()}},
z7(){var s,r=this
if(r.go)return
s=r.k1
s.toString
r.Bd(s)
r.go=!0},
wy(){var s,r,q=this
if(!q.id||q.k2==null)return
s=q.k1
s.toString
r=q.k2
r.toString
q.Be(s,r)
q.kw()},
kw(){var s=this
s.id=s.go=!1
s.k1=s.k2=null}}
A.eK.prototype={
hu(a){var s,r=this
switch(a.gbQ(a)){case 1:if(r.y1==null&&r.af==null&&r.y2==null&&r.ah==null)return!1
break
case 2:s=!0
if(s)return!1
break
case 4:return!1
break
default:return!1}return r.k0(a)},
Bd(a){var s=this,r=a.gaX(a)
a.gcm()
s.d.i(0,a.gbg()).toString
switch(a.gbQ(a)){case 1:if(s.y1!=null)s.f2("onTapDown",new A.US(s,new A.m2(r)))
break
case 2:break
case 4:break}},
Be(a,b){var s,r=this
b.gcT(b)
b.gaX(b)
b.gcm()
switch(a.gbQ(a)){case 1:if(r.y2!=null)r.f2("onTapUp",new A.UT(r,new A.m3()))
s=r.af
if(s!=null)r.f2("onTap",s)
break
case 2:break
case 4:break}},
nR(a,b,c){var s,r=c===""?c:c+" "
switch(b.gbQ(b)){case 1:s=this.ah
if(s!=null)this.f2(r+"onTapCancel",s)
break
case 2:break
case 4:break}}}
A.US.prototype={
$0(){return this.a.y1.$1(this.b)},
$S:0}
A.UT.prototype={
$0(){return this.a.y2.$1(this.b)},
$S:0}
A.hn.prototype={
W(a,b){return new A.hn(this.a.W(0,b.a))},
U(a,b){return new A.hn(this.a.U(0,b.a))},
Oj(a,b){var s=this.a,r=s.gnz()
if(r>b*b)return new A.hn(s.cf(0,s.gbR()).V(0,b))
if(r<a*a)return new A.hn(s.cf(0,s.gbR()).V(0,a))
return this},
j(a,b){if(b==null)return!1
return b instanceof A.hn&&b.a.j(0,this.a)},
gt(a){var s=this.a
return A.J(s.a,s.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this.a
return"Velocity("+B.d.P(s.a,1)+", "+B.d.P(s.b,1)+")"}}
A.AV.prototype={
k(a){var s=this,r=s.a
return"VelocityEstimate("+B.d.P(r.a,1)+", "+B.d.P(r.b,1)+"; offset: "+s.d.k(0)+", duration: "+s.c.k(0)+", confidence: "+B.d.P(s.b,1)+")"}}
A.E4.prototype={
k(a){return"_PointAtTime("+this.b.k(0)+" at "+this.a.k(0)+")"}}
A.km.prototype={
kE(a,b){var s=++this.c
if(s===20)s=this.c=0
this.b[s]=new A.E4(a,b)},
v6(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=t.zp,e=A.b([],f),d=A.b([],f),c=A.b([],f),b=A.b([],f),a=this.c
f=this.b
s=f[a]
if(s==null)return null
r=s.a.a
q=s
p=q
o=0
do{n=f[a]
if(n==null)break
m=n.a.a
l=(r-m)/1000
if(l>100||Math.abs(m-p.a.a)/1000>40)break
k=n.b
e.push(k.a)
d.push(k.b)
c.push(1)
b.push(-l)
a=(a===0?20:a)-1;++o
if(o<20){q=n
p=q
continue}else{q=n
break}}while(!0)
if(o>=3){j=new A.xl(b,e,c).vu(2)
if(j!=null){i=new A.xl(b,d,c).vu(2)
if(i!=null){f=j.a[1]
m=i.a[1]
h=j.b
h===$&&A.f()
g=i.b
g===$&&A.f()
return new A.AV(new A.z(f*1000,m*1000),h*g,new A.aE(r-q.a.a),s.b.W(0,q.b))}}}return new A.AV(B.h,1,new A.aE(r-q.a.a),s.b.W(0,q.b))}}
A.Vt.prototype={
E(){return"ThemeMode."+this.b}}
A.p5.prototype={
ak(){return new A.rQ(B.m)}}
A.OA.prototype={
$2(a,b){return new A.ly(a,b)},
$S:129}
A.OE.prototype={}
A.rQ.prototype={
aN(){this.b6()
this.d=A.acd()},
gL4(){var s=A.b([],t.eu)
this.a.toString
s.push(B.v4)
s.push(B.v_)
return s},
KT(a,b){return A.a4l(B.wH,!0,b,null)},
Lb(a,b){var s,r,q,p,o,n,m,l,k=this,j=null
k.a.toString
s=A.d7(a)
r=s==null?j:s.d
if(r==null)r=B.Q
q=r===B.K
s=A.d7(a)
s=s==null?j:s.Q
p=s===!0
if(q)if(p)k.a.toString
if(q)k.a.toString
if(p)k.a.toString
o=k.a.cy
s=o.eo
n=s.b
if(n==null){m=o.ax.b
n=A.b7(102,m.gp(m)>>>16&255,m.gp(m)>>>8&255,m.gp(m)&255)}l=s.a
if(l==null)l=o.ax.b
k.a.toString
s=b==null?B.iP:b
return new A.qg(A.a46(new A.na(o,s,B.a5,B.aj,j,j),l,n),j)},
Hm(a){var s,r,q,p=this,o=null,n=p.a,m=n.cy
m=m.fr
s=m
if(s==null)s=B.eE
m=n.f
r=n.r
n=n.CW
q=p.gL4()
p.a.toString
return new A.r5(o,o,o,new A.Ym(),o,o,o,o,o,o,m,o,r,B.yb,p.gLa(),n,o,B.Dw,s,o,q,o,o,B.kx,!1,!1,!1,!1,p.gKS(),!0,o,o,o,!1,new A.hX(p,t.l9))},
L(a){var s,r=null,q=A.wK(!1,!1,this.Hm(a),r,r,r,r,!0,r,r,new A.Yn(),r,r,r)
this.a.toString
s=this.d
s===$&&A.f()
return new A.zG(B.uy,new A.jt(s,q,r),r)}}
A.Ym.prototype={
$1$2(a,b,c){var s=null,r=A.b([],t.F8),q=$.a_,p=A.yO(B.bu),o=A.b([],t.tD),n=A.mg(s),m=$.a_
return new A.jC(b,!1,!0,r,new A.c5(s,c.h("c5<ku<0>>")),new A.c5(s,t.DU),new A.PC(),s,0,new A.b5(new A.a8(q,c.h("a8<0?>")),c.h("b5<0?>")),p,o,a,n,new A.b5(new A.a8(m,c.h("a8<0?>")),c.h("b5<0?>")),c.h("jC<0>"))},
$2(a,b){return this.$1$2(a,b,t.z)},
$S:132}
A.Yn.prototype={
$2(a,b){if(!(b instanceof A.fv)||!b.c.glx().j(0,B.bN))return B.bC
return A.aek()?B.e3:B.bC},
$S:81}
A.ZL.prototype={
uY(a){return a.uC(this.b)},
oU(a){return new A.S(a.b,this.b)},
v3(a,b){return new A.z(0,a.b-b.b)},
jT(a){return this.b!==a.b}}
A.EB.prototype={}
A.nk.prototype={
IX(a){var s=new A.I6(this,a).$0()
return s},
ak(){return new A.rc(B.m)},
S4(a){return A.ai8().$1(a)}}
A.I6.prototype={
$0(){switch(this.b.r.a){case 0:case 1:case 3:case 5:return!1
case 2:case 4:return!0}},
$S:42}
A.rc.prototype={
bi(){var s,r=this
r.dG()
s=r.d
if(s!=null)s.I(0,r.gqy())
s=r.c.a_(t.dT)
s=s==null?null:s.f
r.d=s
if(s!=null){s=s.d
s.KP(s.c,new A.iH(r.gqy()),!1)}},
m(){var s=this,r=s.d
if(r!=null){r.I(0,s.gqy())
s.d=null}s.aR()},
JI(){var s,r,q,p=this.c
p.toString
p=A.qh(p)
s=p.e
if(s.gba()!=null){r=p.x
q=r.y
r=q==null?A.t(r).h("bP.T").a(q):q}else r=!1
if(r)s.gba().hT(0)
p=p.d.gba()
if(p!=null)p.Sf(0)},
JK(){var s,r,q,p=this.c
p.toString
p=A.qh(p)
s=p.d
if(s.gba()!=null){r=p.w
q=r.y
r=q==null?A.t(r).h("bP.T").a(q):q}else r=!1
if(r)s.gba().hT(0)
p=p.e.gba()
if(p!=null)p.Sf(0)},
Kl(a){var s,r=this,q=r.a.S4(a)
if(q){s=a.a
switch(s.gne()){case B.az:r.e=s.gU_().oX(0,0)
break
case B.aA:r.e=s.gU0().oX(0,0)
break
case B.aX:case B.aY:r.e=!1
break}}},
N1(a,b){var s=null,r=a===B.K?B.CZ:B.D_
return new A.fx(s,s,s,s,b,r.f,r.r,r.w)},
L(b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5=this,a6=null,a7="Open navigation menu",a8=A.b4(b3),a9=A.b4(b3).R8,b0=new A.Wc(b3,a6,a6,a6,4,a6,B.k,a6,a6,a6,a6,a6,a6,16,56,a6,a6,a6,a6),b1=b3.jm(t.yp),b2=A.OW(b3,t.X)
b3.a_(t.Ct)
s=A.bb(t.BD)
r=b1==null
if(r)q=a6
else{b1.a.toString
q=!1}if(r)b1=a6
else{b1.a.toString
b1=!1}p=b1===!0
b1=b2==null
if(b1)r=a6
else if(!b2.gnS()){r=b2.bT$
r=r!=null&&r.length!==0}else r=!0
o=r===!0
a5.a.toString
n=a9.at
if(n==null)n=56
r=b0.gbP(b0)
m=t.jH
l=A.jD(a6,s,m)
m=l==null?A.jD(a9.b,s,m):l
k=m==null?A.jD(r,s,t.iO):m
a5.a.toString
j=a9.c
i=j==null?b0.gcE():j
a5.a.toString
h=a9.d
if(h==null){r=b0.d
r.toString
h=r}if(s.B(0,B.Az)){a5.a.toString
s=a9.e
if(s==null)s=b0.e
g=s==null?h:s}else g=h
a5.a.toString
s=a9.x
f=s==null?b0.gln().eN(i):s
a5.a.toString
r=a9.y
if(r==null)r=a6
s=r==null?s:r
if(s==null){s=b0.y
s=s==null?a6:s.eN(j)
e=s}else e=s
if(e==null)e=f
a5.a.toString
s=a9.ax
if(s==null){s=b0.glU()
s=s==null?a6:s.eN(i)
d=s}else d=s
a5.a.toString
s=a9.ay
if(s==null){s=b0.glS()
s=s==null?a6:s.eN(i)
c=s}else c=s
a5.a.toString
if(q===!0){b1=f.a
if(b1==null)b1=24
A.Ov(b3,B.dl,t.z4).toString
b=A.a1C(a6,B.kn,b1,a5.gJH(),a7)}else{if(!(!p&&o)){if(b1)b1=a6
else b1=b2.gnS()||b2.bD$>0
b1=b1===!0}else b1=!0
if(b1)b=B.tG
else b=a6}if(b!=null){a5.a.toString
b=new A.dI(A.kV(a6,56),b,a6)}a=a5.a.e
switch(a8.r.a){case 0:case 1:case 3:case 5:a0=!0
break
case 2:case 4:a0=a6
break
default:a0=a6}a=A.cZ(a6,new A.Bg(a,a6),!1,a6,!1,a6,a6,!0,a6,a6,a0,a6,a6,a6,a6,a6,a6,a6,a6)
c.toString
a=A.vF(a,a6,B.cf,!1,c,a6,a6,B.aq)
a1=b3.a_(t.w).f
a=new A.ex(a1.rP(Math.min(a1.c,1.34)),a,a6)
a5.a.toString
if(p){b1=f.a
if(b1==null)b1=24
A.Ov(b3,B.dl,t.z4).toString
a2=A.a1C(a6,B.kn,b1,a5.gJJ(),a7)}else a2=a6
if(a2!=null)a2=A.oy(a2,e)
b1=a5.a.IX(a8)
a5.a.toString
s=a9.as
if(s==null)s=16
d.toString
s=A.oy(A.vF(new A.xT(b,a,a2,b1,s,a6),a6,B.ce,!0,d,a6,a6,B.aq),f)
a3=A.adv(!1,new A.va(new A.nR(new A.ZL(n),s,a6),a6),!0)
b1=A.Az(k)
b1=a5.N1(b1,a6)
a4=b1
a5.a.toString
b1=a9.f
if(b1==null)b1=b0.f
s=a9.r
if(s==null)s=b0.r
r=a9.w
if(r==null)r=b0.w
return A.cZ(a6,new A.nh(a4,A.Oz(B.aj,A.cZ(a6,new A.hG(B.tw,a6,a6,a3,a6),!1,a6,!0,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6),B.F,k,g,a6,b1,r,s,a6,B.cU),a6,t.tO),!0,a6,!1,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6,a6)}}
A.Bg.prototype={
aj(a){var s=a.a_(t.I)
s.toString
s=new A.EN(B.a3,s.w,null,A.aj())
s.am()
s.saC(null)
return s},
av(a,b){var s=a.a_(t.I)
s.toString
b.sbI(s.w)}}
A.EN.prototype={
bC(a){var s=a.Aj(1/0)
return a.b8(this.v$.fM(s))},
bA(){var s,r,q=this,p=A.O.prototype.gbl.call(q).Aj(1/0)
q.v$.cU(p,!0)
s=A.O.prototype.gbl.call(q)
r=q.v$.k3
r.toString
q.k3=s.b8(r)
q.rB()}}
A.Wc.prototype={
gmZ(){var s,r=this,q=r.cy
if(q===$){s=A.b4(r.cx)
r.cy!==$&&A.b2()
r.cy=s
q=s}return q},
giF(){var s,r=this,q=r.db
if(q===$){s=r.gmZ()
r.db!==$&&A.b2()
q=r.db=s.ax}return q},
gbP(a){return this.giF().a===B.K?this.giF().cy:this.giF().b},
gcE(){return this.giF().a===B.K?this.giF().db:this.giF().c},
gln(){return this.gmZ().ok},
glU(){return this.gmZ().p3.z},
glS(){return this.gmZ().p3.r}}
A.kO.prototype={
gt(a){var s=this
return A.J(s.a,s.gbP(s),s.gcE(),s.d,s.e,s.ge5(s),s.gdH(),s.w,s.gln(),s.grr(),s.z,s.Q,s.as,s.at,s.glU(),s.glS(),s.ch,s.CW,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.kO)if(J.e(b.gbP(b),r.gbP(r)))if(J.e(b.gcE(),r.gcE()))if(b.d==r.d)if(b.e==r.e)if(J.e(b.ge5(b),r.ge5(r)))if(J.e(b.gdH(),r.gdH()))if(J.e(b.w,r.w))if(J.e(b.gln(),r.gln()))if(J.e(b.grr(),r.grr()))if(J.e(b.z,r.z))if(b.as==r.as)if(b.at==r.at)if(J.e(b.glU(),r.glU()))if(J.e(b.glS(),r.glS()))s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s},
gbP(a){return this.b},
gcE(){return this.c},
ge5(a){return this.f},
gdH(){return this.r},
gln(){return this.x},
grr(){return this.y},
glU(){return this.ax},
glS(){return this.ay}}
A.Bf.prototype={}
A.p8.prototype={
fo(){var s,r,q,p,o,n,m,l,k,j,i,h,g=this,f=g.a
f.toString
s=g.b
s.toString
r=s.W(0,f)
q=Math.abs(r.a)
p=Math.abs(r.b)
o=r.gbR()
n=s.a
m=f.b
l=new A.z(n,m)
k=new A.OC(g,o)
if(q>2&&p>2){j=o*o
i=f.a
h=s.b
if(q<p){f=j/l.W(0,f).gbR()/2
g.e=f
g.d=new A.z(n+f*J.kL(i-n),h)
if(i<n){g.f=k.$0()*J.kL(m-h)
g.r=0}else{g.f=3.141592653589793+k.$0()*J.kL(h-m)
g.r=3.141592653589793}}else{g.e=j/l.W(0,s).gbR()/2
f=J.kL(h-m)
s=g.e
s.toString
g.d=new A.z(i,m+f*s)
if(m<h){g.f=-1.5707963267948966
g.r=-1.5707963267948966+k.$0()*J.kL(n-i)}else{g.f=1.5707963267948966
g.r=1.5707963267948966+k.$0()*J.kL(i-n)}}}else g.r=g.f=null
g.c=!1},
gaK(){var s=this
if(s.a==null||s.b==null)return null
if(s.c)s.fo()
return s.d},
gSz(){var s=this
if(s.a==null||s.b==null)return null
if(s.c)s.fo()
return s.e},
gO0(){var s=this
if(s.a==null||s.b==null)return null
if(s.c)s.fo()
return s.f},
gPv(){var s=this
if(s.a==null||s.b==null)return null
if(s.c)s.fo()
return s.f},
srI(a){if(!J.e(a,this.a)){this.a=a
this.c=!0}},
sj6(a,b){if(!J.e(b,this.b)){this.b=b
this.c=!0}},
cI(a){var s,r,q,p,o=this
if(o.c)o.fo()
if(a===0){s=o.a
s.toString
return s}if(a===1){s=o.b
s.toString
return s}s=o.f
if(s==null||o.r==null){s=A.y2(o.a,o.b,a)
s.toString
return s}s=A.E(s,o.r,a)
s.toString
r=Math.cos(s)
q=o.e
q.toString
s=Math.sin(s)
p=o.e
p.toString
return o.d.U(0,new A.z(r*q,s*p))},
k(a){var s=this
return"MaterialPointArcTween("+A.h(s.a)+" \u2192 "+A.h(s.b)+"; center="+A.h(s.gaK())+", radius="+A.h(s.gSz())+", beginAngle="+A.h(s.gO0())+", endAngle="+A.h(s.gPv())+")"}}
A.OC.prototype={
$0(){var s=this.a.e
s.toString
return 2*Math.asin(this.b/(2*s))},
$S:135}
A.mn.prototype={
E(){return"_CornerId."+this.b}}
A.hr.prototype={}
A.ly.prototype={
fo(){var s,r,q=this,p=A.agA(B.yi,new A.OD(q,q.b.gaK().W(0,q.a.gaK()))),o=q.a
o.toString
s=p.a
o=q.iH(o,s)
r=q.b
r.toString
q.f=new A.p8(o,q.iH(r,s))
s=q.a
s.toString
r=p.b
s=q.iH(s,r)
o=q.b
o.toString
q.r=new A.p8(s,q.iH(o,r))
q.e=!1},
iH(a,b){switch(b.a){case 0:return new A.z(a.a,a.b)
case 1:return new A.z(a.c,a.b)
case 2:return new A.z(a.a,a.d)
case 3:return new A.z(a.c,a.d)}},
gO1(){var s,r=this
if(r.a==null)return null
if(r.e)r.fo()
s=r.f
s===$&&A.f()
return s},
gPw(){var s,r=this
if(r.b==null)return null
if(r.e)r.fo()
s=r.r
s===$&&A.f()
return s},
srI(a){if(!J.e(a,this.a)){this.a=a
this.e=!0}},
sj6(a,b){if(!J.e(b,this.b)){this.b=b
this.e=!0}},
cI(a){var s,r,q=this
if(q.e)q.fo()
if(a===0){s=q.a
s.toString
return s}if(a===1){s=q.b
s.toString
return s}s=q.f
s===$&&A.f()
s=s.cI(a)
r=q.r
r===$&&A.f()
return A.adk(s,r.cI(a))},
k(a){var s=this
return"MaterialRectArcTween("+A.h(s.a)+" \u2192 "+A.h(s.b)+"; beginArc="+A.h(s.gO1())+", endArc="+A.h(s.gPw())+")"}}
A.OD.prototype={
$1(a){var s,r,q,p=this.a,o=this.b,n=p.a
n.toString
n=p.iH(n,a.b)
s=p.a
s.toString
r=n.W(0,p.iH(s,a.a))
q=r.gbR()
return o.a*r.a/q+o.b*r.b/q},
$S:136}
A.uQ.prototype={
L(a){return new A.jv(A.aae(A.b4(a).r),null)}}
A.uP.prototype={
L(a){A.Ov(a,B.dl,t.z4).toString
return A.a1C(null,B.tF,null,new A.Ir(this,a),"Back")}}
A.Ir.prototype={
$0(){A.acw(this.b)},
$S:0}
A.nq.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nq&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&b.c==s.c&&b.d==s.d&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)}}
A.Bm.prototype={}
A.p6.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.p6&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&b.f==s.f&&J.e(b.r,s.r)&&J.e(b.w,s.w)}}
A.Dl.prototype={}
A.nt.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nt&&J.e(b.a,s.a)&&b.b==s.b&&b.d==s.d&&J.e(b.e,s.e)&&J.e(b.f,s.f)}}
A.Bp.prototype={}
A.nu.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.nu)if(J.e(b.a,r.a))if(b.b==r.b)if(J.e(b.c,r.c))if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(J.e(b.f,r.f))if(J.e(b.r,r.r))if(J.e(b.w,r.w))s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Bq.prototype={}
A.nv.prototype={
gt(a){var s=this
return A.J(s.gbP(s),s.gdH(),s.c,s.d,s.e,s.f,s.r,s.w,s.x,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.nv)if(J.e(b.gbP(b),r.gbP(r)))if(J.e(b.gdH(),r.gdH()))if(b.c==r.c)if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(b.f==r.f)if(J.e(b.r,r.r))s=J.e(b.x,r.x)
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s},
gbP(a){return this.a},
gdH(){return this.b}}
A.Br.prototype={}
A.pV.prototype={
ak(){return new A.EJ(A.bb(t.BD),B.m)}}
A.EJ.prototype={
aN(){this.b6()
this.a.toString
this.ox(B.ad)},
aV(a){var s,r=this
r.bu(a)
r.a.toString
r.ox(B.ad)
s=r.jc$
if(s.B(0,B.ad)&&s.B(0,B.ao))r.ox(B.ao)},
gIn(){var s=this,r=s.jc$
if(r.B(0,B.ad))return s.a.ch
if(r.B(0,B.ao))return s.a.ay
if(r.B(0,B.bV))return s.a.at
if(r.B(0,B.bW))return s.a.ax
return s.a.as},
L(a5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this,a0=null,a1=a.a.r,a2=a.jc$,a3=A.jD(a1.b,a2,t.jH),a4=A.jD(a.a.db,a2,t.uD)
a.a.toString
s=new A.z(0,0).V(0,4)
r=B.tg.t6(a.a.cy)
a1=a.a.f
q=A.jD(a1,a2,t.EA)
a.a.toString
a1=s.a
a2=s.b
p=B.b6.F(0,new A.b8(a1,a2,a1,a2)).kJ(0,B.b6,B.tq)
o=a.gIn()
n=a.a.r.eN(a3)
m=a.a.w
A.b4(a5)
l=a.a
k=l.go
l=l.fx
j=a.CQ(B.bW)
a.a.toString
i=a.CR(B.ao,a0)
h=a.a
g=h.Q
f=h.x
h=h.y
e=a.CQ(B.bV)
d=a.a
c=d.c
n=A.Oz(B.aj,A.a4z(!1,!0,A.oy(A.a3Z(a0,A.v5(d.dy,1,1),a0,a0,a0,p,a0),new A.c_(a0,a0,a0,a0,a0,a3,a0,a0)),a4,!0,f,l,a0,h,q,j,i,e,a0,c,a0,g,a0,a0),k,m,o,a0,a0,a4,a0,n,B.eF)
switch(d.fr.a){case 0:b=new A.S(48+a1,48+a2)
break
case 1:b=B.A
break
default:b=a0}return A.cZ(!0,new A.D0(b,new A.dI(r,n,a0),a0),!0,!0,!1,a0,a0,a0,a0,a0,a0,a0,a0,a0,a0,a0,a0,a0,a0)}}
A.D0.prototype={
aj(a){var s=new A.ES(this.e,null,A.aj())
s.am()
s.saC(null)
return s},
av(a,b){b.stP(this.e)}}
A.ES.prototype={
stP(a){if(this.u.j(0,a))return
this.u=a
this.a1()},
wr(a,b){var s,r,q=this.v$
if(q!=null){s=b.$2(q,a)
q=s.a
r=this.u
return a.b8(new A.S(Math.max(q,r.a),Math.max(s.b,r.b)))}return B.A},
bC(a){return this.wr(a,A.HB())},
bA(){var s,r,q=this,p=q.wr(A.O.prototype.gbl.call(q),A.HC())
q.k3=p
s=q.v$
if(s!=null){r=s.e
r.toString
t.x.a(r)
s=s.k3
s.toString
r.a=B.a3.hP(t.q.a(p.W(0,s)))}},
bj(a,b){var s
if(this.fk(a,b))return!0
s=this.v$.k3.eK(B.h)
return a.rA(new A.Z5(this,s),s,A.a4U(s))}}
A.Z5.prototype={
$2(a,b){return this.a.v$.bj(a,this.b)},
$S:16}
A.GV.prototype={}
A.ny.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.ny)if(b.d==r.d)if(b.e==r.e)if(J.e(b.f,r.f))s=!0
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Bt.prototype={}
A.aU.prototype={
gt(a){var s=this
return A.cY([s.goF(),s.gbP(s),s.gcE(),s.goi(),s.ge5(s),s.gdH(),s.geQ(s),s.gdh(s),s.go9(),s.y,s.go7(),s.Q,s.gf_(),s.at,s.gcq(s),s.goa(),s.goL(),s.goD(),s.cx,s.cy,s.db,s.gm9()])},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.aU&&b.goF()==s.goF()&&b.gbP(b)==s.gbP(s)&&b.gcE()==s.gcE()&&b.goi()==s.goi()&&b.ge5(b)==s.ge5(s)&&b.gdH()==s.gdH()&&b.geQ(b)==s.geQ(s)&&b.gdh(b)==s.gdh(s)&&b.go9()==s.go9()&&b.y==s.y&&b.go7()==s.go7()&&b.Q==s.Q&&b.gf_()==s.gf_()&&b.at==s.at&&b.gcq(b)==s.gcq(s)&&b.goa()==s.goa()&&J.e(b.goL(),s.goL())&&b.goD()==s.goD()&&J.e(b.cx,s.cx)&&b.cy==s.cy&&J.e(b.db,s.db)&&b.gm9()==s.gm9()},
goF(){return this.a},
gbP(a){return this.b},
gcE(){return this.c},
goi(){return this.d},
ge5(a){return this.e},
gdH(){return this.f},
geQ(a){return this.r},
gdh(a){return this.w},
go9(){return this.x},
go7(){return this.z},
gf_(){return this.as},
gcq(a){return this.ax},
goa(){return this.ay},
goL(){return this.ch},
goD(){return this.CW},
gm9(){return this.dx}}
A.Df.prototype={
T(a){var s,r=this,q=r.a,p=q==null?null:q.T(a)
q=r.b
s=q==null?null:q.T(a)
q=p==null
if(q&&s==null)return null
if(q){q=s.a.a
return A.ad(new A.cf(A.b7(0,q>>>16&255,q>>>8&255,q&255),0,B.ar,-1),s,r.c)}if(s==null){q=p.a.a
return A.ad(p,new A.cf(A.b7(0,q>>>16&255,q>>>8&255,q&255),0,B.ar,-1),r.c)}return A.ad(p,s,r.c)},
$ib_:1}
A.Bu.prototype={}
A.nz.prototype={
ak(){return new A.re(null,null,B.m)}}
A.re.prototype={
tq(){this.ai(new A.WO())},
gbY(){var s=this.a.z
if(s==null){s=this.r
s.toString}return s},
lp(){var s,r=this
if(r.a.z==null)r.r=A.a4Q(null)
s=r.gbY()
r.a.toString
s.ew(0,B.ad,!1)
r.gbY().Y(0,r.gia())},
aN(){this.b6()
this.lp()},
aV(a){var s,r=this
r.bu(a)
s=a.z
if(r.a.z!=s){if(s!=null)s.I(0,r.gia())
if(r.a.z!=null){s=r.r
if(s!=null)s.m()
r.r=null}r.lp()}r.a.toString},
m(){var s,r=this
r.gbY().I(0,r.gia())
s=r.r
if(s!=null)s.m()
s=r.d
if(s!=null)s.m()
r.Gr()},
L(c5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,c0=this,c1=null,c2=c0.a,c3=new A.WL(c2.r,c2.Tc(c5),c0.a.Pf(c5)),c4=new A.WM(c0,c3)
c2=t.u6
s=c4.$1$1(new A.Wo(),c2)
r=c4.$1$1(new A.Wp(),t.w8)
q=t.jH
p=c4.$1$1(new A.Wq(),q)
o=c4.$1$1(new A.WB(),q)
n=c4.$1$1(new A.WE(),q)
m=c4.$1$1(new A.WF(),q)
l=c4.$1$1(new A.WG(),t.DS)
k=t.xB
j=c4.$1$1(new A.WH(),k)
i=c4.$1$1(new A.WI(),k)
h=c4.$1$1(new A.WJ(),k)
g=c4.$1$1(new A.WK(),q)
f=c4.$1$1(new A.Wr(),c2)
e=c4.$1$1(new A.Ws(),t.Fn)
d=c4.$1$1(new A.Wt(),t.yX)
c=c3.$1$1(new A.Wu(),t.vW)
b=c3.$1$1(new A.Wv(),t.c1)
a=c3.$1$1(new A.Ww(),t.ya)
a0=c3.$1$1(new A.Wx(),t.y)
a1=c3.$1$1(new A.Wy(),t.bX)
a2=new A.z(c.a,c.b).V(0,4)
a3=c3.$1$1(new A.Wz(),t.zQ)
c2=j.a
q=j.b
a4=c.t6(new A.aC(c2,h.a,q,h.b))
if(i!=null){a5=a4.b8(i)
c2=a5.a
if(isFinite(c2))a4=a4.OT(c2,c2)
c2=a5.b
if(isFinite(c2))a4=a4.OS(c2,c2)}a6=a2.b
c2=a2.a
a7=Math.max(0,c2)
a8=l.F(0,new A.b8(a7,a6,a7,a6)).kJ(0,B.b6,B.tq)
if(a.a>0){q=c0.e
if(q!=null){k=c0.f
if(k!=null)if(q!==s)if(k.gp(k)!==p.gp(p)){q=c0.f
q=(q.gp(q)>>>24&255)/255===1&&(p.gp(p)>>>24&255)/255<1&&s===0}else q=!1
else q=!1
else q=!1}else q=!1}else q=!1
if(q){q=c0.d
if(!J.e(q==null?c1:q.e,a)){q=c0.d
if(q!=null)q.m()
q=A.dr(c1,a,c1,c1,c0)
q.b2()
k=q.bx$
k.b=!0
k.a.push(new A.WA(c0))
c0.d=q}p=c0.f
c0.d.sp(0,0)
c0.d.cc(0)}c0.e=s
c0.f=p
s.toString
q=r==null?c1:r.eN(o)
k=d.hX(e)
a9=p==null?B.cV:B.eF
b0=c0.a
b1=b0.w
b2=b0.c
b3=b0.d
b4=b0.e
b5=b0.x
b0=b0.f
b6=d.hX(e)
b7=c0.gbY()
b8=g==null?o:g
a1.toString
a9=A.Oz(a,A.a4z(!1,!0,A.oy(new A.fs(a8,new A.hG(a1,1,1,c0.a.Q,c1),c1),new A.c_(f,c1,c1,c1,c1,b8,c1,c1)),b6,a0,c1,b5,B.aE,c1,new A.DB(new A.WC(c3)),b0,c1,b4,b3,b2,new A.rT(new A.WD(c3),t.vs),c1,a3,b7),b1,p,s,c1,n,k,m,q,a9)
switch(b.a){case 0:b9=new A.S(48+c2,48+a6)
break
case 1:b9=B.A
break
default:b9=c1}return A.cZ(!0,new A.D1(b9,new A.dI(a4,a9,c1),c1),!0,!0,!1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1,c1)}}
A.WO.prototype={
$0(){},
$S:0}
A.WL.prototype={
$1$1(a,b){var s=a.$1(this.a),r=a.$1(this.b),q=a.$1(this.c),p=s==null?r:s
return p==null?q:p},
$1(a){return this.$1$1(a,t.z)},
$S:138}
A.WM.prototype={
$1$1(a,b){return this.b.$1$1(new A.WN(this.a,a,b),b)},
$1(a){return this.$1$1(a,t.z)},
$S:139}
A.WN.prototype={
$1(a){var s=this.b.$1(a)
return s==null?null:s.T(this.a.gbY().a)},
$S(){return this.c.h("0?(aU?)")}}
A.Wo.prototype={
$1(a){return a==null?null:a.geQ(a)},
$S:79}
A.Wp.prototype={
$1(a){return a==null?null:a.goF()},
$S:141}
A.Wq.prototype={
$1(a){return a==null?null:a.gbP(a)},
$S:26}
A.WB.prototype={
$1(a){return a==null?null:a.gcE()},
$S:26}
A.WE.prototype={
$1(a){return a==null?null:a.ge5(a)},
$S:26}
A.WF.prototype={
$1(a){return a==null?null:a.gdH()},
$S:26}
A.WG.prototype={
$1(a){return a==null?null:a.gdh(a)},
$S:143}
A.WH.prototype={
$1(a){return a==null?null:a.go9()},
$S:55}
A.WI.prototype={
$1(a){return a==null?null:a.y},
$S:55}
A.WJ.prototype={
$1(a){return a==null?null:a.go7()},
$S:55}
A.WK.prototype={
$1(a){return a==null?null:a.Q},
$S:26}
A.Wr.prototype={
$1(a){return a==null?null:a.gf_()},
$S:79}
A.Ws.prototype={
$1(a){return a==null?null:a.at},
$S:145}
A.Wt.prototype={
$1(a){return a==null?null:a.gcq(a)},
$S:146}
A.WC.prototype={
$1(a){return this.a.$1$1(new A.Wm(a),t.oR)},
$S:147}
A.Wm.prototype={
$1(a){var s
if(a==null)s=null
else{s=a.goa()
s=s==null?null:s.T(this.a)}return s},
$S:148}
A.WD.prototype={
$1(a){return this.a.$1$1(new A.Wl(a),t.iO)},
$S:149}
A.Wl.prototype={
$1(a){var s
if(a==null)s=null
else{s=a.goi()
s=s==null?null:s.T(this.a)}return s},
$S:150}
A.Wu.prototype={
$1(a){return a==null?null:a.goL()},
$S:151}
A.Wv.prototype={
$1(a){return a==null?null:a.goD()},
$S:152}
A.Ww.prototype={
$1(a){return a==null?null:a.cx},
$S:153}
A.Wx.prototype={
$1(a){return a==null?null:a.cy},
$S:154}
A.Wy.prototype={
$1(a){return a==null?null:a.db},
$S:155}
A.Wz.prototype={
$1(a){return a==null?null:a.gm9()},
$S:156}
A.WA.prototype={
$1(a){if(a===B.B)this.a.ai(new A.Wn())},
$S:2}
A.Wn.prototype={
$0(){},
$S:0}
A.DB.prototype={
T(a){var s=this.a.$1(a)
s.toString
return s},
gkU(){return"ButtonStyleButton_MouseCursor"}}
A.D1.prototype={
aj(a){var s=new A.ET(this.e,null,A.aj())
s.am()
s.saC(null)
return s},
av(a,b){b.stP(this.e)}}
A.ET.prototype={
stP(a){if(this.u.j(0,a))return
this.u=a
this.a1()},
wO(a,b){var s,r,q=this.v$
if(q!=null){s=b.$2(q,a)
q=s.a
r=this.u
return a.b8(new A.S(Math.max(q,r.a),Math.max(s.b,r.b)))}return B.A},
bC(a){return this.wO(a,A.HB())},
bA(){var s,r,q=this,p=q.wO(A.O.prototype.gbl.call(q),A.HC())
q.k3=p
s=q.v$
if(s!=null){r=s.e
r.toString
t.x.a(r)
s=s.k3
s.toString
r.a=B.a3.hP(t.q.a(p.W(0,s)))}},
bj(a,b){var s
if(this.fk(a,b))return!0
s=this.v$.k3.eK(B.h)
return a.rA(new A.Z6(this,s),s,A.a4U(s))}}
A.Z6.prototype={
$2(a,b){return this.a.v$.bj(a,this.b)},
$S:16}
A.u9.prototype={
bZ(){this.eA()
this.dt()
this.h2()},
m(){var s=this,r=s.aL$
if(r!=null)r.I(0,s.gfq())
s.aL$=null
s.aR()}}
A.II.prototype={
E(){return"ButtonTextTheme."+this.b}}
A.v1.prototype={
gdh(a){switch(0){case 0:case 1:return B.wc}},
gcq(a){switch(0){case 0:case 1:return B.Ba}},
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.v1&&J.e(b.gdh(b),s.gdh(s))&&J.e(b.gcq(b),s.gcq(s))&&J.e(b.w,s.w)&&J.e(b.y,s.y)&&J.e(b.z,s.z)&&J.e(b.at,s.at)&&b.ax==s.ax},
gt(a){var s=this
return A.J(B.u1,88,36,s.gdh(s),s.gcq(s),!1,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.Bv.prototype={}
A.nA.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nA&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&b.e==s.e&&J.e(b.f,s.f)&&J.e(b.r,s.r)}}
A.Bx.prototype={}
A.nB.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nB&&b.b==s.b&&b.c==s.c&&b.d==s.d&&b.e==s.e&&J.e(b.w,s.w)&&J.e(b.x,s.x)}}
A.By.prototype={}
A.nC.prototype={
gt(a){var s=this
return A.cY([s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,s.ay,s.ch,s.CW,s.cx,s.cy])},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nC&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&b.x==s.x&&J.e(b.y,s.y)&&J.e(b.z,s.z)&&J.e(b.Q,s.Q)&&J.e(b.as,s.as)&&J.e(b.at,s.at)&&J.e(b.ax,s.ax)&&J.e(b.ay,s.ay)&&b.ch==s.ch&&b.CW==s.CW&&b.cx==s.cx&&J.e(b.cy,s.cy)}}
A.BA.prototype={}
A.vd.prototype={
j(a,a0){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b=this
if(a0==null)return!1
if(b===a0)return!0
if(J.L(a0)!==A.x(b))return!1
if(a0 instanceof A.vd)if(a0.a===b.a){s=a0.b
r=b.b
if(s.j(0,r)){q=a0.c
p=b.c
if(q.j(0,p)){o=a0.d
if(o==null)o=s
n=b.d
if(o.j(0,n==null?r:n)){o=a0.e
if(o==null)o=q
n=b.e
if(o.j(0,n==null?p:n)){o=a0.f
n=b.f
if(o.j(0,n)){m=a0.r
l=b.r
if(m.j(0,l)){k=a0.w
if(k==null)k=o
j=b.w
if(k.j(0,j==null?n:j)){k=a0.x
if(k==null)k=m
j=b.x
if(k.j(0,j==null?l:j)){k=a0.y
j=k==null
i=j?o:k
h=b.y
g=h==null
if(i.j(0,g?n:h)){i=a0.z
f=i==null
e=f?m:i
d=b.z
c=d==null
if(e.j(0,c?l:d)){e=a0.Q
if(e==null){if(j)k=o}else k=e
j=b.Q
if(j==null)j=g?n:h
if(k.j(0,j)){k=a0.as
if(k==null)m=f?m:i
else m=k
k=b.as
if(k==null)l=c?l:d
else l=k
if(m.j(0,l)){m=a0.at
l=b.at
if(m.j(0,l)){k=a0.ax
j=b.ax
if(k.j(0,j)){i=a0.ay
m=i==null?m:i
i=b.ay
if(m.j(0,i==null?l:i)){m=a0.ch
if(m==null)m=k
l=b.ch
if(m.j(0,l==null?j:l))if(a0.CW.j(0,b.CW)){m=a0.cx
l=b.cx
if(m.j(0,l)){k=a0.cy
j=b.cy
if(k.j(0,j)){i=a0.db
h=b.db
if(i.j(0,h)){g=a0.dx
if(g==null)g=k
f=b.dx
if(g.j(0,f==null?j:f)){g=a0.dy
if(g==null)g=i
f=b.dy
if(g.j(0,f==null?h:f)){g=a0.fr
if(g==null)g=m
f=b.fr
if(g.j(0,f==null?l:f)){g=a0.fx
m=g==null?m:g
g=b.fx
if(m.j(0,g==null?l:g)){m=a0.fy
if(m==null)m=B.k
l=b.fy
if(m.j(0,l==null?B.k:l)){m=a0.go
if(m==null)m=B.k
l=b.go
if(m.j(0,l==null?B.k:l)){m=a0.id
if(m==null)m=i
l=b.id
if(m.j(0,l==null?h:l)){m=a0.k1
if(m==null)m=k
l=b.k1
if(m.j(0,l==null?j:l)){m=a0.k2
q=m==null?q:m
m=b.k2
if(q.j(0,m==null?p:m)){q=a0.k4
if(q==null)q=s
p=b.k4
if(q.j(0,p==null?r:p)){q=a0.ok
if(q==null)q=o
p=b.ok
if(q.j(0,p==null?n:p)){q=a0.k3
s=q==null?s:q
q=b.k3
s=s.j(0,q==null?r:q)}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1
else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1
else s=!1
return s},
gt(b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9=this,b0=a9.b,b1=a9.c,b2=a9.d
if(b2==null)b2=b0
s=a9.e
if(s==null)s=b1
r=a9.f
q=a9.r
p=a9.w
if(p==null)p=r
o=a9.x
if(o==null)o=q
n=a9.y
m=n==null
l=m?r:n
k=a9.z
j=k==null
i=j?q:k
h=a9.Q
if(h==null){if(m)n=r}else n=h
m=a9.as
if(m==null)m=j?q:k
k=a9.at
j=a9.ax
h=a9.ay
if(h==null)h=k
g=a9.ch
if(g==null)g=j
f=a9.cx
e=a9.cy
d=a9.db
c=a9.dx
if(c==null)c=e
b=a9.dy
if(b==null)b=d
a=a9.fr
if(a==null)a=f
a0=a9.fx
if(a0==null)a0=f
a1=a9.fy
if(a1==null)a1=B.k
a2=a9.go
if(a2==null)a2=B.k
a3=a9.id
if(a3==null)a3=d
a4=a9.k1
if(a4==null)a4=e
a5=a9.k2
if(a5==null)a5=b1
a6=a9.k4
if(a6==null)a6=b0
a7=a9.ok
if(a7==null)a7=r
a8=a9.k3
return A.J(a9.a,b0,b1,b2,s,r,q,p,o,l,i,n,m,k,j,h,g,a9.CW,f,A.J(e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8==null?b0:a8,B.a,B.a,B.a,B.a,B.a,B.a))}}
A.BB.prototype={}
A.xv.prototype={}
A.nS.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.nS&&J.e(b.a,s.a)&&b.b==s.b&&b.c==s.c&&J.e(b.d,s.d)&&b.e==s.e&&b.f==s.f&&J.e(b.r,s.r)&&b.w==s.w&&b.x==s.x&&b.y==s.y&&b.z==s.z}}
A.C4.prototype={}
A.o_.prototype={
gt(a){return J.k(this.e)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.o_&&J.e(b.a,s.a)&&b.b==s.b&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.y,s.y)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&J.e(b.x,s.x)}}
A.Cd.prototype={}
A.o0.prototype={
gt(a){var s=this
return A.J(s.gad(s),s.b,s.c,s.d,s.e,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.o0&&J.e(b.gad(b),s.gad(s))&&b.b==s.b&&b.c==s.c&&b.d==s.d&&b.e==s.e},
gad(a){return this.a}}
A.Ch.prototype={}
A.o6.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.o6&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&b.c==s.c&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&b.w==s.w}}
A.Co.prototype={}
A.o7.prototype={
gt(a){return A.J(this.a,this.b,this.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.o7)if(J.e(b.a,r.a))s=J.e(b.c,r.c)
else s=!1
else s=!1
return s}}
A.Cp.prototype={}
A.oa.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.oa&&J.e(b.a,this.a)}}
A.Cr.prototype={}
A.ok.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,null,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.ok&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&J.e(b.x,s.x)&&J.e(b.y,s.y)&&J.e(b.z,s.z)&&!0}}
A.Cw.prototype={}
A.om.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.om&&J.e(b.a,this.a)}}
A.CA.prototype={}
A.oo.prototype={
bw(a){var s=this
return s.f!==a.f||s.r!==a.r||s.w!==a.w||s.x!==a.x||!1}}
A.X8.prototype={
k(a){return"<default FloatingActionButton tag>"}}
A.mu.prototype={
E(){return"_FloatingActionButtonType."+this.b}}
A.wF.prototype={
L(a6){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this,a0=null,a1=A.b4(a6),a2=a1.hi,a3=a.k1,a4=new A.Xl(a3,!0,A.b4(a6),A.b4(a6).ax,a0,a0,a0,a0,a0,6,6,8,a0,12,a0,!0,a0,B.tT,B.tS,B.tU,B.tV,8,a0,a0,a0),a5=a2.a
if(a5==null)a5=a4.gcE()
s=a2.b
if(s==null)s=a4.gbP(a4)
r=a2.c
if(r==null)r=a4.glf()
q=a2.d
if(q==null)q=a4.glm()
p=a2.e
if(p==null)p=a4.gjV()
o=a2.f
if(o==null){n=a4.f
n.toString
o=n}m=a2.r
if(m==null){n=a4.r
n.toString
m=n}l=a2.w
if(l==null){n=a4.w
n.toString
l=n}n=a2.x
k=n==null?a4.x:n
if(k==null)k=o
j=a2.y
if(j==null){n=a4.y
n.toString
j=n}i=a2.Q
if(i==null){n=a4.Q
n.toString
i=n}h=a2.as
if(h==null)h=a4.gf_()
n=a2.cy
g=(n==null?a4.gld():n).eN(a5)
f=a2.z
if(f==null)f=a4.gcq(a4)
n=a.c
e=A.oy(n,new A.c_(h,a0,a0,a0,a0,a0,a0,a0))
switch(a3.a){case 0:d=a2.at
if(d==null){a3=a4.at
a3.toString
d=a3}break
case 1:d=a2.ax
if(d==null){a3=a4.ax
a3.toString
d=a3}break
case 2:d=a2.ay
if(d==null){a3=a4.ay
a3.toString
d=a3}break
case 3:d=a2.ch
if(d==null){a3=a4.ch
a3.toString
d=a3}c=a2.cx
if(c==null)c=a4.glc()
a3=A.b([],t.F)
a3.push(n)
e=new A.Bz(new A.fs(c,A.ads(a3,B.k5,B.A7),a0),a0)
break
default:d=a0}b=new A.pV(a.z,new A.Cq(a0,a2.db),g,s,r,q,p,o,l,m,j,k,d,f,e,a1.e,a0,!1,B.F,i,a0)
a3=a.d
if(a3!=null)b=A.a5U(b,a3)
return new A.xE(new A.js(B.v1,b,a0),a0)}}
A.Cq.prototype={
T(a){var s=A.jD(this.a,a,t.EA)
if(s==null)s=null
return s==null?B.jQ.T(a):s},
gkU(){return"MaterialStateMouseCursor(FloatActionButton)"}}
A.Bz.prototype={
aj(a){var s=a.a_(t.I)
s.toString
s=new A.EO(B.a3,s.w,null,A.aj())
s.am()
s.saC(null)
return s},
av(a,b){var s=a.a_(t.I)
s.toString
b.sbI(s.w)}}
A.EO.prototype={
bC(a){var s,r=this.v$,q=a.a,p=a.b,o=a.c,n=a.d
if(r!=null){s=r.fM(B.bq)
return new A.S(Math.max(q,Math.min(p,s.a)),Math.max(o,Math.min(n,s.b)))}else return new A.S(A.T(1/0,q,p),A.T(1/0,o,n))},
bA(){var s=this,r=A.O.prototype.gbl.call(s),q=s.v$,p=r.a,o=r.b,n=r.c,m=r.d
if(q!=null){q.cU(B.bq,!0)
q=s.v$.k3
s.k3=new A.S(Math.max(p,Math.min(o,q.a)),Math.max(n,Math.min(m,q.b)))
s.rB()}else s.k3=new A.S(A.T(1/0,p,o),A.T(1/0,n,m))}}
A.Xl.prototype={
gcE(){return this.fx.r},
gbP(a){return this.fx.f},
glf(){return this.fr.cx},
glm(){return this.fr.dx},
gjV(){return this.fr.k3},
gcq(a){return this.dx===B.tm?B.Cs:B.jT},
gf_(){return this.dx===B.HU?36:24},
glc(){return new A.dv(this.dy&&this.dx===B.tm?16:20,0,20,0)},
gld(){return this.fr.p3.as.ON(1.2)}}
A.Mg.prototype={
k(a){return"FloatingActionButtonLocation"}}
A.Ur.prototype={
v0(a){var s=this.Dh(a,0),r=a.c,q=a.b.b,p=a.a.b,o=a.w.b,n=r-p-Math.max(16,a.f.d-(a.r.b-r)+16)
if(o>0)n=Math.min(n,r-o-p-16)
return new A.z(s,(q>0?Math.min(n,r-q-p/2):n)+0)}}
A.M4.prototype={}
A.M3.prototype={
Dh(a,b){switch(a.y.a){case 0:return 16+a.e.a-b
case 1:return a.r.a-16-a.e.c-a.a.a+b}}}
A.Xj.prototype={
k(a){return"FloatingActionButtonLocation.endFloat"}}
A.Mf.prototype={
k(a){return"FloatingActionButtonAnimator"}}
A.Zu.prototype={
Dg(a,b,c){if(c<0.5)return a
else return b}}
A.rb.prototype={
gp(a){var s=this,r=s.w.x
r===$&&A.f()
if(r<s.x){r=s.a
r=r.gp(r)}else{r=s.b
r=r.gp(r)}return r}}
A.GH.prototype={}
A.GI.prototype={}
A.lc.prototype={
gt(a){var s=this
return A.J(s.gcE(),s.gbP(s),s.glf(),s.glm(),s.gjV(),s.f,s.r,s.w,s.x,s.y,s.gcq(s),s.Q,s.gf_(),s.at,s.ax,s.ay,s.ch,s.CW,s.glc(),A.J(s.gld(),s.db,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a))},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.lc&&J.e(b.gcE(),s.gcE())&&J.e(b.gbP(b),s.gbP(s))&&J.e(b.glf(),s.glf())&&J.e(b.glm(),s.glm())&&J.e(b.gjV(),s.gjV())&&b.f==s.f&&b.r==s.r&&b.w==s.w&&b.x==s.x&&b.y==s.y&&J.e(b.gcq(b),s.gcq(s))&&b.Q==s.Q&&b.gf_()==s.gf_()&&J.e(b.at,s.at)&&J.e(b.ax,s.ax)&&J.e(b.ay,s.ay)&&J.e(b.ch,s.ch)&&b.CW==s.CW&&J.e(b.glc(),s.glc())&&J.e(b.gld(),s.gld())&&!0},
gcE(){return this.a},
gbP(a){return this.b},
glf(){return this.c},
glm(){return this.d},
gjV(){return this.e},
gcq(a){return this.z},
gf_(){return this.as},
glc(){return this.cx},
gld(){return this.cy}}
A.CB.prototype={}
A.x4.prototype={
L(a){var s,r=this,q=null,p=A.b4(a),o=p.z.t6(B.tW),n=r.c,m=n==null?A.a4x(a).a:n
if(m==null)m=24
s=A.a5U(new A.dI(o,new A.fs(B.aF,A.lX(new A.hG(B.a3,q,q,A.oy(r.w,new A.c_(m,q,q,q,q,r.z,q,q)),q),m,m),q),q),r.cx)
n=Math.max(35,(m+Math.min(B.aF.gBl(),B.aF.gc4(B.aF)+B.aF.gcg(B.aF)))*0.7)
return A.cZ(!0,A.abW(!1,q,!0,s,!1,q,!0,!1,p.cx,q,p.cy,B.tZ,p.dx,q,B.iR,q,q,q,q,q,r.ax,q,q,q,q,n,p.k3,q,q),!1,!0,!1,q,q,q,q,q,q,q,q,q,q,q,q,q,q)}}
A.ox.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.ox&&J.e(b.a,this.a)}}
A.CU.prototype={}
A.i0.prototype={
Jc(a){var s
if(a===B.y&&!this.CW){s=this.ch
s===$&&A.f()
s.m()
this.hG()}},
m(){var s=this.ch
s===$&&A.f()
s.m()
this.hG()},
yc(a,b,c){var s,r,q=this
a.cp(0)
s=q.as
if(s!=null)a.eM(0,s.e1(b,q.ax))
switch(q.y.a){case 1:s=b.gaK()
r=q.z
a.h8(s,r==null?35:r,c)
break
case 0:s=q.Q
if(!s.j(0,B.V))a.cl(A.Qo(b,s.c,s.d,s.a,s.b),c)
else a.bS(b,c)
break}a.co(0)},
uf(a,b){var s,r,q,p=this,o=$.ak().b9(),n=p.e,m=p.ay
m===$&&A.f()
s=m.a
o.sad(0,A.b7(m.b.a6(0,s.gp(s)),n.gp(n)>>>16&255,n.gp(n)>>>8&255,n.gp(n)&255))
r=A.a1Q(b)
n=p.at
if(n!=null)q=n.$0()
else{n=p.b.k3
q=new A.B(0,0,0+n.a,0+n.b)}if(r==null){a.cp(0)
a.a6(0,b.a)
p.yc(a,q,o)
a.co(0)}else p.yc(a,q.cO(r),o)}}
A.a_C.prototype={
$0(){var s=this.a.k3
return new A.B(0,0,0+s.a,0+s.b)},
$S:86}
A.Y3.prototype={
An(a,b,c,d,e,f,g,a0,a1,a2,a3,a4){var s,r,q,p,o,n,m,l,k,j,i,h=null
if(a1==null){if(a2!=null){s=a2.$0()
r=new A.S(s.c-s.a,s.d-s.b)}else{s=a3.k3
s.toString
r=s}s=Math.max(r.A2(0,B.h).gbR(),new A.z(0+r.a,0).W(0,new A.z(0,0+r.b)).gbR())/2}else s=a1
q=new A.oD(a0,B.V,f,s,A.agb(a3,d,a2),a4,c,e,a3,g)
p=e.u
o=A.dr(h,B.dY,h,h,p)
n=e.gdg()
o.b2()
m=o.bL$
m.b=!0
m.a.push(n)
o.cc(0)
q.cx=o
m=c.gp(c)
l=t.m
k=t.xD
q.CW=new A.aG(l.a(o),new A.i2(0,m>>>24&255),k.h("aG<ai.T>"))
m=A.dr(h,B.cq,h,h,p)
m.b2()
o=m.bL$
o.b=!0
o.a.push(n)
m.cc(0)
q.ch=m
o=t.a7
j=$.a8e()
i=o.h("eO<ai.T>")
q.ay=new A.aG(l.a(m),new A.eO(j,new A.ax(s*0.3,s+5,o),i),i.h("aG<ai.T>"))
p=A.dr(h,B.kf,h,h,p)
p.b2()
i=p.bL$
i.b=!0
i.a.push(n)
p.b2()
n=p.bx$
n.b=!0
n.a.push(q.gKL())
q.db=p
n=c.gp(c)
i=$.a8f()
k=k.h("eO<ai.T>")
q.cy=new A.aG(l.a(p),new A.eO(i,new A.i2(n>>>24&255,0),k),k.h("aG<ai.T>"))
e.rv(q)
return q}}
A.oD.prototype={
rN(a){var s=this.ch
s===$&&A.f()
s.e=B.w6
s.cc(0)
s=this.cx
s===$&&A.f()
s.cc(0)
s=this.db
s===$&&A.f()
s.z=B.a9
s.kb(1,B.a5,B.kf)},
b4(a){var s,r=this,q=r.cx
q===$&&A.f()
q.hF(0)
q=r.cx.x
q===$&&A.f()
s=1-q
q=r.db
q===$&&A.f()
q.sp(0,s)
if(s<1){q=r.db
q.z=B.a9
q.kb(1,B.a5,B.dY)}},
KM(a){if(a===B.B)this.m()},
m(){var s=this,r=s.ch
r===$&&A.f()
r.m()
r=s.cx
r===$&&A.f()
r.m()
r=s.db
r===$&&A.f()
r.m()
s.hG()},
uf(a,b){var s,r,q,p,o=this,n=o.cx
n===$&&A.f()
n=n.r
if(n!=null&&n.a!=null){n=o.CW
n===$&&A.f()
s=n.a
r=n.b.a6(0,s.gp(s))}else{n=o.cy
n===$&&A.f()
s=n.a
r=n.b.a6(0,s.gp(s))}q=$.ak().b9()
n=o.e
q.sad(0,A.b7(r,n.gp(n)>>>16&255,n.gp(n)>>>8&255,n.gp(n)&255))
n=o.b.k3.eK(B.h)
s=o.ch
s===$&&A.f()
s=s.x
s===$&&A.f()
s=A.y2(o.y,n,B.b2.a6(0,s))
s.toString
n=o.ay
n===$&&A.f()
p=n.a
o.C0(o.z,a,s,o.at,o.Q,q,n.b.a6(0,p.gp(p)),o.ax,b)}}
A.a_D.prototype={
$0(){var s=this.a.k3
return new A.B(0,0,0+s.a,0+s.b)},
$S:86}
A.Y4.prototype={
An(a,b,c,d,e,f,g,h,i,j,k,a0){var s,r,q=null,p=i==null?A.agf(k,d,j,h):i,o=new A.oE(h,B.V,f,p,A.agc(k,d,j),!d,a0,c,e,k,g),n=e.u,m=A.dr(q,B.cq,q,q,n),l=e.gdg()
m.b2()
s=m.bL$
s.b=!0
s.a.push(l)
m.cc(0)
o.CW=m
s=t.a7
r=t.m
o.ch=new A.aG(r.a(m),new A.ax(0,p,s),s.h("aG<ai.T>"))
n=A.dr(q,B.aj,q,q,n)
n.b2()
s=n.bL$
s.b=!0
s.a.push(l)
n.b2()
l=n.bx$
l.b=!0
l.a.push(o.gKN())
o.cy=n
l=c.gp(c)
o.cx=new A.aG(r.a(n),new A.i2(l>>>24&255,0),t.xD.h("aG<ai.T>"))
e.rv(o)
return o}}
A.oE.prototype={
rN(a){var s=B.d.cD(this.as/1),r=this.CW
r===$&&A.f()
r.e=A.cq(0,s)
r.cc(0)
this.cy.cc(0)},
b4(a){var s=this.cy
if(s!=null)s.cc(0)},
KO(a){if(a===B.B)this.m()},
m(){var s=this,r=s.CW
r===$&&A.f()
r.m()
s.cy.m()
s.cy=null
s.hG()},
uf(a,b){var s,r,q=this,p=$.ak().b9(),o=q.e,n=q.cx
n===$&&A.f()
s=n.a
p.sad(0,A.b7(n.b.a6(0,s.gp(s)),o.gp(o)>>>16&255,o.gp(o)>>>8&255,o.gp(o)&255))
r=q.y
if(q.ax){o=q.b.k3.eK(B.h)
n=q.CW
n===$&&A.f()
n=n.x
n===$&&A.f()
r=A.y2(r,o,n)}r.toString
o=q.ch
o===$&&A.f()
n=o.a
q.C0(q.z,a,r,q.at,q.Q,p,o.b.a6(0,n.gp(n)),q.ay,b)}}
A.i3.prototype={
rN(a){},
b4(a){},
sad(a,b){if(b.j(0,this.e))return
this.e=b
this.a.aa()},
C0(a,b,c,d,e,f,g,h,i){var s,r=A.a1Q(i)
b.cp(0)
if(r==null)b.a6(0,i.a)
else b.aA(0,r.a,r.b)
if(d!=null){s=d.$0()
if(e!=null)b.eM(0,e.e1(s,h))
else if(!a.j(0,B.V))b.j_(A.Qo(s,a.c,a.d,a.a,a.b))
else b.j0(s)}b.h8(c,g,f)
b.co(0)}}
A.lo.prototype={}
A.t8.prototype={
bw(a){return this.f!==a.f}}
A.ln.prototype={
Dk(a){return null},
L(a){var s=this,r=a.a_(t.AD),q=r==null?null:r.f
return new A.rF(s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,s.ay,s.ch,s.CW,s.cx,s.cy,s.db,s.dx,s.dy,s.fr,!1,s.fy,!1,s.id,s.k1,q,s.gDj(),s.gP5(),s.k2,null)},
P6(a){return!0}}
A.rF.prototype={
ak(){return new A.rE(A.y(t.uR,t.z6),new A.b3(A.b([],t.hL),t.fR),null,B.m)}}
A.iF.prototype={
E(){return"_HighlightType."+this.b}}
A.rE.prototype={
gQS(){var s=this.r
s=s.gaF(s)
s=new A.aV(s,new A.Y1(),A.t(s).h("aV<p.E>"))
return!s.gK(s)},
tK(a,b){var s,r=this.y,q=r.a,p=q.length
if(b){r.b=!0
q.push(a)}else r.A(0,a)
s=q.length!==0
if(s!==(p!==0)){r=this.a.k2
if(r!=null)r.tK(this,s)}},
vt(a){var s=this.c
s.toString
this.MX(s)
this.Bc()},
DV(){return this.vt(null)},
tq(){this.ai(new A.Y0())},
gbY(){var s=this.a.ok
if(s==null){s=this.x
s.toString}return s},
lp(){var s,r,q=this
if(q.a.ok==null)q.x=A.a4Q(null)
s=q.gbY()
r=q.a
r.toString
s.ew(0,B.ad,!q.dX(r))
q.gbY().Y(0,q.gia())},
aN(){this.Gv()
this.lp()
$.b1.a0$.f.d.F(0,this.gB9())},
aV(a){var s,r,q,p,o=this
o.bu(a)
s=a.ok
if(o.a.ok!=s){if(s!=null)s.I(0,o.gia())
if(o.a.ok!=null){s=o.x
if(s!=null)s.m()
o.x=null}o.lp()}if(J.e(o.a.ch,a.ch)){s=o.a
if(s.ax==a.ax)s=s.at!==a.at
else s=!0}else s=!0
if(s){s=o.r
r=s.i(0,B.ch)
if(r!=null){q=r.ch
q===$&&A.f()
q.m()
r.hG()
o.uP(B.ch,!1,o.f)}p=s.i(0,B.tp)
if(p!=null){s=p.ch
s===$&&A.f()
s.m()
p.hG()}}s=o.a
s.toString
if(o.dX(s)!==o.dX(a)){s=o.gbY()
q=o.a
q.toString
s.ew(0,B.ad,!o.dX(q))
s=o.a
s.toString
if(!o.dX(s))o.gbY().ew(0,B.ao,!1)
o.uP(B.ch,!1,o.f)}o.uO()},
m(){var s,r=this
$.b1.a0$.f.d.A(0,r.gB9())
r.gbY().I(0,r.gia())
s=r.x
if(s!=null)s.m()
r.aR()},
guU(){if(!this.gQS()){var s=this.d
s=s!=null&&s.a!==0}else s=!0
return s},
Dd(a){switch(a.a){case 0:return B.aj
case 1:case 2:return B.w8}},
uP(a,b,c){var s,r,q,p,o,n,m,l,k,j,i=this,h=null,g=i.r,f=g.i(0,a),e=a.a
switch(e){case 0:i.gbY().ew(0,B.ao,c)
break
case 1:if(b)i.gbY().ew(0,B.bV,c)
break
case 2:break}if(a===B.dq){s=i.a.k2
if(s!=null)s.tK(i,c)}s=f==null
if(c===(!s&&f.CW))return
if(c)if(s){s=i.a.db
if(s==null)r=h
else{q=i.gbY().a
r=s.a.$1(q)}if(r==null){s=i.c
s.toString
p=A.b4(s)
switch(e){case 0:r=i.a.cy
if(r==null)r=p.cy
break
case 2:r=i.a.CW
if(r==null)r=p.cx
break
case 1:r=i.a.cx
if(r==null)r=p.dx
break}}s=i.c.gau()
s.toString
t.BS.a(s)
q=i.c.ti(t.xT)
q.toString
o=i.a
n=o.at
m=o.ax
l=o.ch
o=o.k3.$1(s)
k=i.c.a_(t.I)
k.toString
j=i.Dd(a)
s=new A.i0(n,m,B.V,l,o,k.w,r,q,s,new A.Y2(i,a))
j=A.dr(h,j,h,h,q.u)
j.b2()
o=j.bL$
o.b=!0
o.a.push(q.gdg())
j.b2()
o=j.bx$
o.b=!0
o.a.push(s.gJb())
j.cc(0)
s.ch=j
o=s.e
o=o.gp(o)
s.ay=new A.aG(t.m.a(j),new A.i2(0,o>>>24&255),t.xD.h("aG<ai.T>"))
q.rv(s)
g.l(0,a,s)
i.oJ()}else{f.CW=!0
g=f.ch
g===$&&A.f()
g.cc(0)}else{f.CW=!1
g=f.ch
g===$&&A.f()
g.jD(0)}switch(e){case 0:g=i.a.y
if(g!=null)g.$1(c)
break
case 1:if(b){g=i.a.z
if(g!=null)g.$1(c)}break
case 2:break}},
jH(a,b){return this.uP(a,!0,b)},
I1(a){var s,r,q,p,o,n,m,l,k,j,i=this,h={},g=i.c.ti(t.xT)
g.toString
s=i.c.gau()
s.toString
t.BS.a(s)
r=s.Dp(a)
q=i.a.db
if(q==null)q=null
else{p=i.gbY().a
p=q.a.$1(p)
q=p}o=q==null?i.a.dx:q
if(o==null){q=i.c
q.toString
o=A.b4(q).k3}q=i.a
n=q.as?q.k3.$1(s):null
q=i.a
m=q.ay
l=q.ch
h.a=null
q=q.dy
if(q==null){q=i.c
q.toString
q=A.b4(q).x}p=i.a
k=p.as
p=p.ax
j=i.c.a_(t.I)
j.toString
return h.a=q.An(0,m,o,k,g,l,new A.XY(h,i),r,p,n,s,j.w)},
Qc(a){if(this.c==null)return
this.ai(new A.Y_(this))},
gMN(){var s,r=this,q=r.c
q.toString
q=A.d7(q)
s=q==null?null:q.ax
switch((s==null?B.eH:s).a){case 0:q=r.a
q.toString
return r.dX(q)&&r.z
case 1:return r.z}},
uO(){var s,r=$.b1.a0$.f.b
switch((r==null?A.wL():r).a){case 0:s=!1
break
case 1:s=this.gMN()
break
default:s=null}this.jH(B.tp,s)},
Qe(a){var s,r=this
r.z=a
r.gbY().ew(0,B.bW,a)
r.uO()
s=r.a.fy
if(s!=null)s.$1(a)},
QG(a){if(this.y.a.length!==0)return
this.MY(a)
this.a.toString},
QI(a){this.a.toString},
yZ(a,b){var s,r,q,p,o=this
if(a!=null){s=a.gau()
s.toString
t.BS.a(s)
r=s.k3
r=new A.B(0,0,0+r.a,0+r.b).gaK()
q=A.fk(s.e2(0,null),r)}else q=b.a
o.gbY().ew(0,B.ao,!0)
p=o.I1(q)
s=o.d;(s==null?o.d=A.cW(t.nv):s).F(0,p)
s=o.e
if(s!=null)s.b4(0)
o.e=p
o.oJ()
o.jH(B.dq,!0)},
MY(a){return this.yZ(null,a)},
MX(a){return this.yZ(a,null)},
Bc(){var s=this,r=s.e
if(r!=null)r.rN(0)
s.e=null
s.jH(B.dq,!1)
r=s.a
if(r.fr){r=s.c
r.toString
A.M6(r)}s.a.d.$0()},
QE(){var s=this,r=s.e
if(r!=null)r.b4(0)
s.e=null
s.a.toString
s.jH(B.dq,!1)},
cA(){var s,r,q,p,o,n,m,l=this,k=l.d
if(k!=null){l.d=null
for(k=new A.ks(k,k.mk()),s=A.t(k).c;k.q();){r=k.d;(r==null?s.a(r):r).m()}l.e=null}for(k=l.r,s=A.ia(k,k.r);s.q();){r=s.d
q=k.i(0,r)
if(q!=null){p=q.ch
p===$&&A.f()
p.r.m()
p.r=null
o=p.bx$
o.b=!1
B.b.M(o.a)
n=o.c
if(n===$){m=A.cW(o.$ti.c)
o.c!==$&&A.b2()
o.c=m
n=m}if(n.a>0){n.b=n.c=n.d=n.e=null
n.a=0}o=p.bL$
o.b=!1
B.b.M(o.a)
n=o.c
if(n===$){m=A.cW(o.$ti.c)
o.c!==$&&A.b2()
o.c=m
n=m}if(n.a>0){n.b=n.c=n.d=n.e=null
n.a=0}p.pl()
q.hG()}k.l(0,r,null)}k=l.a.k2
if(k!=null)k.tK(l,!1)
l.Gu()},
dX(a){return!0},
Qn(a){var s,r=this
r.f=!0
s=r.a
s.toString
if(r.dX(s))r.jH(B.ch,r.f)},
Qp(a){this.f=!1
this.jH(B.ch,!1)},
gHr(){var s,r=this,q=r.c
q.toString
q=A.d7(q)
s=q==null?null:q.ax
switch((s==null?B.eH:s).a){case 0:q=r.a
q.toString
return r.dX(q)&&r.a.k1
case 1:return!0}},
L(a){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=null
h.Ea(a)
s=new A.XZ(h,a)
for(r=h.r,q=A.ia(r,r.r);q.q();){p=q.d
o=r.i(0,p)
if(o!=null)o.sad(0,s.$1(p))}r=h.e
if(r!=null){q=h.a.db
if(q==null)q=g
else{p=h.gbY().a
p=q.a.$1(p)
q=p}if(q==null)q=h.a.dx
r.sad(0,q==null?A.b4(a).k3:q)}r=h.a.Q
if(r==null)r=B.jQ
n=A.jD(r,h.gbY().a,t.oR)
m=h.w
if(m===$){r=h.gvs()
q=t.B8
p=t.dc
l=A.aM([B.GF,new A.j4(r,new A.b3(A.b([],q),p),t.ei),B.GG,new A.j4(r,new A.b3(A.b([],q),p),t.wV)],t.n,t.nT)
h.w!==$&&A.b2()
h.w=l
m=l}r=h.a.id
q=h.gHr()
p=h.a
p.toString
p=h.dX(p)?h.gQF():g
o=h.a
o.toString
o=h.dX(o)?h.gQH():g
k=h.a
k.toString
k=h.dX(k)?h.gQC():g
j=h.a
j.toString
j=h.dX(j)?h.gQD():g
i=h.a
return new A.t8(h,A.HW(m,A.wK(!1,q,A.P_(A.cZ(g,A.a1B(B.a6,i.c,B.b4,!0,g,g,g,g,g,g,g,g,g,g,k,j,p,o,g,g,g),!1,g,!1,g,g,g,g,g,g,g,g,h.gvs(),g,g,g,g,g),n,h.gQm(),h.gQo()),g,g,g,r,!0,g,h.gQd(),g,g,g,g)),g)},
$ia2y:1}
A.Y1.prototype={
$1(a){return a!=null},
$S:166}
A.Y0.prototype={
$0(){},
$S:0}
A.Y2.prototype={
$0(){var s=this.a
s.r.l(0,this.b,null)
s.oJ()},
$S:0}
A.XY.prototype={
$0(){var s,r=this.b,q=r.d
if(q!=null){s=this.a
q.A(0,s.a)
if(r.e==s.a)r.e=null
r.oJ()}},
$S:0}
A.Y_.prototype={
$0(){this.a.uO()},
$S:0}
A.XZ.prototype={
$1(a){var s,r,q=this,p=A.b4(q.b)
switch(a.a){case 0:s=q.a
r=s.a.db
r=r==null?null:r.a.$1(B.C_)
s=r==null?s.a.cy:r
return s==null?p.cy:s
case 2:s=q.a
r=s.a.db
r=r==null?null:r.a.$1(B.BY)
s=r==null?s.a.CW:r
return s==null?p.cx:s
case 1:s=q.a
r=s.a.db
r=r==null?null:r.a.$1(B.BX)
s=r==null?s.a.cx:r
return s==null?p.dx:s}},
$S:167}
A.x8.prototype={}
A.ud.prototype={
aN(){this.b6()
if(this.guU())this.qa()},
cA(){var s=this.i5$
if(s!=null){s.bf()
s.fS()
this.i5$=null}this.mg()}}
A.Mh.prototype={
E(){return"FloatingLabelBehavior."+this.b}}
A.wG.prototype={
gt(a){return B.f.gt(-1)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.wG&&!0},
k(a){return A.abB(-1)}}
A.x9.prototype={
gt(a){var s=null
return A.J(s,s,s,s,s,s,s,B.wq,B.dM,!1,s,!1,s,s,s,s,s,s,!1,A.J(s,s,s,s,s,s,s,s,s,s,s,!1,s,B.a,B.a,B.a,B.a,B.a,B.a,B.a))},
j(a,b){var s
if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
if(b instanceof A.x9)if(B.dM.j(0,B.dM))s=!0
else s=!1
else s=!1
return s}}
A.D_.prototype={}
A.oY.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.oY)if(J.e(b.b,r.b))if(b.c==r.c)if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(J.e(b.f,r.f))if(J.e(b.r,r.r))if(J.e(b.w,r.w))if(J.e(b.x,r.x))if(b.y==r.y)if(b.z==r.z)if(b.Q==r.Q)s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Di.prototype={}
A.ih.prototype={
E(){return"MaterialType."+this.b}}
A.p4.prototype={
ak(){return new A.Do(new A.c5("ink renderer",t.DU),null,null,B.m)}}
A.Do.prototype={
L(a){var s,r,q,p,o,n,m,l=this,k=null,j=A.b4(a),i=A.b4(a),h=l.a,g=h.f
if(g==null)switch(h.d.a){case 0:g=i.as
break
case 1:g=i.at
break
case 3:case 2:case 4:break}s=h.r
if(s==null)s=j.k2
r=h.e
q=h.c
p=h.x
if(p==null){h=A.b4(a).p3.z
h.toString}else h=p
p=l.a
q=new A.n8(q,h,B.a5,p.as,k,k)
h=p
p=h.d
q=new A.fn(new A.Ys(l),new A.CZ(g,l,p!==B.cV,q,l.d),k,t.am)
if(p===B.cU&&h.y==null&&!0){A.b4(a)
g.toString
g=A.a4h(a,g,l.a.e)
h=l.a
p=h.as
return new A.n9(q,B.b_,h.Q,r,g,!1,s,B.by,p,k,k)}o=l.J6()
h=l.a
if(h.d===B.cV)return A.aax(new A.ts(q,o,!0,k),h.Q,new A.k3(o,A.du(a)))
p=h.as
n=h.Q
m=h.e
g.toString
return new A.rR(q,o,!0,n,m,g,s,h.w,B.by,p,k,k)},
J6(){var s=this.a,r=s.y
if(r!=null)return r
s=s.d
switch(s.a){case 0:case 4:return B.B9
case 1:case 3:s=B.Ao.i(0,s)
s.toString
return new A.cj(s,B.o)
case 2:return B.jT}}}
A.Ys.prototype={
$1(a){var s,r=$.b1.a0$.z.i(0,this.a.d).gau()
r.toString
t.xT.a(r)
s=r.by
if(s!=null&&J.kK(s))r.aa()
return!1},
$S:168}
A.td.prototype={
rv(a){var s=this.by
J.iY(s==null?this.by=A.b([],t.pW):s,a)
this.aa()},
hs(a){return this.a9},
aJ(a,b){var s,r=this,q=r.by
if(q!=null&&J.kK(q)){s=a.gb7(a)
s.cp(0)
s.aA(0,b.a,b.b)
q=r.k3
s.j0(new A.B(0,0,0+q.a,0+q.b))
q=r.by
q.toString
q=J.an(q)
for(;q.q();)q.gC(q).LI(s)
s.co(0)}r.fm(a,b)}}
A.CZ.prototype={
aj(a){var s=new A.td(this.f,this.r,null,A.aj())
s.am()
s.saC(null)
return s},
av(a,b){b.a9=this.r}}
A.h5.prototype={
m(){var s=this.a,r=s.by
r.toString
J.hF(r,this)
s.aa()
this.c.$0()},
LI(a){var s,r,q,p,o,n,m=this.b,l=A.b([m],t.By)
for(s=this.a,r=t.d;m!==s;m=q){q=m.c
q.toString
r.a(q)
if(!q.uh(m))return
l.push(q)}p=new A.aT(new Float64Array(16))
p.cM()
for(o=l.length-1;o>0;o=n){n=o-1
l[o].eh(l[n],p)}this.uf(a,p)},
k(a){return"<optimized out>#"+A.bW(this)}}
A.k4.prototype={
cI(a){return A.cm(this.a,this.b,a)}}
A.rR.prototype={
ak(){return new A.Dm(null,null,B.m)}}
A.Dm.prototype={
lg(a){var s,r,q=this
q.CW=t.nr.a(a.$3(q.CW,q.a.z,new A.Yo()))
s=q.a
r=t.mo
s=r.a(a.$3(q.cy,s.as,new A.Yp()))
q.cy=s
s=q.a.at
q.cx=s!=null?r.a(a.$3(q.cx,s,new A.Yq())):null
q.db=t.EE.a(a.$3(q.db,q.a.w,new A.Yr()))},
L(a){var s,r,q,p,o,n=this,m=n.db
m.toString
s=n.ge8()
s=m.a6(0,s.gp(s))
s.toString
m=n.CW
m.toString
r=n.ge8()
q=m.a6(0,r.gp(r))
A.b4(a)
p=A.a4h(a,n.a.Q,q)
n.a.toString
m=n.cy
if(m==null)o=null
else{r=n.ge8()
r=m.a6(0,r.gp(r))
o=r}if(o==null)o=B.aE
m=A.du(a)
r=n.a
return new A.yz(new A.k3(s,m),r.y,q,p,o,new A.ts(r.r,s,!0,null),null)}}
A.Yo.prototype={
$1(a){return new A.ax(A.a_k(a),null,t.a7)},
$S:72}
A.Yp.prototype={
$1(a){return new A.f0(t.iO.a(a),null)},
$S:28}
A.Yq.prototype={
$1(a){return new A.f0(t.iO.a(a),null)},
$S:28}
A.Yr.prototype={
$1(a){return new A.k4(t.mD.a(a),null)},
$S:171}
A.ts.prototype={
L(a){var s=A.du(a)
return A.a40(this.c,new A.Fi(this.d,s,null),null,B.A)}}
A.Fi.prototype={
aJ(a,b){this.b.f9(a,new A.B(0,0,0+b.a,0+b.b),this.c)},
ix(a){return!a.b.j(0,this.b)}}
A.GM.prototype={
bZ(){this.eA()
this.dt()
this.h2()},
m(){var s=this,r=s.aL$
if(r!=null)r.I(0,s.gfq())
s.aL$=null
s.aR()}}
A.Dn.prototype={
tC(a){return a.gjr(a)==="en"},
cK(a,b){return new A.bp(B.u8,t.zU)},
pe(a){return!1},
k(a){return"DefaultMaterialLocalizations.delegate(en_US)"}}
A.vC.prototype={$ip7:1}
A.dh.prototype={
E(){return"MaterialState."+this.b}}
A.xy.prototype={
nq(a){return this.T(A.bb(t.BD)).nq(a)},
$ib_:1}
A.Cs.prototype={
T(a){if(a.B(0,B.ad))return B.dg
return B.iR},
gkU(){return"MaterialStateMouseCursor(clickable)"}}
A.b_.prototype={}
A.rG.prototype={
T(a){var s,r=this,q=r.a,p=q==null?null:q.T(a)
q=r.b
s=q==null?null:q.T(a)
return r.d.$3(p,s,r.c)},
$ib_:1}
A.rT.prototype={
T(a){return this.a.$1(a)},
$ib_:1}
A.cX.prototype={
T(a){return this.a},
k(a){var s="MaterialStatePropertyAll(",r=this.a
if(typeof r=="number")return s+A.eS(r)+")"
else return s+A.h(r)+")"},
$ib_:1}
A.xz.prototype={
ew(a,b,c){var s=this.a
if(c?J.iY(s,b):J.hF(s,b))this.bf()}}
A.xx.prototype={
CR(a,b){return new A.OH(this,a,b)},
CQ(a){return this.CR(a,null)},
NL(a){if(this.jc$.F(0,a))this.ai(new A.OF())},
ox(a){if(this.jc$.A(0,a))this.ai(new A.OG())}}
A.OH.prototype={
$1(a){var s=this.a,r=this.b
if(s.jc$.B(0,r)===a)return
if(a)s.NL(r)
else s.ox(r)},
$S:18}
A.OF.prototype={
$0(){},
$S:0}
A.OG.prototype={
$0(){},
$S:0}
A.xC.prototype={}
A.pa.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.pa&&J.e(b.a,this.a)}}
A.Dr.prototype={}
A.xD.prototype={
gt(a){var s=this
return A.cY([s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as])},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.xD)if(b.a==r.a)if(b.b==r.b)if(b.c==r.c)if(b.d==r.d)if(b.e==r.e)if(b.f==r.f)if(b.r==r.r)if(b.w==r.w)if(b.x===r.x)if(b.y==r.y)s=J.e(b.as,r.as)
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Dg.prototype={
T(a){var s,r=this,q=r.a,p=q==null?null:q.T(a)
q=r.b
s=q==null?null:q.T(a)
q=p==null
if(q&&s==null)return null
if(q){q=s.a.a
return A.ad(new A.cf(A.b7(0,q>>>16&255,q>>>8&255,q&255),0,B.ar,-1),s,r.c)}if(s==null){q=p.a.a
return A.ad(p,new A.cf(A.b7(0,q>>>16&255,q>>>8&255,q&255),0,B.ar,-1),r.c)}return A.ad(p,s,r.c)},
$ib_:1}
A.Ds.prototype={}
A.lz.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.lz&&J.e(b.a,this.a)}}
A.Dt.prototype={}
A.pl.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.pl&&b.a==s.a&&J.e(b.b,s.b)&&b.c==s.c&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&b.w==s.w&&b.x==s.x&&!0}}
A.DG.prototype={}
A.pm.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.pm&&b.a==s.a&&J.e(b.b,s.b)&&b.c==s.c&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&b.x==s.x&&b.y==s.y}}
A.DH.prototype={}
A.pn.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.pn&&J.e(b.a,s.a)&&b.b==s.b&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&b.r==s.r&&J.e(b.y,s.y)&&J.e(b.z,s.z)&&b.Q==s.Q&&b.as==s.as}}
A.DI.prototype={}
A.pw.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.pw&&J.e(b.a,this.a)}}
A.DV.prototype={}
A.jC.prototype={}
A.xw.prototype={}
A.rS.prototype={}
A.GD.prototype={
L(a){var s=this
return new A.l6(s.c,new A.a_c(s),new A.a_d(s),new A.l6(new A.eE(s.d,new A.b3(A.b([],t.A),t.T),0),new A.a_e(s),new A.a_f(s),s.f,null),null)}}
A.a_c.prototype={
$3(a,b,c){return new A.iM(b,c,!0,!1,null)},
$C:"$3",
$R:3,
$S:70}
A.a_d.prototype={
$3(a,b,c){return new A.iN(b,!0,!0,c,null)},
$C:"$3",
$R:3,
$S:69}
A.a_e.prototype={
$3(a,b,c){return new A.iM(b,c,!0,!0,null)},
$C:"$3",
$R:3,
$S:70}
A.a_f.prototype={
$3(a,b,c){return new A.iN(b,!0,!1,c,null)},
$C:"$3",
$R:3,
$S:69}
A.iM.prototype={
ak(){return new A.GB(new A.qC($.bN()),$,$,B.m)}}
A.GB.prototype={
guR(){return!1},
kp(){var s,r=this,q=r.a,p=q.f
if(p)s=B.bt
else{s=$.a8W()
s=new A.aG(q.c,s,A.t(s).h("aG<ai.T>"))}r.fz$=s
p=p?$.a8X():$.a8Y()
q=q.c
r.he$=new A.aG(q,p,A.t(p).h("aG<ai.T>"))
q.Y(0,r.gjw())
r.a.c.d5(r.gjv())},
aN(){var s,r,q,p,o=this
o.kp()
s=o.a
r=s.f
q=o.fz$
q===$&&A.f()
p=o.he$
p===$&&A.f()
o.d=A.a6G(s.c,q,r,p)
o.b6()},
aV(a){var s,r,q,p=this,o=p.a
if(a.f!==o.f||a.c!==o.c){o=a.c
o.I(0,p.gjw())
o.bH(p.gjv())
p.kp()
o=p.d
o===$&&A.f()
o.m()
o=p.a
s=o.f
r=p.fz$
r===$&&A.f()
q=p.he$
q===$&&A.f()
p.d=A.a6G(o.c,r,s,q)}p.bu(a)},
m(){var s,r=this
r.a.c.I(0,r.gjw())
r.a.c.bH(r.gjv())
s=r.d
s===$&&A.f()
s.m()
r.aR()},
L(a){var s=this.d
s===$&&A.f()
return A.a5E(!0,this.a.d,this.jd$,B.rX,s)}}
A.iN.prototype={
ak(){return new A.GC(new A.qC($.bN()),$,$,B.m)}}
A.GC.prototype={
guR(){return!1},
kp(){var s,r=this,q=r.a,p=q.e
if(p){s=$.a9_()
s=new A.aG(q.c,s,A.t(s).h("aG<ai.T>"))}else s=B.bt
r.fz$=s
p=p?$.a90():$.a91()
q=q.c
r.he$=new A.aG(q,p,A.t(p).h("aG<ai.T>"))
q.Y(0,r.gjw())
r.a.c.d5(r.gjv())},
aN(){var s,r,q,p,o=this
o.kp()
s=o.a
r=s.e
q=o.fz$
q===$&&A.f()
p=o.he$
p===$&&A.f()
o.d=A.a6H(s.c,q,r,p)
o.b6()},
aV(a){var s,r,q,p=this,o=p.a
if(a.e!==o.e||a.c!==o.c){o=a.c
o.I(0,p.gjw())
o.bH(p.gjv())
p.kp()
o=p.d
o===$&&A.f()
o.m()
o=p.a
s=o.e
r=p.fz$
r===$&&A.f()
q=p.he$
q===$&&A.f()
p.d=A.a6H(o.c,r,s,q)}p.bu(a)},
m(){var s,r=this
r.a.c.I(0,r.gjw())
r.a.c.bH(r.gjv())
s=r.d
s===$&&A.f()
s.m()
r.aR()},
L(a){var s=this.d
s===$&&A.f()
return A.a5E(!0,this.a.f,this.jd$,B.rX,s)}}
A.h9.prototype={}
A.B2.prototype={
A5(a,b,c,d,e){return new A.GD(c,d,!0,e,null)}}
A.vp.prototype={
A5(a,b,c,d,e,f){return A.aaN(a,b,c,d,e,f)}}
A.y6.prototype={
pF(a){var s=t.dM
return A.at(new A.aJ(B.xu,new A.PD(a),s),!0,s.h("bd.E"))},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
s=b instanceof A.y6
if(s&&!0)return!0
return s&&A.cR(r.pF(B.cS),r.pF(B.cS))},
gt(a){return A.cY(this.pF(B.cS))}}
A.PD.prototype={
$1(a){return this.a.i(0,a)},
$S:174}
A.u7.prototype={
S6(){var s,r=this,q=r.he$
q===$&&A.f()
s=q.a
if(J.e(q.b.a6(0,s.gp(s)),1)){q=r.fz$
q===$&&A.f()
if(!J.e(q.gp(q),0)){q=r.fz$
q=J.e(q.gp(q),1)}else q=!0}else q=!1
s=r.jd$
if(q)s.sna(!1)
else{r.guR()
s.sna(!1)}},
S5(a){switch(a.a){case 0:case 3:this.jd$.sna(!1)
break
case 1:case 2:this.guR()
this.jd$.sna(!1)
break}}}
A.u5.prototype={
qQ(a){this.bf()},
Ik(a,b,c){var s,r,q,p,o
if(!this.r){s=this.w
s=s.gap(s)!==B.B}else s=!1
if(s){s=this.w
s=$.a8Z().a6(0,s.gp(s))
s.toString
r=s}else r=0
if(r>0){s=a.gb7(a)
q=b.a
p=b.b
o=$.ak().b9()
o.sad(0,A.b7(B.d.bW(255*r),0,0,0))
s.bS(new A.B(q,p,q+c.a,p+c.b),o)}},
C_(a,b,c,d){var s,r,q=this,p=q.w
switch(p.gap(p)){case B.B:case B.y:return d.$2(a,b)
case B.a4:case B.U:break}q.Ik(a,b,c)
p=q.z
s=q.x
r=s.a
A.a7d(p,s.b.a6(0,r.gp(r)),c)
r=q.as
r.saI(0,a.ou(!0,b,p,new A.a_a(q,d),r.a))},
m(){var s=this,r=s.w,q=s.gik()
r.I(0,q)
r.bH(s.gko())
s.x.a.I(0,q)
s.y.I(0,q)
s.Q.saI(0,null)
s.as.saI(0,null)
s.fS()},
ix(a){var s,r,q,p,o=this
if(a.r===o.r){s=a.w
r=o.w
if(J.e(s.gp(s),r.gp(r))){s=a.x
r=s.a
q=o.x
p=q.a
if(J.e(s.b.a6(0,r.gp(r)),q.b.a6(0,p.gp(p)))){s=a.y
r=o.y
r=!J.e(s.gp(s),r.gp(r))
s=r}else s=!0}else s=!0}else s=!0
return s}}
A.a_a.prototype={
$2(a,b){var s=this.a,r=s.Q
s=s.y
r.saI(0,a.Cf(b,B.d.bW(s.gp(s)*255),this.b,r.a))},
$S:10}
A.u6.prototype={
qQ(a){this.bf()},
C_(a,b,c,d){var s,r,q=this,p=q.y
switch(p.gap(p)){case B.B:case B.y:return d.$2(a,b)
case B.a4:case B.U:break}p=q.z
s=q.w
r=s.a
A.a7d(p,s.b.a6(0,r.gp(r)),c)
r=q.as
r.saI(0,a.ou(!0,b,p,new A.a_b(q,d),r.a))},
ix(a){var s,r,q,p
if(a.r===this.r){s=a.x
r=this.x
if(J.e(s.gp(s),r.gp(r))){s=a.w
r=s.a
q=this.w
p=q.a
p=!J.e(s.b.a6(0,r.gp(r)),q.b.a6(0,p.gp(p)))
s=p}else s=!0}else s=!0
return s},
m(){var s,r=this
r.Q.saI(0,null)
r.as.saI(0,null)
s=r.gik()
r.w.a.I(0,s)
r.x.I(0,s)
r.y.bH(r.gko())
r.fS()}}
A.a_b.prototype={
$2(a,b){var s=this.a,r=s.Q
s=s.x
r.saI(0,a.Cf(b,B.d.bW(s.gp(s)*255),this.b,r.a))},
$S:10}
A.DY.prototype={}
A.Hm.prototype={}
A.Hn.prototype={}
A.pM.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.pM)if(J.e(b.a,r.a))if(J.e(b.b,r.b))if(b.c==r.c)if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(J.e(b.f,r.f))if(b.r==r.r)s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.EA.prototype={}
A.pO.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.pO&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&b.c==s.c&&J.e(b.d,s.d)&&J.e(b.e,s.e)}}
A.EC.prototype={}
A.pR.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.pR)if(b.b==r.b)if(b.c==r.c)if(b.d==r.d)s=!0
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.EG.prototype={}
A.dm.prototype={
E(){return"_ScaffoldSlot."+this.b}}
A.qg.prototype={
ak(){var s=null
return new A.zE(A.ev(t.yp),A.id(s,t.tT),A.id(s,t.Ew),s,s,B.m)}}
A.zE.prototype={
bi(){var s=this,r=s.c.a_(t.w).f,q=s.y
if(q===!0)if(!r.y){q=s.x
q=q!=null&&q.b==null}else q=!1
else q=!1
if(q)s.QQ(B.Cn)
s.y=r.y
s.dG()},
QQ(a){var s,r,q=this,p=null,o=q.r
if(o.b!==o.c){p.gap(p)
s=!1}else s=!0
if(s)return
r=o.gG(o).b
o=q.y
o.toString
if(o){p.sp(0,0)
r.c6(0,a)}else p.jD(0).aU(new A.RN(q,r,a),t.H)
o=q.x
if(o!=null)o.b4(0)
q.x=null},
L(a){var s,r,q=this
q.y=a.a_(t.w).f.y
s=q.r
if(!s.gK(s)){r=A.OW(a,t.X)
if(r==null||r.gic())null.gU8()}return new A.tm(q,q.a.c,null)},
m(){var s=this.x
if(s!=null)s.b4(0)
this.x=null
this.G9()}}
A.RN.prototype={
$1(a){var s=this.b
if((s.a.a&30)===0)s.c6(0,this.c)},
$S:19}
A.tm.prototype={
bw(a){return this.f!==a.f}}
A.RO.prototype={}
A.zD.prototype={
OR(a,b){var s=a==null?this.a:a
return new A.zD(s,b==null?this.b:b)}}
A.Fa.prototype={
zC(a,b,c){var s=this
s.b=c==null?s.b:c
s.c=s.c.OR(a,b)
s.bf()},
zB(a){return this.zC(null,null,a)},
Nv(a,b){return this.zC(a,b,null)}}
A.rd.prototype={
j(a,b){var s=this
if(b==null)return!1
if(!s.Eg(0,b))return!1
return b instanceof A.rd&&b.r===s.r&&b.e===s.e&&b.f===s.f},
gt(a){var s=this
return A.J(A.aC.prototype.gt.call(s,s),s.r,s.e,s.f,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.Bn.prototype={
L(a){return this.c}}
A.Zs.prototype={
oq(a7){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2=this,a3=A.a1h(a7),a4=a7.a,a5=a3.uD(a4),a6=a7.b
if(a2.b.i(0,B.ds)!=null){s=a2.cH(B.ds,a5).b
a2.cW(B.ds,B.h)
r=s}else{r=0
s=0}if(a2.b.i(0,B.j7)!=null){q=0+a2.cH(B.j7,a5).b
p=Math.max(0,a6-q)
a2.cW(B.j7,new A.z(0,p))}else{q=0
p=null}if(a2.b.i(0,B.j6)!=null){q+=a2.cH(B.j6,new A.aC(0,a5.b,0,Math.max(0,a6-q-r))).b
a2.cW(B.j6,new A.z(0,Math.max(0,a6-q)))}if(a2.b.i(0,B.dw)!=null){o=a2.cH(B.dw,a5)
a2.cW(B.dw,new A.z(0,s))
if(!a2.ay)r+=o.b}else o=B.A
n=a2.f
m=Math.max(0,a6-Math.max(n.d,q))
if(a2.b.i(0,B.dr)!=null){l=Math.max(0,m-r)
k=a2.d
if(k)l=A.T(l+q,0,a3.d-r)
k=k?q:0
a2.cH(B.dr,new A.rd(k,s,o.b,0,a5.b,0,l))
a2.cW(B.dr,new A.z(0,r))}if(a2.b.i(0,B.du)!=null){a2.cH(B.du,new A.aC(0,a5.b,0,m))
a2.cW(B.du,B.h)}k=a2.b.i(0,B.bo)!=null&&!a2.at?a2.cH(B.bo,a5):B.A
if(a2.b.i(0,B.dv)!=null){j=a2.cH(B.dv,new A.aC(0,a5.b,0,Math.max(0,m-r)))
a2.cW(B.dv,new A.z((a4-j.a)/2,m-j.b))}else j=B.A
i=A.bM("floatingActionButtonRect")
if(a2.b.i(0,B.dx)!=null){h=a2.cH(B.dx,a3)
g=new A.RO(h,j,m,n,a2.r,a7,k,a2.w)
f=a2.z.v0(g)
e=a2.as.Dg(a2.y.v0(g),f,a2.Q)
a2.cW(B.dx,e)
d=e.a
c=e.b
i.b=new A.B(d,c,d+h.a,c+h.b)}if(a2.b.i(0,B.bo)!=null){d=a2.ax
b=d!=null&&d<a4
if(k.j(0,B.A)){a=a2.cH(B.bo,b?a3:a5)
k=a}c=i.b0()
if(!new A.S(c.c-c.a,c.d-c.b).j(0,B.A)&&a2.at){a0=i.b0().b
c=a0}else{a0=a2.at?Math.min(m,a6-a2.r.d):m
c=a0}if(b){d.toString
a1=(a4-d)/2}else a1=0
a2.cW(B.bo,new A.z(a1,c-k.b))}if(a2.b.i(0,B.dt)!=null){a2.cH(B.dt,a5.uC(n.b))
a2.cW(B.dt,B.h)}if(a2.b.i(0,B.j8)!=null){a2.cH(B.j8,A.uY(a7))
a2.cW(B.j8,B.h)}if(a2.b.i(0,B.j5)!=null){a2.cH(B.j5,A.uY(a7))
a2.cW(B.j5,B.h)}a2.x.Nv(p,i.b0())},
jT(a){var s=this
return!a.f.j(0,s.f)||!a.r.j(0,s.r)||a.w!==s.w||a.Q!==s.Q||a.y!==s.y||a.z!==s.z||a.d!==s.d||!1}}
A.rv.prototype={
ak(){return new A.rw(null,null,B.m)}}
A.rw.prototype={
aN(){var s,r,q=this
q.b6()
s=A.dr(null,B.aj,null,null,q)
s.b2()
r=s.bx$
r.b=!0
r.a.push(q.gKe())
q.d=s
q.yF()
s=q.a
if(s.c!=null)s.r.sp(0,1)
else s.f.zB(0)},
m(){var s=this.d
s===$&&A.f()
s.m()
this.Gt()},
aV(a){var s,r,q,p,o,n,m,l=this
l.bu(a)
s=l.a
if(a.e!==s.e||a.d!==s.d)l.yF()
s=a.c
r=s==null
q=l.a.c
p=q==null
if(r===p){o=r?null:s.a
q=J.e(o,p?null:q.a)}else q=!1
if(q)return
q=l.d
q===$&&A.f()
o=q.Q
o===$&&A.f()
if(o===B.y){o=l.a
n=o.r
m=n.x
m===$&&A.f()
if(m===0||r){l.y=null
if(o.c!=null)n.cc(0)}else{l.y=s
q.sp(0,m)
q.jD(0)
l.a.r.sp(0,0)}}},
yF(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d=this,c=null,b=d.d
b===$&&A.f()
s=A.fY(B.cp,b,c)
b=t.a7
r=A.fY(B.cp,d.d,c)
q=A.fY(B.cp,d.a.r,c)
p=d.a
o=p.r
n=$.a8O()
m=t.m
m.a(o)
p=p.d
m.a(p)
l=t.zD.h("aG<ai.T>")
k=t.A
j=t.T
i=t.i
h=A.a64(new A.eE(new A.aG(p,new A.fX(new A.op(B.ko)),l),new A.b3(A.b([],k),j),0),new A.aG(p,new A.fX(B.ko),l),p,0.5,i)
p=d.a.d
g=$.a8S()
m.a(p)
f=$.a8T()
e=A.a64(new A.aG(p,g,g.$ti.h("aG<ai.T>")),new A.eE(new A.aG(p,f,A.t(f).h("aG<ai.T>")),new A.b3(A.b([],k),j),0),p,0.5,i)
d.e=A.a3G(h,s,i)
i=A.a3G(h,q,i)
d.r=i
d.w=new A.aG(m.a(i),new A.fX(B.wN),l)
d.f=A.a2l(new A.aG(r,new A.ax(1,1,b),b.h("aG<ai.T>")),e,c)
d.x=A.a2l(new A.aG(o,n,n.$ti.h("aG<ai.T>")),e,c)
n=d.r
o=d.gLz()
n.b2()
n=n.bL$
n.b=!0
n.a.push(o)
n=d.e
n.b2()
n=n.bL$
n.b=!0
n.a.push(o)},
Kf(a){this.ai(new A.Xm(this,a))},
L(a){var s,r,q=this,p=A.b([],t.F),o=q.d
o===$&&A.f()
o=o.Q
o===$&&A.f()
if(o!==B.y){o=q.e
o===$&&A.f()
s=q.f
s===$&&A.f()
p.push(A.a5v(A.a5q(q.y,s),o))}o=q.a
o.toString
s=q.r
s===$&&A.f()
r=q.x
r===$&&A.f()
p.push(A.a5v(A.a5q(o.c,r),s))
return A.Up(B.tx,p,B.iQ)},
LA(){var s,r,q=this.e
q===$&&A.f()
s=q.a
s=s.gp(s)
q=q.b
q=q.gp(q)
q=Math.min(A.kE(s),A.kE(q))
s=this.r
s===$&&A.f()
r=s.a
r=r.gp(r)
s=s.b
s=s.gp(s)
s=Math.max(q,Math.min(A.kE(r),A.kE(s)))
this.a.f.zB(s)}}
A.Xm.prototype={
$0(){if(this.b===B.y){var s=this.a.a
if(s.c!=null)s.r.cc(0)}},
$S:0}
A.qf.prototype={
ak(){var s=null,r=t.qb,q=t.DU,p=$.bN()
return new A.lP(new A.c5(s,r),new A.c5(s,r),new A.c5(s,q),new A.q8(!1,p),new A.q8(!1,p),A.b([],t.pc),new A.c5(s,q),B.k,s,A.y(t.wb,t.Q),s,!0,s,s,s,B.m)}}
A.lP.prototype={
gc1(){this.a.toString
return null},
im(a,b){var s=this
s.lN(s.w,"drawer_open")
s.lN(s.x,"end_drawer_open")},
Nr(){var s,r=this,q=r.y.r
if(!q.gK(q)){q=r.y.r
s=q.gG(q)}else s=null
if(r.z!=s)r.ai(new A.RQ(r,s))},
Nk(){var s,r=this,q=r.y.e
if(!q.gK(q)){q=r.y.e
s=q.gG(q)}else s=null
if(r.Q!=s)r.ai(new A.RP(r,s))},
Lc(){this.a.toString},
Kx(){var s=this.c
s.toString
A.a2_(s)},
giS(){this.a.toString
return!0},
aN(){var s,r=this,q=null
r.b6()
s=r.c
s.toString
r.dx=new A.Fa(s,B.Bg,$.bN())
r.a.toString
r.cy=B.jR
r.CW=B.v5
r.cx=B.jR
r.ch=A.dr(q,new A.aE(4e5),q,1,r)
r.db=A.dr(q,B.aj,q,q,r)},
aV(a){this.Gc(a)
this.a.toString},
bi(){var s,r,q=this,p=q.c.a_(t.Cu),o=p==null?null:p.f,n=q.y,m=n==null
if(!m)s=o==null||n!==o
else s=!1
if(s)if(!m)n.d.A(0,q)
q.y=o
if(o!=null){n=o.d
n.F(0,q)
r=q.c.jm(t.yp)
if(r==null||!n.B(0,r)){n=o.r
if(!n.gK(n))q.Nr()
n=o.e
if(!n.gK(n))q.Nk()}}q.Lc()
q.Gb()},
m(){var s=this,r=s.dx
r===$&&A.f()
r.m()
r=s.ch
r===$&&A.f()
r.m()
r=s.db
r===$&&A.f()
r.m()
r=s.y
if(r!=null)r.d.A(0,s)
s.w.m()
s.x.m()
s.Gd()},
pA(a,b,c,d,e,f,g,h,i){var s=this.c.a_(t.w).f.Cp(f,g,h,i)
if(e)s=s.SN(!0)
if(d&&s.e.d!==0)s=s.Ak(s.f.rO(s.r.d))
if(b!=null)a.push(A.Or(new A.ex(s,b,null),c))},
GW(a,b,c,d,e,f,g,h){return this.pA(a,b,c,!1,d,e,f,g,h)},
k9(a,b,c,d,e,f,g){return this.pA(a,b,c,!1,!1,d,e,f,g)},
w8(a,b,c,d,e,f,g,h){return this.pA(a,b,c,d,!1,e,f,g,h)},
wq(a,b){this.a.toString},
wp(a,b){this.a.toString},
L(a){var s,r,q,p,o,n,m,l,k,j,i=this,h=null,g={},f=a.a_(t.w).f,e=A.b4(a),d=a.a_(t.I)
d.toString
s=d.w
r=A.b([],t.fd)
d=i.a.f
i.giS()
i.GW(r,new A.Bn(new A.oP(d,i.f),!1,!1,h),B.dr,!0,!1,!1,!1,!0)
if(i.dy)i.k9(r,new A.pd(i.fr,!1,h,!0,h,h),B.du,!0,!0,!0,!0)
d=i.a
d=i.r=A.aab(a,d.e.go)+f.f.b
q=i.a.e
i.k9(r,new A.dI(new A.aC(0,1/0,0,d),new A.oo(1,d,d,d,h,q,h),h),B.ds,!0,!1,!1,!1)
g.a=!1
g.b=null
if(i.at!=null||i.as.length!==0){d=A.at(i.as,!0,t.cl)
q=i.at
if(q!=null)d.push(q.a)
p=A.Up(B.tv,d,B.iQ)
i.giS()
i.k9(r,p,B.dv,!0,!1,!1,!0)}d=i.z
if(d!=null){d.a.gTT()
g.a=!1
d=i.z
if(d!=null){d=d.a
d.gbk(d)}g.b=e.cC.w
d=i.z
d=d==null?h:d.a
i.a.toString
i.giS()
i.w8(r,d,B.bo,!1,!1,!1,!1,!0)}g.c=!1
if(i.Q!=null){a.a_(t.rg)
d=A.b4(a)
o=d.rx.f
g.c=(o==null?0:o)!==0
d=i.Q
d=d==null?h:d.a
i.a.toString
i.giS()
i.w8(r,d,B.dw,!1,!0,!1,!1,!0)}d=i.a
d.toString
q=i.ch
q===$&&A.f()
n=i.CW
n===$&&A.f()
m=i.dx
m===$&&A.f()
l=i.db
l===$&&A.f()
i.k9(r,new A.rv(d.r,q,n,m,l,h),B.dx,!0,!0,!0,!0)
switch(e.r.a){case 2:case 4:i.k9(r,A.a1B(B.a6,h,B.b4,!0,h,h,h,h,h,h,h,h,h,h,i.gKw(),h,h,h,h,h,h),B.dt,!0,!1,!1,!0)
break
case 0:case 1:case 3:case 5:break}d=i.x
q=d.y
if(q==null?A.t(d).h("bP.T").a(q):q){i.wp(r,s)
i.wq(r,s)}else{i.wq(r,s)
i.wp(r,s)}i.giS()
d=f.e.d
k=f.f.rO(d)
i.giS()
d=d!==0?0:h
j=f.r.rO(d)
if(k.d<=0)i.a.toString
i.a.toString
return new A.Fb(!1,new A.qj(A.Oz(B.aj,A.n7(i.ch,new A.RR(g,i,!1,k,j,s,r),h),B.F,e.go,0,h,h,h,h,h,B.cU),h),h)}}
A.RQ.prototype={
$0(){this.a.z=this.b},
$S:0}
A.RP.prototype={
$0(){this.a.Q=this.b},
$S:0}
A.RR.prototype={
$2(a,b){var s,r,q,p,o,n,m,l=this,k=A.aM([B.t8,new A.Cf(a,new A.b3(A.b([],t.B8),t.dc))],t.n,t.nT),j=l.b
j.a.toString
s=j.cy
s.toString
r=j.ch
r===$&&A.f()
r=r.x
r===$&&A.f()
q=j.CW
q===$&&A.f()
p=j.dx
p===$&&A.f()
j=j.cx
j.toString
o=l.a
n=o.a
m=o.c
return A.HW(k,new A.nQ(new A.Zs(l.c,!1,l.d,l.e,l.f,p,j,s,r,q,n,o.b,m),l.r,null))},
$S:176}
A.Cf.prototype={
fD(a,b){var s=this.e,r=A.qh(s).w,q=r.y
if(!(q==null?A.t(r).h("bP.T").a(q):q)){s=A.qh(s).x
r=s.y
s=r==null?A.t(s).h("bP.T").a(r):r}else s=!0
return s},
cd(a){var s=this.e
A.qh(s).a.toString
A.qh(s).a.toString}}
A.Fb.prototype={
bw(a){return this.f!==a.f}}
A.Zt.prototype={
$2(a,b){if(!a.a)a.I(0,b)},
$S:34}
A.tn.prototype={
bZ(){this.eA()
this.dt()
this.h2()},
m(){var s=this,r=s.aL$
if(r!=null)r.I(0,s.gfq())
s.aL$=null
s.aR()}}
A.to.prototype={
bZ(){this.eA()
this.dt()
this.h2()},
m(){var s=this,r=s.aL$
if(r!=null)r.I(0,s.gfq())
s.aL$=null
s.aR()}}
A.tp.prototype={
aV(a){this.bu(a)
this.ny()},
bi(){var s,r,q,p,o=this
o.dG()
s=o.b3$
r=o.glQ()
q=o.c
q.toString
q=A.qb(q)
o.eT$=q
p=o.kx(q,r)
if(r){o.im(s,o.dU$)
o.dU$=!1}if(p)if(s!=null)s.m()},
m(){var s,r=this
r.eS$.Z(0,new A.Zt())
s=r.b3$
if(s!=null)s.m()
r.b3$=null
r.Ga()}}
A.uc.prototype={
bZ(){this.eA()
this.dt()
this.h2()},
m(){var s=this,r=s.aL$
if(r!=null)r.I(0,s.gfq())
s.aL$=null
s.aR()}}
A.qn.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.qn&&b.a==s.a&&b.b==s.b&&b.c==s.c&&b.d==s.d&&b.e==s.e&&b.f==s.f&&J.e(b.r,s.r)&&b.w==s.w&&b.x==s.x&&b.y==s.y&&b.z==s.z&&b.Q==s.Q&&b.as==s.as}}
A.Fc.prototype={}
A.qo.prototype={
gt(a){return A.J(this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.qo&&J.e(b.a,this.a)&&!0}}
A.Fd.prototype={}
A.qz.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.r,s.f,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,s.ay,s.ch,s.CW,s.cx,A.J(s.cy,s.db,s.dx,s.dy,s.fr,s.fx,s.fy,s.go,s.id,s.k1,s.k2,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a))},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.qz)if(b.a==r.a)if(J.e(b.b,r.b))if(J.e(b.c,r.c))if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(J.e(b.r,r.r))if(J.e(b.f,r.f))if(J.e(b.w,r.w))if(J.e(b.x,r.x))if(J.e(b.y,r.y))if(J.e(b.z,r.z))if(J.e(b.Q,r.Q))if(J.e(b.as,r.as))if(J.e(b.at,r.at))if(J.e(b.ax,r.ax))if(J.e(b.ay,r.ay))if(J.e(b.go,r.go))if(b.id==r.id)s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Fs.prototype={}
A.qA.prototype={
E(){return"SnackBarClosedReason."+this.b}}
A.qB.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,null,s.z,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.qB)if(J.e(b.a,r.a))if(J.e(b.b,r.b))if(J.e(b.c,r.c))if(J.e(b.d,r.d))if(b.e==r.e)if(J.e(b.f,r.f))if(b.w==r.w)if(J.e(b.x,r.x))s=J.e(b.z,r.z)
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.Ft.prototype={}
A.qI.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.qI&&b.a==s.a&&b.b==s.b&&b.e==s.e&&b.f==s.f&&!0}}
A.FH.prototype={}
A.qJ.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.qJ)if(J.e(b.a,r.a))if(J.e(b.b,r.b))if(J.e(b.d,r.d))if(J.e(b.e,r.e))if(J.e(b.f,r.f))if(J.e(b.r,r.r))if(J.e(b.w,r.w))if(J.e(b.x,r.x))if(b.y==r.y)s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.FL.prototype={}
A.Ao.prototype={
Pf(a){var s,r,q,p,o,n,m,l,k=null,j=A.b4(a),i=j.ax
A.b4(a)
s=i.b
r=i.db.a
q=A.b7(97,r>>>16&255,r>>>8&255,r&255)
r=j.p3.as
p=A.agI(a)
o=new A.tK(s,q)
n=new A.tK(B.aE,B.aE)
m=new A.FO(s)
r=r==null?k:new A.cX(r,t.u5)
l=t.kq
r=A.a3U(B.a3,B.aj,n,new A.cX(0,t.sL),!0,k,o,k,k,new A.cX(B.Cl,l),new A.cX(B.Ck,l),new A.FN(B.iR,B.dg),m,new A.cX(p,t.qk),new A.cX(j.k2,t.w9),new A.cX(B.Bb,t.tz),k,B.v2,k,j.e,r,j.z)
return r},
Tc(a){var s
a.a_(t.mV)
s=A.b4(a)
return s.hk.a}}
A.tK.prototype={
T(a){if(a.B(0,B.ad))return this.b
return this.a},
k(a){return"{disabled: "+A.h(this.b)+", otherwise: "+A.h(this.a)+"}"}}
A.FO.prototype={
T(a){var s
if(a.B(0,B.bV)){s=this.a
return A.b7(10,s.gp(s)>>>16&255,s.gp(s)>>>8&255,s.gp(s)&255)}if(a.B(0,B.bW)||a.B(0,B.ao)){s=this.a
return A.b7(31,s.gp(s)>>>16&255,s.gp(s)>>>8&255,s.gp(s)&255)}return null},
k(a){var s=this.a
return"{hovered: "+A.b7(10,s.gp(s)>>>16&255,s.gp(s)>>>8&255,s.gp(s)&255).k(0)+", focused,pressed: "+A.b7(31,s.gp(s)>>>16&255,s.gp(s)>>>8&255,s.gp(s)&255).k(0)+", otherwise: null}"}}
A.FN.prototype={
T(a){if(a.B(0,B.ad))return this.b
return this.a}}
A.H3.prototype={}
A.qL.prototype={
gt(a){return J.k(this.a)},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.qL&&J.e(b.a,this.a)}}
A.FP.prototype={}
A.qR.prototype={
gt(a){return A.J(this.a,this.b,this.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.qR&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)}}
A.FQ.prototype={}
A.cP.prototype={
br(b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1=this,b2=null
if(b3==null)return b1
s=b1.a
r=s==null?b2:s.br(b3.a)
if(r==null)r=b3.a
q=b1.b
p=q==null?b2:q.br(b3.b)
if(p==null)p=b3.b
o=b1.c
n=o==null?b2:o.br(b3.c)
if(n==null)n=b3.c
m=b1.d
l=m==null?b2:m.br(b3.d)
if(l==null)l=b3.d
k=b1.e
j=k==null?b2:k.br(b3.e)
if(j==null)j=b3.e
i=b1.f
h=i==null?b2:i.br(b3.f)
if(h==null)h=b3.f
g=b1.r
f=g==null?b2:g.br(b3.r)
if(f==null)f=b3.r
e=b1.w
d=e==null?b2:e.br(b3.w)
if(d==null)d=b3.w
c=b1.x
b=c==null?b2:c.br(b3.x)
if(b==null)b=b3.x
a=b1.y
a0=a==null?b2:a.br(b3.y)
if(a0==null)a0=b3.y
a1=b1.z
a2=a1==null?b2:a1.br(b3.z)
if(a2==null)a2=b3.z
a3=b1.Q
a4=a3==null?b2:a3.br(b3.Q)
if(a4==null)a4=b3.Q
a5=b1.as
a6=a5==null?b2:a5.br(b3.as)
if(a6==null)a6=b3.as
a7=b1.at
a8=a7==null?b2:a7.br(b3.at)
if(a8==null)a8=b3.at
a9=b1.ax
b0=a9==null?b2:a9.br(b3.ax)
if(b0==null)b0=b3.ax
if(r==null)r=b2
s=r==null?s:r
r=p==null?b2:p
if(r==null)r=q
q=n==null?b2:n
if(q==null)q=o
p=l==null?m:l
o=j==null?b2:j
if(o==null)o=k
n=h==null?b2:h
if(n==null)n=i
m=f==null?b2:f
if(m==null)m=g
l=d==null?b2:d
if(l==null)l=e
k=b==null?b2:b
if(k==null)k=c
j=a0==null?b2:a0
if(j==null)j=a
i=a2==null?b2:a2
if(i==null)i=a1
h=a4==null?b2:a4
if(h==null)h=a3
g=a6==null?b2:a6
if(g==null)g=a5
f=a8==null?a7:a8
e=b0==null?b2:b0
return A.a5P(j,i,h,s,r,q,p,o,n,g,f,e==null?a9:e,m,l,k)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.cP&&J.e(s.a,b.a)&&J.e(s.b,b.b)&&J.e(s.c,b.c)&&J.e(s.d,b.d)&&J.e(s.e,b.e)&&J.e(s.f,b.f)&&J.e(s.r,b.r)&&J.e(s.w,b.w)&&J.e(s.x,b.x)&&J.e(s.y,b.y)&&J.e(s.z,b.z)&&J.e(s.Q,b.Q)&&J.e(s.as,b.as)&&J.e(s.at,b.at)&&J.e(s.ax,b.ax)},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,B.a,B.a,B.a,B.a,B.a)}}
A.FS.prototype={}
A.Ay.prototype={
L(a){var s,r,q=this.c,p=B.b3.a,o=B.b3.b,n=B.b3.c,m=B.b3.d,l=B.b3.e,k=B.b3.f,j=a.a_(t.mA)
if(j==null)j=B.kc
s=q.eo
r=s.b
if(r==null)r=j.x
s=s.a
j=s==null?j.w:s
return new A.rD(this,new A.vq(new A.OB(q,new A.xV(p,o,n,m,l,k),B.jO,p,o,n,m,l,k),A.a1D(A.a46(this.d,j,r),q.ok,null),null),null)}}
A.rD.prototype={
bw(a){return!this.w.c.j(0,a.w.c)}}
A.ke.prototype={
cI(x5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,e0,e1,e2,e3,e4,e5,e6,e7,e8,e9,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,j0,j1,j2,j3,j4,j5,j6,j7,j8,j9,k0,k1,k2,k3,k4,k5,k6,k7,k8,k9,l0,l1,l2,l3,l4,l5,l6,l7,l8,l9,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,n0,n1,n2,n3,n4,n5,n6,n7,n8,n9,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,x0,x1,x2,x3,x4=this.a
x4.toString
s=this.b
s.toString
r=x5<0.5
q=r?x4.a:s.a
p=r?x4.b:s.b
o=A.aec(x4,s,x5)
n=r?x4.d:s.d
m=r?x4.e:s.e
l=r?x4.f:s.f
k=r?x4.r:s.r
j=x4.w
i=s.w
h=t.k7
g=A.aH(j.a,i.a,x5,A.a7Z(),h)
f=A.aH(j.b,i.b,x5,A.a0S(),t.u6)
h=A.aH(j.c,i.c,x5,A.a7Z(),h)
e=j.d
d=i.d
e=r?e:d
d=j.e
c=i.e
d=r?d:c
c=j.f
b=i.f
c=r?c:b
b=A.yP(j.r,i.r,x5)
a=t.jH
a0=A.aH(j.w,i.w,x5,A.c2(),a)
a1=A.aH(j.x,i.x,x5,A.c2(),a)
a2=A.aH(j.y,i.y,x5,A.c2(),a)
a3=A.E(j.z,i.z,x5)
a4=A.E(j.Q,i.Q,x5)
j=A.E(j.as,i.as,x5)
i=r?x4.x:s.x
a5=x4.z
a6=s.z
a7=A.E(a5.a,a6.a,x5)
a7.toString
a6=A.E(a5.b,a6.b,x5)
a6.toString
a5=A.r(x4.as,s.as,x5)
a5.toString
a8=A.r(x4.at,s.at,x5)
a8.toString
a9=x4.ax
b0=s.ax
b1=r?a9.a:b0.a
b2=a9.b
b3=b0.b
b4=A.r(b2,b3,x5)
b4.toString
b5=a9.c
b6=b0.c
b7=A.r(b5,b6,x5)
b7.toString
b8=a9.d
if(b8==null)b8=b2
b9=b0.d
b8=A.r(b8,b9==null?b3:b9,x5)
b9=a9.e
if(b9==null)b9=b5
c0=b0.e
b9=A.r(b9,c0==null?b6:c0,x5)
c0=a9.f
c1=b0.f
c2=A.r(c0,c1,x5)
c2.toString
c3=a9.r
c4=b0.r
c5=A.r(c3,c4,x5)
c5.toString
c6=a9.w
if(c6==null)c6=c0
c7=b0.w
c6=A.r(c6,c7==null?c1:c7,x5)
c7=a9.x
if(c7==null)c7=c3
c8=b0.x
c7=A.r(c7,c8==null?c4:c8,x5)
c8=a9.y
c9=c8==null
d0=c9?c0:c8
d1=b0.y
d2=d1==null
d0=A.r(d0,d2?c1:d1,x5)
d3=a9.z
d4=d3==null
d5=d4?c3:d3
d6=b0.z
d7=d6==null
d5=A.r(d5,d7?c4:d6,x5)
d8=a9.Q
if(d8==null){if(c9)c8=c0}else c8=d8
c9=b0.Q
if(c9==null)c9=d2?c1:d1
c9=A.r(c8,c9,x5)
c8=a9.as
if(c8==null)c3=d4?c3:d3
else c3=c8
c8=b0.as
if(c8==null)c4=d7?c4:d6
else c4=c8
c4=A.r(c3,c4,x5)
c3=a9.at
c8=b0.at
d1=A.r(c3,c8,x5)
d1.toString
d2=a9.ax
d3=b0.ax
d4=A.r(d2,d3,x5)
d4.toString
d6=a9.ay
c3=d6==null?c3:d6
d6=b0.ay
c3=A.r(c3,d6==null?c8:d6,x5)
c8=a9.ch
if(c8==null)c8=d2
d2=b0.ch
c8=A.r(c8,d2==null?d3:d2,x5)
d2=A.r(a9.CW,b0.CW,x5)
d2.toString
d3=a9.cx
d6=b0.cx
d7=A.r(d3,d6,x5)
d7.toString
d8=a9.cy
d9=b0.cy
e0=A.r(d8,d9,x5)
e0.toString
e1=a9.db
e2=b0.db
e3=A.r(e1,e2,x5)
e3.toString
e4=a9.dx
if(e4==null)e4=d8
e5=b0.dx
e4=A.r(e4,e5==null?d9:e5,x5)
e5=a9.dy
if(e5==null)e5=e1
e6=b0.dy
e5=A.r(e5,e6==null?e2:e6,x5)
e6=a9.fr
if(e6==null)e6=d3
e7=b0.fr
e6=A.r(e6,e7==null?d6:e7,x5)
e7=a9.fx
d3=e7==null?d3:e7
e7=b0.fx
d3=A.r(d3,e7==null?d6:e7,x5)
d6=a9.fy
if(d6==null)d6=B.k
e7=b0.fy
d6=A.r(d6,e7==null?B.k:e7,x5)
e7=a9.go
if(e7==null)e7=B.k
e8=b0.go
e7=A.r(e7,e8==null?B.k:e8,x5)
e8=a9.id
e1=e8==null?e1:e8
e8=b0.id
e1=A.r(e1,e8==null?e2:e8,x5)
e2=a9.k1
d8=e2==null?d8:e2
e2=b0.k1
d8=A.r(d8,e2==null?d9:e2,x5)
d9=a9.k2
b5=d9==null?b5:d9
d9=b0.k2
b5=A.r(b5,d9==null?b6:d9,x5)
b6=a9.k4
if(b6==null)b6=b2
d9=b0.k4
b6=A.r(b6,d9==null?b3:d9,x5)
d9=a9.ok
c0=d9==null?c0:d9
d9=b0.ok
c0=A.r(c0,d9==null?c1:d9,x5)
a9=a9.k3
if(a9==null)a9=b2
b0=b0.k3
a9=A.a1j(d2,b1,d1,c3,b5,e1,d7,d4,c8,d8,b7,b9,c5,c7,e3,e5,d5,c4,e6,d3,b4,b8,b6,e7,c2,c6,c0,d6,e0,A.r(a9,b0==null?b3:b0,x5),e4,d0,c9)
b0=A.r(x4.ay,s.ay,x5)
b0.toString
b1=A.r(x4.ch,s.ch,x5)
b1.toString
b2=A.r(x4.CW,s.CW,x5)
b2.toString
b3=A.r(x4.cx,s.cx,x5)
b3.toString
b4=A.r(x4.cy,s.cy,x5)
b4.toString
b5=A.r(x4.db,s.db,x5)
b5.toString
b6=A.r(x4.dx,s.dx,x5)
b6.toString
b7=A.r(x4.dy,s.dy,x5)
b7.toString
b8=A.r(x4.fr,s.fr,x5)
b8.toString
b9=A.r(x4.fx,s.fx,x5)
b9.toString
c0=A.r(x4.fy,s.fy,x5)
c0.toString
c1=A.r(x4.go,s.go,x5)
c1.toString
c2=A.r(x4.id,s.id,x5)
c2.toString
c3=A.r(x4.k2,s.k2,x5)
c3.toString
c4=A.r(x4.k3,s.k3,x5)
c4.toString
c5=A.r(x4.k4,s.k4,x5)
c5.toString
c6=A.fc(x4.ok,s.ok,x5)
c7=A.fc(x4.p1,s.p1,x5)
c8=A.iB(x4.p2,s.p2,x5)
c9=A.iB(x4.p3,s.p3,x5)
d0=x4.p4
d1=s.p4
d2=A.iB(d0.a,d1.a,x5)
d3=A.iB(d0.b,d1.b,x5)
d4=A.iB(d0.c,d1.c,x5)
d5=A.iB(d0.d,d1.d,x5)
d1=A.iB(d0.e,d1.e,x5)
d0=x4.R8
d6=s.R8
if(r)d7=d0.a
else d7=d6.a
d8=A.r(d0.b,d6.b,x5)
d9=A.r(d0.c,d6.c,x5)
e0=A.E(d0.d,d6.d,x5)
e1=A.E(d0.e,d6.e,x5)
e2=A.r(d0.f,d6.f,x5)
e3=A.r(d0.r,d6.r,x5)
e4=A.cm(d0.w,d6.w,x5)
e5=A.fc(d0.x,d6.x,x5)
e6=A.fc(d0.y,d6.y,x5)
e7=A.iB(d0.z,d6.z,x5)
if(r)e8=d0.Q
else e8=d6.Q
e9=A.E(d0.as,d6.as,x5)
f0=A.E(d0.at,d6.at,x5)
f1=A.aN(d0.ax,d6.ax,x5)
f2=A.aN(d0.ay,d6.ay,x5)
if(r)f3=d0.ch
else f3=d6.ch
if(r)d0=d0.CW
else d0=d6.CW
f1=A.aaa(e6,d8,d0,d7,e8,e0,d9,e5,e1,e2,e4,e3,f3,e7,e9,f2,f0,f1)
f0=x4.RG
f2=s.RG
d0=A.r(f0.a,f2.a,x5)
d6=A.r(f0.b,f2.b,x5)
d7=A.E(f0.c,f2.c,x5)
d8=A.E(f0.d,f2.d,x5)
d9=A.aN(f0.e,f2.e,x5)
e0=A.cA(f0.f,f2.f,x5)
e1=A.a3F(f0.r,f2.r,x5)
e2=x4.rx
e3=s.rx
e4=A.r(e2.a,e3.a,x5)
e5=A.r(e2.b,e3.b,x5)
e6=A.r(e2.c,e3.c,x5)
e7=A.r(e2.d,e3.d,x5)
e8=A.aN(e2.e,e3.e,x5)
e9=A.E(e2.f,e3.f,x5)
f0=A.cA(e2.r,e3.r,x5)
e2=A.cA(e2.w,e3.w,x5)
e3=x4.ry
f2=s.ry
f3=A.r(e3.a,f2.a,x5)
f4=A.E(e3.b,f2.b,x5)
if(r)f5=e3.c
else f5=f2.c
f6=A.E(e3.d,f2.d,x5)
f7=A.r(e3.e,f2.e,x5)
e3=A.cA(e3.f,f2.f,x5)
f2=x4.to
f8=s.to
f9=A.r(f2.a,f8.a,x5)
g0=A.E(f2.b,f8.b,x5)
g1=A.fc(f2.c,f8.c,x5)
g2=A.fc(f2.d,f8.d,x5)
g3=A.r(f2.e,f8.e,x5)
g4=A.r(f2.f,f8.f,x5)
g5=A.aN(f2.r,f8.r,x5)
g6=A.aN(f2.w,f8.w,x5)
if(r)g7=f2.x
else g7=f8.x
if(r)g8=f2.y
else g8=f8.y
if(r)g9=f2.z
else g9=f8.z
if(r)h0=f2.Q
else h0=f8.Q
if(r)h1=f2.as
else h1=f8.as
if(r)f2=f2.at
else f2=f8.at
f8=A.aai(x4.x1,s.x1,x5)
f8.toString
h2=A.aan(x4.x2,s.x2,x5)
h2.toString
h3=r?x4.xr:s.xr
h4=x4.y1
h5=s.y1
if(r)h6=h4.a
else h6=h5.a
h7=A.r(h4.b,h5.b,x5)
h8=A.r(h4.c,h5.c,x5)
h9=A.r(h4.d,h5.d,x5)
i0=A.E(h4.e,h5.e,x5)
i1=A.cA(h4.f,h5.f,x5)
h4=A.cm(h4.r,h5.r,x5)
h5=x4.y2
i2=s.y2
if(r)i3=h5.a
else i3=i2.a
i4=A.aH(h5.b,i2.b,x5,A.c2(),a)
i5=A.aH(h5.c,i2.c,x5,A.c2(),a)
i6=A.aH(h5.d,i2.d,x5,A.c2(),a)
i7=A.E(h5.e,i2.e,x5)
if(r)i8=h5.f
else i8=i2.f
if(r)i9=h5.r
else i9=i2.r
j0=t.yX
j1=j0.a(A.cm(h5.w,i2.w,x5))
h5=A.aar(h5.x,i2.x,x5)
i2=A.aaw(x4.af,s.af,x5)
i2.toString
j2=x4.ah
j3=s.ah
j4=A.Jt(j2.a,j3.a,x5)
j5=A.aH(j2.b,j3.b,x5,A.c2(),a)
j6=A.E(j2.c,j3.c,x5)
j7=A.aN(j2.d,j3.d,x5)
j8=A.aH(j2.e,j3.e,x5,A.c2(),a)
j9=A.E(j2.f,j3.f,x5)
k0=A.aN(j2.r,j3.r,x5)
k1=A.E(j2.w,j3.w,x5)
k2=A.E(j2.x,j3.x,x5)
k3=A.E(j2.y,j3.y,x5)
j3=A.E(j2.z,j3.z,x5)
j2=x4.ac
k4=s.ac
k5=A.r(j2.a,k4.a,x5)
k6=A.E(j2.b,k4.b,x5)
k7=A.r(j2.c,k4.c,x5)
k8=A.r(j2.d,k4.d,x5)
k9=A.cm(j2.e,k4.e,x5)
l0=A.I1(j2.f,k4.f,x5)
l1=A.r(j2.y,k4.y,x5)
l2=A.aN(j2.r,k4.r,x5)
l3=A.aN(j2.w,k4.w,x5)
j2=A.cA(j2.x,k4.x,x5)
k4=x4.a3
l4=s.a3
l5=A.r(k4.a,l4.a,x5)
l6=A.E(k4.b,l4.b,x5)
l7=A.E(k4.c,l4.c,x5)
l8=A.E(k4.d,l4.d,x5)
k4=A.E(k4.e,l4.e,x5)
l4=A.abi(x4.al,s.al,x5)
l4.toString
l9=x4.bM
m0=s.bM
m1=A.aN(l9.a,m0.a,x5)
if(r)m2=l9.b
else m2=m0.b
l9=A.a1T(l9.c,m0.c,x5)
m0=A.abm(x4.ca,s.ca,x5)
m0.toString
m3=A.abv(x4.cQ,s.cQ,x5)
m3.toString
m4=A.abx(x4.eX,s.eX,x5)
m4.toString
m5=A.abA(x4.hi,s.hi,x5)
m5.toString
m6=A.abQ(x4.S,s.S,x5)
m6.toString
m7=A.acb(x4.v,s.v,x5)
m7.toString
m8=A.a1T(x4.a0.a,s.a0.a,x5)
m9=A.kY(x4.az.a,s.az.a,x5)
n0=A.a1T(x4.aq.a,s.aq.a,x5)
n1=A.acs(x4.aM,s.aM,x5)
n1.toString
n2=A.act(x4.bv,s.bv,x5)
n2.toString
n3=A.acu(x4.bU,s.bU,x5)
n3.toString
n4=A.acB(x4.c_,s.c_,x5)
n4.toString
n5=A.ad1(x4.bV,s.bV,x5)
n5.toString
n6=A.adh(x4.bd,s.bd,x5)
n6.toString
n7=x4.en
n8=s.en
if(r)n9=n7.a
else n9=n8.a
o0=A.aH(n7.b,n8.b,x5,A.c2(),a)
if(r)o1=n7.e
else o1=n8.e
o2=A.aH(n7.c,n8.c,x5,A.c2(),a)
o3=A.E(n7.d,n8.d,x5)
if(r)n7=n7.f
else n7=n8.f
n8=x4.dW
o4=s.dW
o5=A.kY(n8.a,o4.a,x5)
if(r)n8=n8.b
else n8=o4.b
o4=x4.de
o6=s.de
o7=A.E(o4.a,o6.a,x5)
o8=A.r(o4.b,o6.b,x5)
o9=A.r(o4.c,o6.c,x5)
p0=A.r(o4.d,o6.d,x5)
p1=A.r(o4.e,o6.e,x5)
p2=A.r(o4.r,o6.r,x5)
p3=A.r(o4.f,o6.f,x5)
p4=A.r(o4.w,o6.w,x5)
p5=A.r(o4.x,o6.x,x5)
p6=A.r(o4.y,o6.y,x5)
p7=A.r(o4.z,o6.z,x5)
p8=A.r(o4.Q,o6.Q,x5)
p9=A.r(o4.as,o6.as,x5)
q0=A.r(o4.at,o6.at,x5)
q1=A.r(o4.ax,o6.ax,x5)
q2=A.r(o4.ay,o6.ay,x5)
q3=r?o4.ch:o6.ch
q4=r?o4.CW:o6.CW
q5=r?o4.cx:o6.cx
q6=r?o4.cy:o6.cy
q7=r?o4.db:o6.db
q8=r?o4.dx:o6.dx
q9=r?o4.dy:o6.dy
r0=r?o4.fr:o6.fr
r1=r?o4.fx:o6.fx
r2=r?o4.fy:o6.fy
r3=A.aN(o4.go,o6.go,x5)
r4=A.E(o4.id,o6.id,x5)
r5=r?o4.k1:o6.k1
o4=r?o4.k2:o6.k2
o6=x4.cC
r6=s.cC
r7=A.r(o6.a,r6.a,x5)
r8=A.r(o6.b,r6.b,x5)
r9=A.r(o6.c,r6.c,x5)
s0=A.aN(o6.d,r6.d,x5)
s1=A.E(o6.e,r6.e,x5)
s2=A.cm(o6.f,r6.f,x5)
if(r)s3=o6.r
else s3=r6.r
s4=A.E(o6.w,r6.w,x5)
s5=A.a1r(o6.x,r6.x,x5)
o6=A.r(o6.z,r6.z,x5)
r6=x4.hj
s6=s.hj
s7=A.aH(r6.a,s6.a,x5,A.c2(),a)
s8=A.aH(r6.b,s6.b,x5,A.c2(),a)
if(r)s9=r6.c
else s9=s6.c
if(r)t0=r6.d
else t0=s6.d
t1=A.aH(r6.e,s6.e,x5,A.c2(),a)
t2=A.E(r6.f,s6.f,x5)
if(r)r6=r6.r
else r6=s6.r
s6=x4.eY
t3=s.eY
t4=A.Jt(s6.a,t3.a,x5)
t5=A.r(s6.b,t3.b,x5)
t6=r?s6.c:t3.c
t7=A.r(s6.d,t3.d,x5)
t8=A.r(s6.e,t3.e,x5)
t9=A.cA(s6.f,t3.f,x5)
u0=A.aN(s6.r,t3.r,x5)
u1=A.r(s6.w,t3.w,x5)
u2=A.aN(s6.x,t3.x,x5)
a=A.aH(s6.y,t3.y,x5,A.c2(),a)
u3=r?s6.z:t3.z
s6=r?s6.Q:t3.Q
t3=A.ae6(x4.hk,s.hk,x5)
t3.toString
u4=A.aea(x4.eo,s.eo,x5)
u4.toString
u5=x4.i6
u6=s.i6
u7=u5.ay
if(u7==null)u8=u6.ay==null
else u8=!1
if(u8)u7=null
else if(u7==null)u7=u6.ay
else{u8=u6.ay
if(!(u8==null)){u7.toString
u8.toString
u7=A.ad(u7,u8,x5)}}u8=A.r(u5.a,u6.a,x5)
u9=A.r(u5.b,u6.b,x5)
v0=A.r(u5.c,u6.c,x5)
v1=A.r(u5.d,u6.d,x5)
v2=A.r(u5.e,u6.e,x5)
v3=A.r(u5.f,u6.f,x5)
v4=A.r(u5.r,u6.r,x5)
v5=A.r(u5.w,u6.w,x5)
v6=A.r(u5.x,u6.x,x5)
v7=A.aN(u5.y,u6.y,x5)
v8=A.aN(u5.z,u6.z,x5)
v9=A.aN(u5.Q,u6.Q,x5)
w0=A.cm(u5.as,u6.as,x5)
w1=A.cm(u5.at,u6.at,x5)
j0=j0.a(A.cm(u5.ax,u6.ax,x5))
if(r)u5=u5.ch
else u5=u6.ch
u6=A.aeg(x4.je,s.je,x5)
u6.toString
w2=A.aej(x4.i7,s.i7,x5)
w2.toString
w3=x4.hl
w3.toString
w4=s.hl
w4.toString
w4=A.r(w3,w4,x5)
w3=r?x4.jf:s.jf
w5=A.iB(x4.jg,s.jg,x5)
w6=A.fc(x4.jh,s.jh,x5)
w7=x4.ji
w7.toString
w8=s.ji
w8.toString
w8=A.r(w7,w8,x5)
w7=r?x4.jj:s.jj
r=r?x4.nH:s.nH
w9=x4.N
w9.toString
x0=s.N
x0.toString
x0=A.r(w9,x0,x5)
w9=x4.k1
w9.toString
x1=s.k1
x1.toString
x1=A.r(w9,x1,x5)
w9=x4.jk
w9.toString
x2=s.jk
x2.toString
x2=A.r(w9,x2,x5)
w9=x4.u
w9.toString
x3=s.u
x3.toString
x3=A.r(w9,x3,x5)
x4=x4.Q
x4.toString
s=s.Q
s.toString
return A.a2f(w4,w3,w6,w5,r,f1,q,x3,new A.nq(d0,d6,d7,d8,d9,e0,e1),new A.p6(e4,e5,e6,e7,e8,e9,f0,e2),A.r(x4,s,x5),new A.nt(f3,f4,f5,f6,f7,e3),new A.nu(f9,g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,h0,h1,f2),f8,h2,w8,h3,a5,a8,new A.nA(h6,h7,h8,h9,i0,i1,h4),new A.nB(i3,i4,i5,i6,i7,i8,i9,j1,h5),i2,a9,p,new A.nS(j4,j5,j6,j7,j8,j9,k0,k1,k2,k3,j3),b0,new A.o_(k5,k6,k7,k8,k9,l0,l2,l3,j2,l1),b1,b2,new A.o0(l5,l6,l7,l8,k4),l4,new A.o7(m1,m2,l9),m0,x2,m3,o,m4,!0,m5,b3,b4,b5,b6,m6,c6,b7,n,m7,m,new A.xC(m8),new A.pa(m9),new A.lz(n0),n1,n2,n3,n4,l,k,n5,b8,w7,b9,c0,c7,c8,n6,new A.pR(n9,o0,o2,o3,o1,n7),c1,new A.qn(g,f,h,e,d,c,b,a0,a1,a2,a3,a4,j),c2,new A.qo(o5,n8),x1,c3,new A.qz(o7,o8,o9,p0,p1,p3,p2,p4,p5,p6,p7,p8,p9,q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,r0,r1,r2,r3,r4,r5,o4),new A.qB(r7,r8,r9,s0,s1,s2,s3,s4,s5,o6),c4,i,new A.qI(s7,s8,s9,t0,t1,t2,r6),new A.qJ(t4,t5,t6,t7,t8,t9,u0,u1,u2,a,u3,s6),t3,u4,c9,new A.qU(u8,u9,v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,w0,w1,j0,u7,u5),u6,x0,w2,new A.r0(d2,d3,d4,d5,d1),c5,!1,new A.ho(a7,a6))}}
A.na.prototype={
ak(){return new A.Ba(null,null,B.m)}}
A.Ba.prototype={
lg(a){var s=a.$3(this.CW,this.a.r,new A.Wb())
s.toString
this.CW=t.zE.a(s)},
L(a){var s,r=this.CW
r.toString
s=this.ge8()
return new A.Ay(r.a6(0,s.gp(s)),this.a.w,null)}}
A.Wb.prototype={
$1(a){return new A.ke(t.oz.a(a),null)},
$S:178}
A.jE.prototype={
E(){return"MaterialTapTargetSize."+this.b}}
A.e7.prototype={
j(a,b){var s,r,q=this
if(b==null)return!1
if(J.L(b)!==A.x(q))return!1
if(b instanceof A.e7)if(b.a===q.a)if(A.a0J(b.c,q.c))if(b.d.j(0,q.d))if(b.e===q.e)if(b.f.j(0,q.f))if(b.r===q.r)if(b.w.j(0,q.w))if(b.x===q.x)if(b.z.j(0,q.z))if(b.as.j(0,q.as))if(b.at.j(0,q.at))if(b.ax.j(0,q.ax))if(b.ay.j(0,q.ay))if(b.ch.j(0,q.ch))if(b.CW.j(0,q.CW))if(b.cx.j(0,q.cx))if(b.cy.j(0,q.cy))if(b.db.j(0,q.db))if(b.dx.j(0,q.dx))if(b.dy.j(0,q.dy))if(b.fr.j(0,q.fr))if(b.fx.j(0,q.fx))if(b.fy.j(0,q.fy))if(b.go.j(0,q.go))if(b.id.j(0,q.id))if(b.k2.j(0,q.k2))if(b.k3.j(0,q.k3))if(b.k4.j(0,q.k4))if(b.ok.j(0,q.ok))if(b.p1.j(0,q.p1))if(b.p2.j(0,q.p2))if(b.p3.j(0,q.p3))if(b.p4.j(0,q.p4))if(b.R8.j(0,q.R8))if(b.RG.j(0,q.RG))if(b.rx.j(0,q.rx))if(b.ry.j(0,q.ry))if(b.to.j(0,q.to))if(b.x1.j(0,q.x1))if(b.x2.j(0,q.x2))if(b.xr.j(0,q.xr))if(b.y1.j(0,q.y1))if(b.y2.j(0,q.y2))if(b.af.j(0,q.af))if(b.ah.j(0,q.ah))if(b.ac.j(0,q.ac))if(b.a3.j(0,q.a3))if(b.al.j(0,q.al))if(b.bM.j(0,q.bM))if(b.ca.j(0,q.ca))if(b.cQ.j(0,q.cQ))if(b.eX.j(0,q.eX))if(b.hi.j(0,q.hi))if(b.S.j(0,q.S))if(b.v.j(0,q.v))if(b.a0.j(0,q.a0))if(b.az.j(0,q.az))if(b.aq.j(0,q.aq))if(b.aM.j(0,q.aM))if(b.bv.j(0,q.bv))if(b.bU.j(0,q.bU))if(b.c_.j(0,q.c_))if(b.bV.j(0,q.bV))if(b.bd.j(0,q.bd))if(b.en.j(0,q.en))if(b.dW.j(0,q.dW))if(b.de.j(0,q.de))if(b.cC.j(0,q.cC))if(b.hj.j(0,q.hj))if(b.eY.j(0,q.eY))if(b.hk.j(0,q.hk))if(b.eo.j(0,q.eo))if(b.i6.j(0,q.i6))if(b.je.j(0,q.je))if(b.i7.j(0,q.i7)){s=b.hl
s.toString
r=q.hl
r.toString
if(s.j(0,r))if(b.jf===q.jf)if(b.jg.j(0,q.jg))if(b.jh.j(0,q.jh)){s=b.ji
s.toString
r=q.ji
r.toString
if(s.j(0,r))if(b.jj===q.jj){s=b.N
s.toString
r=q.N
r.toString
if(s.j(0,r)){s=b.k1
s.toString
r=q.k1
r.toString
if(s.j(0,r)){s=b.jk
s.toString
r=q.jk
r.toString
if(s.j(0,r)){s=b.u
s.toString
r=q.u
r.toString
if(s.j(0,r)){s=b.Q
s.toString
r=q.Q
r.toString
r=s.j(0,r)
s=r}else s=!1}else s=!1}else s=!1}else s=!1}else s=!1
else s=!1}else s=!1
else s=!1
else s=!1
else s=!1}else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s},
gt(a){var s=this,r=[s.a,s.b],q=s.c
B.b.H(r,q.gaT(q))
B.b.H(r,q.gaF(q))
r.push(s.d)
r.push(s.e)
r.push(s.f)
r.push(s.r)
r.push(s.w)
r.push(s.x)
r.push(!1)
r.push(s.z)
r.push(s.as)
r.push(s.at)
r.push(s.ax)
r.push(s.ay)
r.push(s.ch)
r.push(s.CW)
r.push(s.cx)
r.push(s.cy)
r.push(s.db)
r.push(s.dx)
r.push(s.dy)
r.push(s.fr)
r.push(s.fx)
r.push(s.fy)
r.push(s.go)
r.push(s.id)
r.push(s.k2)
r.push(s.k3)
r.push(s.k4)
r.push(s.ok)
r.push(s.p1)
r.push(s.p2)
r.push(s.p3)
r.push(s.p4)
r.push(s.R8)
r.push(s.RG)
r.push(s.rx)
r.push(s.ry)
r.push(s.to)
r.push(s.x1)
r.push(s.x2)
r.push(s.xr)
r.push(s.y1)
r.push(s.y2)
r.push(s.af)
r.push(s.ah)
r.push(s.ac)
r.push(s.a3)
r.push(s.al)
r.push(s.bM)
r.push(s.ca)
r.push(s.cQ)
r.push(s.eX)
r.push(s.hi)
r.push(s.S)
r.push(s.v)
r.push(s.a0)
r.push(s.az)
r.push(s.aq)
r.push(s.aM)
r.push(s.bv)
r.push(s.bU)
r.push(s.c_)
r.push(s.bV)
r.push(s.bd)
r.push(s.en)
r.push(s.dW)
r.push(s.de)
r.push(s.cC)
r.push(s.hj)
r.push(s.eY)
r.push(s.hk)
r.push(s.eo)
r.push(s.i6)
r.push(s.je)
r.push(s.i7)
q=s.hl
q.toString
r.push(q)
r.push(s.jf)
r.push(s.jg)
r.push(s.jh)
q=s.ji
q.toString
r.push(q)
r.push(!0)
r.push(s.jj)
r.push(s.nH)
q=s.N
q.toString
r.push(q)
q=s.k1
q.toString
r.push(q)
q=s.jk
q.toString
r.push(q)
q=s.u
q.toString
r.push(q)
q=s.Q
q.toString
r.push(q)
return A.cY(r)}}
A.Vs.prototype={
$0(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3=null,b4=this.a,b5=this.b,b6=b5.br(b4.p2),b7=b5.br(b4.jg)
b5=b5.br(b4.p3)
s=b4.ax
r=s.b
q=s.c
p=s.d
if(p==null)p=r
o=s.e
if(o==null)o=q
n=s.f
m=s.r
l=s.w
if(l==null)l=n
k=s.x
if(k==null)k=m
j=s.y
i=j==null?n:j
h=s.z
g=h==null?m:h
f=s.Q
if(f==null){if(j==null)j=n}else j=f
f=s.as
if(f==null){if(h==null)h=m}else h=f
f=s.at
e=s.ax
d=s.ay
if(d==null)d=f
c=s.ch
if(c==null)c=e
b=s.cx
a=s.cy
a0=s.db
a1=s.dx
if(a1==null)a1=a
a2=s.dy
if(a2==null)a2=a0
a3=s.fr
if(a3==null)a3=b
a4=s.fx
if(a4==null)a4=b
a5=s.fy
if(a5==null)a5=B.k
a6=s.go
if(a6==null)a6=B.k
a7=s.id
if(a7==null)a7=a0
a8=s.k1
if(a8==null)a8=a
a9=s.k2
if(a9==null)a9=q
b0=s.k4
if(b0==null)b0=r
b1=s.ok
if(b1==null)b1=n
b2=s.k3
if(b2==null)b2=r
j=A.a1j(s.CW,s.a,f,d,a9,a7,b,e,c,a8,q,o,m,k,a0,a2,g,h,a3,a4,r,p,b0,a6,n,l,b1,a5,a,b2,a1,i,j)
return A.a2f(b4.hl,b4.jf,b4.jh,b7,b4.nH,b4.R8,b4.a,b4.u,b4.RG,b4.rx,b4.Q,b4.ry,b4.to,b4.x1,b4.x2,b4.ji,b4.xr,b4.as,b4.at,b4.y1,b4.y2,b4.af,j,b4.b,b4.ah,b4.ay,b4.ac,b4.ch,b4.CW,b4.a3,b4.al,b4.bM,b4.ca,b4.jk,b4.cQ,b4.c,b4.eX,!0,b4.hi,b4.cx,b4.cy,b4.db,b4.dx,b4.S,b4.ok,b4.dy,b4.d,b4.v,b4.e,b4.a0,b4.az,b4.aq,b4.aM,b4.bv,b4.bU,b4.c_,b4.f,b4.r,b4.bV,b4.fr,b4.jj,b4.fx,b4.fy,b4.p1,b6,b4.bd,b4.en,b4.go,b4.w,b4.id,b4.dW,b4.k1,b4.k2,b4.de,b4.cC,b4.k3,b4.x,b4.hj,b4.eY,b4.hk,b4.eo,b5,b4.i6,b4.je,b4.N,b4.i7,b4.p4,b4.k4,!1,b4.z)},
$S:179}
A.Vq.prototype={
$2(a,b){return new A.aF(a,b.U9(this.a.c.i(0,a),this.b),t.DR)},
$S:180}
A.Vr.prototype={
$1(a){return!this.a.c.X(0,a.gcS(a))},
$S:181}
A.OB.prototype={
gO6(){return this.at.ax.a},
gSo(){return this.at.ax.b}}
A.mE.prototype={
gt(a){return(A.n5(this.a)^A.n5(this.b))>>>0},
j(a,b){if(b==null)return!1
return b instanceof A.mE&&b.a===this.a&&b.b===this.b}}
A.Cx.prototype={
bh(a,b,c){var s,r=this.a,q=r.i(0,b)
if(q!=null)return q
if(r.a===this.b){s=new A.aS(r,A.t(r).h("aS<1>"))
r.A(0,s.gG(s))}s=c.$0()
r.l(0,b,s)
return s}}
A.ho.prototype={
t6(a){var s=this.a,r=this.b,q=A.T(a.a+new A.z(s,r).V(0,4).a,0,a.b)
return a.OU(A.T(a.c+new A.z(s,r).V(0,4).b,0,a.d),q)},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.ho&&b.a===this.a&&b.b===this.b},
gt(a){return A.J(this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
bs(){return this.Er()+"(h: "+A.eS(this.a)+", v: "+A.eS(this.b)+")"}}
A.FX.prototype={}
A.Gx.prototype={}
A.qU.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,s.y,s.z,s.Q,s.as,s.at,s.ax,s.ay,s.ch,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.qU&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&J.e(b.x,s.x)&&J.e(b.y,s.y)&&J.e(b.z,s.z)&&J.e(b.Q,s.Q)&&J.e(b.as,s.as)&&J.e(b.at,s.at)&&J.e(b.ax,s.ax)&&J.e(b.ay,s.ay)&&!0}}
A.FZ.prototype={}
A.qV.prototype={
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.y,s.x,s.z,s.Q,s.as,s.ax,s.at,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.qV&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)&&J.e(b.d,s.d)&&J.e(b.e,s.e)&&J.e(b.f,s.f)&&J.e(b.r,s.r)&&J.e(b.w,s.w)&&J.e(b.y,s.y)&&J.e(b.x,s.x)&&J.e(b.z,s.z)&&J.e(b.Q,s.Q)&&J.e(b.as,s.as)&&J.e(b.ax,s.ax)&&b.at==s.at}}
A.G_.prototype={}
A.qW.prototype={
ak(){return new A.kg(null,null,B.m)}}
A.kg.prototype={
gn_(){var s=this.a.c
return s==null?null.Up():s},
aN(){var s,r,q=this
q.b6()
q.fx=q.fr=!1
q.cy=$.iv.rx$.b.a!==0
s=A.dr(null,B.w3,B.dY,null,q)
s.b2()
r=s.bx$
r.b=!0
r.a.push(q.gN4())
q.as=s
$.iv.rx$.Y(0,q.gxw())
$.dQ.k4$.b.l(0,q.gxx(),null)},
bi(){this.dG()
this.c.a_(t.fe)
this.fy=!0},
IV(){var s=this.c
s.toString
switch(A.b4(s).r.a){case 4:case 3:case 5:return 24
case 0:case 1:case 2:return 32}},
IU(){var s=this.c
s.toString
switch(A.b4(s).r.a){case 4:case 3:case 5:return B.wg
case 0:case 1:case 2:return B.wd}},
xi(){var s=this.c
s.toString
switch(A.b4(s).r.a){case 4:case 3:case 5:return 12
case 0:case 1:case 2:return 14}},
JV(){var s,r,q=this
if(q.c==null)return
s=$.iv.rx$.b.a!==0
r=q.cy
r===$&&A.f()
if(s!==r)q.ai(new A.VB(q,s))},
N5(a){var s
if(a===B.y){s=this.fx
s===$&&A.f()
if(!s){s=this.fr
s===$&&A.f()
s=!s}else s=!0}else s=!1
if(s)this.qU()},
q7(a){var s,r=this,q=r.ay
if(q!=null)q.b4(0)
r.ay=null
if(a){r.qU()
return}r.fx=!0
if(r.db){if(r.ax==null){q=r.ch
q===$&&A.f()
s=r.as
s===$&&A.f()
r.ax=A.ca(q,s.gCA(s))}}else if(r.ax==null){q=r.CW
q===$&&A.f()
s=r.as
s===$&&A.f()
r.ax=A.ca(q,s.gCA(s))}r.db=!1},
yR(){var s=this,r=s.ax
if(r!=null)r.b4(0)
s.ax=null
if(s.ay==null){r=s.cx
r===$&&A.f()
s.ay=A.ca(r,s.gPB())}},
HT(){var s=this,r=s.fr
r===$&&A.f()
if(!r){r=s.fx
r===$&&A.f()}else r=!0
if(r)return
s.fr=!0
r=s.ax
if(r!=null)r.b4(0)
s.ax=null
r=s.ay
if(r!=null)r.b4(0)
s.ay=null
r=s.at
if(r!=null)r.jA(0)
r=s.as
r===$&&A.f()
r.jD(0)},
yB(){var s,r=this,q=r.fr
q===$&&A.f()
if(!q)return
r.fr=!1
q=r.ax
if(q!=null)q.b4(0)
r.ax=null
q=r.ay
if(q!=null)q.b4(0)
r.ay=null
if(!r.at.d.a){q=r.c
q.toString
r.a.toString
q=q.jm(t.bm)
q.toString
s=r.at
s.toString
q.tu(0,s)}A.zP(r.gn_())
q=r.as
q===$&&A.f()
q.cc(0)},
AT(){var s,r=this
r.fy===$&&A.f()
s=r.c
if(s==null)return!1
s=r.ay
if(s!=null)s.b4(0)
r.ay=null
r.fx=!1
s=r.fr
s===$&&A.f()
if(s){s=r.cy
s===$&&A.f()
if(s)A.a5V(r)
r.yB()
return!0}if(r.at!=null){s=r.ax
if(s!=null)s.b4(0)
r.ax=null
s=r.as
s===$&&A.f()
s.cc(0)
return!1}r.I2()
s=r.as
s===$&&A.f()
s.cc(0)
return!0},
xv(a){var s
if(this.c!=null){s=this.fr
s===$&&A.f()
this.q7(s||a)}},
my(){return this.xv(!1)},
I2(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e=this,d=null,c=e.c
c.toString
e.a.toString
c=c.jm(t.bm)
c.toString
s=e.c.gau()
s.toString
t.BS.a(s)
r=s.k3.eK(B.h)
q=A.fk(s.e2(0,c.c.gau()),r)
r=e.c.a_(t.I)
r.toString
s=A.Vp(d,d,e.a.c)
p=e.d
p===$&&A.f()
o=e.e
o===$&&A.f()
n=e.f
n===$&&A.f()
m=e.cy
m===$&&A.f()
l=m?new A.Vy(e):d
m=m?new A.Vz(e):d
k=e.r
k===$&&A.f()
j=e.w
j===$&&A.f()
i=e.x
i===$&&A.f()
h=e.as
h===$&&A.f()
h=A.fY(B.by,h,d)
g=e.y
g===$&&A.f()
f=e.z
f===$&&A.f()
r=A.a1V(new A.VA(A.a47(new A.G0(s,p,o,n,k,j,i,h,q,g,f,l,m,d),r.w)),!1)
e.at=r
e.fr=!1
c.tu(0,r)
A.zP(e.gn_())
if(e.cy)A.a5V(e)
$.hl.push(e)},
qU(){var s,r=this
B.b.A($.hl,r)
$.aeh.A(0,r)
s=r.ax
if(s!=null)s.b4(0)
r.ax=null
s=r.ay
if(s!=null)s.b4(0)
r.ay=null
s=r.fr
s===$&&A.f()
if(!s){s=r.at
if(s!=null)s.jA(0)}r.fr=!1
r.at=null
s=r.cy
s===$&&A.f()
if(s)if($.hl.length!==0)B.b.gJ($.hl).yB()},
K7(a){if(this.at==null)return
if(t.E.b(a)||t.v.b(a))this.my()
else if(t.Y.b(a))this.xv(!0)},
cA(){var s,r=this
if(r.at!=null)r.q7(!0)
s=r.ay
if(s!=null)s.b4(0)
r.mg()},
m(){var s,r=this
$.dQ.k4$.b.A(0,r.gxx())
$.iv.rx$.I(0,r.gxw())
r.qU()
s=r.as
s===$&&A.f()
s.m()
r.Gf()},
xz(){var s,r,q=this
q.db=!0
if(q.AT()){s=q.dy
s===$&&A.f()}else s=!1
if(s){s=q.dx
s===$&&A.f()
r=q.c
if(s===B.iW){r.toString
A.abw(r)}else{r.toString
A.M6(r)}}q.a.toString},
KA(){this.xz()
this.my()},
L(a){var s,r,q,p,o,n,m,l=this,k=null
if(l.gn_().length===0){s=l.a.z
return s}r=A.b4(a)
a.a_(t.cF)
q=A.b4(a).i7
s=r.p3.z
if(r.ax.a===B.K){s.toString
p=s.Am(B.k,l.xi())
o=new A.eZ(A.b7(B.d.bW(229.5),255,255,255),k,k,B.dC,k,k,B.b_)}else{s.toString
p=s.Am(B.i,l.xi())
o=new A.eZ(A.b7(B.d.bW(229.5),97,97,97),k,k,B.dC,k,k,B.b_)}l.a.toString
s=q.a
l.d=s==null?l.IV():s
l.a.toString
s=q.b
l.e=s==null?l.IU():s
l.a.toString
s=q.c
l.f=s==null?B.b6:s
s=q.d
l.y=s==null?24:s
l.z=!0
l.Q=!1
s=q.r
l.r=s==null?o:s
s=q.w
l.w=s==null?p:s
l.x=B.aU
l.cx=B.x
l.ch=B.w4
l.CW=B.b5
l.dx=B.iW
l.dy=!0
s=l.gn_()
n=A.cZ(k,l.a.z,!1,k,!1,k,k,k,k,k,k,k,k,k,k,k,k,k,s)
l.fy===$&&A.f()
s=l.dx
m=s===B.iW?l.gKd():k
n=A.a1B(B.a6,n,B.b4,!0,k,k,k,k,k,k,m,k,k,k,s===B.GC?l.gKz():k,k,k,k,k,k,k)
s=l.cy
s===$&&A.f()
if(s)n=A.P_(n,B.ck,new A.VC(l),new A.VD(l))
return n}}
A.VB.prototype={
$0(){this.a.cy=this.b},
$S:0}
A.Vy.prototype={
$1(a){var s=this.a
if(s.c!=null)s.yR()
return null},
$S:54}
A.Vz.prototype={
$1(a){return this.a.my()},
$S:35}
A.VA.prototype={
$1(a){return this.a},
$S:23}
A.VC.prototype={
$1(a){var s=this.a
if(s.c!=null)s.yR()
return null},
$S:54}
A.VD.prototype={
$1(a){return this.a.my()},
$S:35}
A.ZN.prototype={
uY(a){return new A.aC(0,a.b,0,a.d)},
v3(a,b){return A.ai3(b,!0,a,this.b,this.c)},
jT(a){return!this.b.j(0,a.b)||this.c!==a.c||!1}}
A.G0.prototype={
L(a){var s,r=this,q=null,p=A.b4(a).p3.z
p.toString
s=new A.h4(!0,q,A.a4k(new A.dI(new A.aC(0,1/0,r.d,1/0),A.vF(A.a3Z(q,A.v5(new A.hj(q,r.c,r.w,r.x,q,q),1,1),q,r.r,r.f,r.e,q),q,B.ce,!0,p,q,q,B.aq),q),r.y),q)
p=r.at
if(p!=null||r.ax!=null)s=A.P_(s,B.ck,p,r.ax)
p=A.d7(a)
p=p==null?q:p.e.d
if(p==null)p=0
return new A.jV(0,0,0,p,q,q,new A.nR(new A.ZN(r.z,r.Q,!0),s,q),q)}}
A.tP.prototype={
m(){var s=this,r=s.dc$
if(r!=null)r.I(0,s.gky())
s.dc$=null
s.aR()},
bZ(){this.eA()
this.dt()
this.kz()}}
A.qX.prototype={
gt(a){var s=this,r=null
return A.J(s.a,s.b,s.c,s.d,s.e,s.f,s.r,s.w,s.x,r,r,r,r,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.qX)if(b.a==r.a)if(J.e(b.b,r.b))if(J.e(b.c,r.c))if(b.d==r.d)if(J.e(b.r,r.r))if(J.e(b.w,r.w))s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s}}
A.AF.prototype={
E(){return"TooltipTriggerMode."+this.b}}
A.G1.prototype={}
A.RY.prototype={
E(){return"ScriptCategory."+this.b}}
A.r0.prototype={
D7(a){switch(a.a){case 0:return this.c
case 1:return this.d
case 2:return this.e}},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.r0&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c.j(0,s.c)&&b.d.j(0,s.d)&&b.e.j(0,s.e)},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.Gq.prototype={}
A.j_.prototype={
k(a){var s=this
if(s.geC(s)===0)return A.a1c(s.geD(),s.geE())
if(s.geD()===0)return A.a1b(s.geC(s),s.geE())
return A.a1c(s.geD(),s.geE())+" + "+A.a1b(s.geC(s),0)},
j(a,b){var s=this
if(b==null)return!1
return b instanceof A.j_&&b.geD()===s.geD()&&b.geC(b)===s.geC(s)&&b.geE()===s.geE()},
gt(a){var s=this
return A.J(s.geD(),s.geC(s),s.geE(),B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.cS.prototype={
geD(){return this.a},
geC(a){return 0},
geE(){return this.b},
W(a,b){return new A.cS(this.a-b.a,this.b-b.b)},
U(a,b){return new A.cS(this.a+b.a,this.b+b.b)},
V(a,b){return new A.cS(this.a*b,this.b*b)},
hP(a){var s=a.a/2,r=a.b/2
return new A.z(s+this.a*s,r+this.b*r)},
R5(a,b){var s=b.a,r=a.a,q=(b.c-s-r)/2,p=b.b,o=a.b,n=(b.d-p-o)/2
s=s+q+this.a*q
p=p+n+this.b*n
return new A.B(s,p,s+r,p+o)},
T(a){return this},
k(a){return A.a1c(this.a,this.b)}}
A.dF.prototype={
geD(){return 0},
geC(a){return this.a},
geE(){return this.b},
W(a,b){return new A.dF(this.a-b.a,this.b-b.b)},
U(a,b){return new A.dF(this.a+b.a,this.b+b.b)},
V(a,b){return new A.dF(this.a*b,this.b*b)},
T(a){var s=this
switch(a.a){case 0:return new A.cS(-s.a,s.b)
case 1:return new A.cS(s.a,s.b)}},
k(a){return A.a1b(this.a,this.b)}}
A.Dz.prototype={
V(a,b){return new A.Dz(this.a*b,this.b*b,this.c*b)},
T(a){var s=this
switch(a.a){case 0:return new A.cS(s.a-s.b,s.c)
case 1:return new A.cS(s.a+s.b,s.c)}},
geD(){return this.a},
geC(a){return this.b},
geE(){return this.c}}
A.q1.prototype={
E(){return"RenderComparison."+this.b}}
A.uO.prototype={
E(){return"Axis."+this.b}}
A.AW.prototype={
E(){return"VerticalDirection."+this.b}}
A.kR.prototype={
E(){return"AxisDirection."+this.b}}
A.pz.prototype={
Bp(a,b,c,d){return $.ak().nX(a,!1,c,d)},
Ra(a){return this.Bp(a,!1,null,null)},
Bq(a,b,c,d){var s=$.ak(),r=a.a
r.toString
return s.nX(r,!1,c,d)},
Rd(a){return this.Bq(a,!1,null,null)},
$icN:1}
A.FJ.prototype={
bf(){var s,r,q
for(s=this.a,s=A.iG(s,s.r),r=A.t(s).c;s.q();){q=s.d;(q==null?r.a(q):q).$0()}},
Y(a,b){this.a.F(0,b)},
I(a,b){this.a.A(0,b)}}
A.ns.prototype={
ph(a){var s=this
return new A.rV(s.gcu().W(0,a.gcu()),s.gdN().W(0,a.gdN()),s.gdJ().W(0,a.gdJ()),s.ge9().W(0,a.ge9()),s.gcv().W(0,a.gcv()),s.gdM().W(0,a.gdM()),s.gea().W(0,a.gea()),s.gdI().W(0,a.gdI()))},
F(a,b){var s=this
return new A.rV(s.gcu().U(0,b.gcu()),s.gdN().U(0,b.gdN()),s.gdJ().U(0,b.gdJ()),s.ge9().U(0,b.ge9()),s.gcv().U(0,b.gcv()),s.gdM().U(0,b.gdM()),s.gea().U(0,b.gea()),s.gdI().U(0,b.gdI()))},
k(a){var s,r,q,p,o=this
if(o.gcu().j(0,o.gdN())&&o.gdN().j(0,o.gdJ())&&o.gdJ().j(0,o.ge9()))if(!o.gcu().j(0,B.z))s=o.gcu().a===o.gcu().b?"BorderRadius.circular("+B.d.P(o.gcu().a,1)+")":"BorderRadius.all("+o.gcu().k(0)+")"
else s=null
else{r=""+"BorderRadius.only("
if(!o.gcu().j(0,B.z)){r+="topLeft: "+o.gcu().k(0)
q=!0}else q=!1
if(!o.gdN().j(0,B.z)){if(q)r+=", "
r+="topRight: "+o.gdN().k(0)
q=!0}if(!o.gdJ().j(0,B.z)){if(q)r+=", "
r+="bottomLeft: "+o.gdJ().k(0)
q=!0}if(!o.ge9().j(0,B.z)){if(q)r+=", "
r+="bottomRight: "+o.ge9().k(0)}r+=")"
s=r.charCodeAt(0)==0?r:r}if(o.gcv().j(0,o.gdM())&&o.gdM().j(0,o.gdI())&&o.gdI().j(0,o.gea()))if(!o.gcv().j(0,B.z))p=o.gcv().a===o.gcv().b?"BorderRadiusDirectional.circular("+B.d.P(o.gcv().a,1)+")":"BorderRadiusDirectional.all("+o.gcv().k(0)+")"
else p=null
else{r=""+"BorderRadiusDirectional.only("
if(!o.gcv().j(0,B.z)){r+="topStart: "+o.gcv().k(0)
q=!0}else q=!1
if(!o.gdM().j(0,B.z)){if(q)r+=", "
r+="topEnd: "+o.gdM().k(0)
q=!0}if(!o.gea().j(0,B.z)){if(q)r+=", "
r+="bottomStart: "+o.gea().k(0)
q=!0}if(!o.gdI().j(0,B.z)){if(q)r+=", "
r+="bottomEnd: "+o.gdI().k(0)}r+=")"
p=r.charCodeAt(0)==0?r:r}r=s!=null
if(r&&p!=null)return A.h(s)+" + "+p
if(r)return s
if(p!=null)return p
return"BorderRadius.zero"},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.ns&&b.gcu().j(0,s.gcu())&&b.gdN().j(0,s.gdN())&&b.gdJ().j(0,s.gdJ())&&b.ge9().j(0,s.ge9())&&b.gcv().j(0,s.gcv())&&b.gdM().j(0,s.gdM())&&b.gea().j(0,s.gea())&&b.gdI().j(0,s.gdI())},
gt(a){var s=this
return A.J(s.gcu(),s.gdN(),s.gdJ(),s.ge9(),s.gcv(),s.gdM(),s.gea(),s.gdI(),B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.c3.prototype={
gcu(){return this.a},
gdN(){return this.b},
gdJ(){return this.c},
ge9(){return this.d},
gcv(){return B.z},
gdM(){return B.z},
gea(){return B.z},
gdI(){return B.z},
dj(a){var s=this,r=s.a.ni(0,B.z),q=s.b.ni(0,B.z)
return A.Qo(a,s.c.ni(0,B.z),s.d.ni(0,B.z),r,q)},
ph(a){if(a instanceof A.c3)return this.W(0,a)
return this.Ef(a)},
F(a,b){if(b instanceof A.c3)return this.U(0,b)
return this.Ee(0,b)},
W(a,b){var s=this
return new A.c3(s.a.W(0,b.a),s.b.W(0,b.b),s.c.W(0,b.c),s.d.W(0,b.d))},
U(a,b){var s=this
return new A.c3(s.a.U(0,b.a),s.b.U(0,b.b),s.c.U(0,b.c),s.d.U(0,b.d))},
V(a,b){var s=this
return new A.c3(s.a.V(0,b),s.b.V(0,b),s.c.V(0,b),s.d.V(0,b))},
T(a){return this}}
A.rV.prototype={
V(a,b){var s=this
return new A.rV(s.a.V(0,b),s.b.V(0,b),s.c.V(0,b),s.d.V(0,b),s.e.V(0,b),s.f.V(0,b),s.r.V(0,b),s.w.V(0,b))},
T(a){var s=this
switch(a.a){case 0:return new A.c3(s.a.U(0,s.f),s.b.U(0,s.e),s.c.U(0,s.w),s.d.U(0,s.r))
case 1:return new A.c3(s.a.U(0,s.e),s.b.U(0,s.f),s.c.U(0,s.r),s.d.U(0,s.w))}},
gcu(){return this.a},
gdN(){return this.b},
gdJ(){return this.c},
ge9(){return this.d},
gcv(){return this.e},
gdM(){return this.f},
gea(){return this.r},
gdI(){return this.w}}
A.uW.prototype={
E(){return"BorderStyle."+this.b}}
A.cf.prototype={
ao(a,b){var s=Math.max(0,this.b*b),r=b<=0?B.aZ:this.c
return new A.cf(this.a,s,r,-1)},
fJ(){switch(this.c.a){case 1:var s=$.ak().b9()
s.sad(0,this.a)
s.siA(this.b)
s.scs(0,B.D)
return s
case 0:s=$.ak().b9()
s.sad(0,B.aE)
s.siA(0)
s.scs(0,B.D)
return s}},
gdm(){return this.b*(1-(1+this.d)/2)},
gvz(){return this.b*(1+this.d)/2},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.cf&&b.a.j(0,s.a)&&b.b===s.b&&b.c===s.c&&b.d===s.d},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
bs(){return"BorderSide"}}
A.be.prototype={
dO(a,b,c){return null},
F(a,b){return this.dO(a,b,!1)},
U(a,b){var s=this.F(0,b)
if(s==null)s=b.dO(0,this,!0)
return s==null?new A.e9(A.b([b,this],t.h_)):s},
bF(a,b){if(a==null)return this.ao(0,b)
return null},
bG(a,b){if(a==null)return this.ao(0,1-b)
return null},
k(a){return"ShapeBorder()"}}
A.c6.prototype={
gj4(){var s=Math.max(this.a.gdm(),0)
return new A.b8(s,s,s,s)},
bF(a,b){if(a==null)return this.ao(0,b)
return null},
bG(a,b){if(a==null)return this.ao(0,1-b)
return null}}
A.e9.prototype={
gj4(){return B.b.Q2(this.a,B.b6,new A.WV())},
dO(a,b,c){var s,r,q,p=b instanceof A.e9
if(!p){s=this.a
r=c?B.b.gJ(s):B.b.gG(s)
q=r.dO(0,b,c)
if(q==null)q=b.dO(0,r,!c)
if(q!=null){p=A.at(s,!0,t.mD)
p[c?p.length-1:0]=q
return new A.e9(p)}}s=A.b([],t.h_)
if(c)B.b.H(s,this.a)
if(p)B.b.H(s,b.a)
else s.push(b)
if(!c)B.b.H(s,this.a)
return new A.e9(s)},
F(a,b){return this.dO(a,b,!1)},
ao(a,b){var s=this.a,r=A.ab(s).h("aJ<1,be>")
return new A.e9(A.at(new A.aJ(s,new A.WW(b),r),!0,r.h("bd.E")))},
bF(a,b){return A.a65(a,this,b)},
bG(a,b){return A.a65(this,a,b)},
e1(a,b){return B.b.gG(this.a).e1(a,b)},
f9(a,b,c){var s,r,q,p,o
for(s=this.a,r=s.length,q=0;q<s.length;s.length===r||(0,A.P)(s),++q){p=s[q]
p.f9(a,b,c)
o=p.gj4().T(c)
b=new A.B(b.a+o.a,b.b+o.b,b.c-o.c,b.d-o.d)}},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.e9&&A.cR(b.a,this.a)},
gt(a){return A.cY(this.a)},
k(a){var s=this.a,r=A.ab(s).h("c7<1>")
return new A.aJ(new A.c7(s,r),new A.WX(),r.h("aJ<bd.E,u>")).bb(0," + ")}}
A.WV.prototype={
$2(a,b){return a.F(0,b.gj4())},
$S:185}
A.WW.prototype={
$1(a){return a.ao(0,this.a)},
$S:186}
A.WX.prototype={
$1(a){return a.k(0)},
$S:187}
A.Bo.prototype={}
A.v_.prototype={
E(){return"BoxShape."+this.b}}
A.uX.prototype={
dO(a,b,c){return null},
F(a,b){return this.dO(a,b,!1)},
e1(a,b){var s=$.ak().d7()
s.rw(a)
return s}}
A.cE.prototype={
gj4(){var s,r=this
if(r.gzK()){s=r.a.gdm()
return new A.b8(s,s,s,s)}return new A.b8(r.d.gdm(),r.a.gdm(),r.b.gdm(),r.c.gdm())},
glv(){var s,r,q=this,p=q.a,o=p.a,n=q.b
if(n.a.j(0,o)&&q.c.a.j(0,o)&&q.d.a.j(0,o))if(q.gzK()){s=p.c
if(n.c===s&&q.c.c===s&&q.d.c===s){r=p.d
p=n.d===r&&q.c.d===r&&q.d.d===r}else p=!1}else p=!1
else p=!1
return p},
gzK(){var s=this,r=s.a.b
return s.b.b===r&&s.c.b===r&&s.d.b===r},
dO(a,b,c){var s=this
if(b instanceof A.cE&&A.fT(s.a,b.a)&&A.fT(s.b,b.b)&&A.fT(s.c,b.c)&&A.fT(s.d,b.d))return new A.cE(A.eg(s.a,b.a),A.eg(s.b,b.b),A.eg(s.c,b.c),A.eg(s.d,b.d))
return null},
F(a,b){return this.dO(a,b,!1)},
ao(a,b){var s=this
return new A.cE(s.a.ao(0,b),s.b.ao(0,b),s.c.ao(0,b),s.d.ao(0,b))},
bF(a,b){if(a instanceof A.cE)return A.a1g(a,this,b)
return this.vX(a,b)},
bG(a,b){if(a instanceof A.cE)return A.a1g(this,a,b)
return this.vY(a,b)},
om(a,b,c,d,e){var s,r=this
if(r.glv()){s=r.a
switch(s.c.a){case 0:return
case 1:switch(d.a){case 1:A.a3O(a,b,s)
break
case 0:if(c!=null&&!c.j(0,B.V)){A.a3P(a,b,s,c)
return}A.a3Q(a,b,s)
break}return}}A.a7P(a,b,r.c,r.d,r.b,r.a)},
f9(a,b,c){return this.om(a,b,null,B.b_,c)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.cE&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c.j(0,s.c)&&b.d.j(0,s.d)},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s,r,q=this
if(q.glv())return"Border.all("+q.a.k(0)+")"
s=A.b([],t.s)
r=q.a
if(!r.j(0,B.o))s.push("top: "+r.k(0))
r=q.b
if(!r.j(0,B.o))s.push("right: "+r.k(0))
r=q.c
if(!r.j(0,B.o))s.push("bottom: "+r.k(0))
r=q.d
if(!r.j(0,B.o))s.push("left: "+r.k(0))
return"Border("+B.b.bb(s,", ")+")"}}
A.cT.prototype={
gj4(){var s,r=this
if(r.glv()){s=r.a.gdm()
return new A.dv(s,s,s,s)}return new A.dv(r.b.gdm(),r.a.gdm(),r.c.gdm(),r.d.gdm())},
glv(){var s,r,q,p=this,o=p.a,n=o.a,m=p.b
if(!m.a.j(0,n)||!p.c.a.j(0,n)||!p.d.a.j(0,n))return!1
s=o.b
if(m.b!==s||p.c.b!==s||p.d.b!==s)return!1
r=o.c
if(m.c!==r||p.c.c!==r||p.d.c!==r)return!1
q=o.d
if(!(m.d===q&&p.d.d===q&&p.c.d===q))return!1
return!0},
dO(a,b,c){var s,r,q,p=this,o=null
if(b instanceof A.cT){s=p.a
r=b.a
if(A.fT(s,r)&&A.fT(p.b,b.b)&&A.fT(p.c,b.c)&&A.fT(p.d,b.d))return new A.cT(A.eg(s,r),A.eg(p.b,b.b),A.eg(p.c,b.c),A.eg(p.d,b.d))
return o}if(b instanceof A.cE){s=b.a
r=p.a
if(!A.fT(s,r)||!A.fT(b.c,p.d))return o
q=p.b
if(!q.j(0,B.o)||!p.c.j(0,B.o)){if(!b.d.j(0,B.o)||!b.b.j(0,B.o))return o
return new A.cT(A.eg(s,r),q,p.c,A.eg(b.c,p.d))}return new A.cE(A.eg(s,r),b.b,A.eg(b.c,p.d),b.d)}return o},
F(a,b){return this.dO(a,b,!1)},
ao(a,b){var s=this
return new A.cT(s.a.ao(0,b),s.b.ao(0,b),s.c.ao(0,b),s.d.ao(0,b))},
bF(a,b){if(a instanceof A.cT)return A.a1f(a,this,b)
return this.vX(a,b)},
bG(a,b){if(a instanceof A.cT)return A.a1f(this,a,b)
return this.vY(a,b)},
om(a,b,c,d,e){var s,r,q,p=this
if(p.glv()){s=p.a
switch(s.c.a){case 0:return
case 1:switch(d.a){case 1:A.a3O(a,b,s)
break
case 0:if(c!=null&&!c.j(0,B.V)){A.a3P(a,b,s,c)
return}A.a3Q(a,b,s)
break}return}}switch(e.a){case 0:r=p.c
q=p.b
break
case 1:r=p.b
q=p.c
break
default:r=null
q=null}A.a7P(a,b,p.d,r,q,p.a)},
f9(a,b,c){return this.om(a,b,null,B.b_,c)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.cT&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c.j(0,s.c)&&b.d.j(0,s.d)},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this,r=A.b([],t.s),q=s.a
if(!q.j(0,B.o))r.push("top: "+q.k(0))
q=s.b
if(!q.j(0,B.o))r.push("start: "+q.k(0))
q=s.c
if(!q.j(0,B.o))r.push("end: "+q.k(0))
q=s.d
if(!q.j(0,B.o))r.push("bottom: "+q.k(0))
return"BorderDirectional("+B.b.bb(r,", ")+")"}}
A.eZ.prototype={
gdh(a){var s=this.c
return s==null?null:s.gj4()},
ao(a,b){var s=this,r=null,q=A.r(r,s.a,b),p=A.a3R(r,s.c,b),o=A.eY(r,s.d,b),n=A.a3T(r,s.e,b)
return new A.eZ(q,s.b,p,o,n,r,s.w)},
gty(){return this.e!=null},
bF(a,b){if(a==null)return this.ao(0,b)
if(a instanceof A.eZ)return A.a3S(a,this,b)
return this.Em(a,b)},
bG(a,b){if(a==null)return this.ao(0,1-b)
if(a instanceof A.eZ)return A.a3S(this,a,b)
return this.En(a,b)},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.eZ)if(J.e(b.a,r.a))if(J.e(b.c,r.c))if(J.e(b.d,r.d))if(A.cR(b.e,r.e))s=b.w===r.w
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s},
gt(a){var s=this,r=s.e
r=r==null?null:A.cY(r)
return A.J(s.a,s.b,s.c,s.d,r,s.f,null,s.w,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
Bk(a,b,c){var s
switch(this.w.a){case 0:s=this.d
if(s!=null)return s.T(c).dj(new A.B(0,0,0+a.a,0+a.b)).B(0,b)
return!0
case 1:return b.W(0,a.eK(B.h)).gbR()<=Math.min(a.a,a.b)/2}},
Ao(a){return new A.Wj(this,a)}}
A.Wj.prototype={
yb(a,b,c,d){var s=this.b
switch(s.w.a){case 1:a.h8(b.gaK(),b.gfh()/2,c)
break
case 0:s=s.d
if(s==null||s.j(0,B.V))a.bS(b,c)
else a.cl(s.T(d).dj(b),c)
break}},
LL(a,b,c){var s,r,q,p,o,n,m=this.b.e
if(m==null)return
for(s=m.length,r=0;r<m.length;m.length===s||(0,A.P)(m),++r){q=m[r]
p=$.ak().b9()
p.sad(0,q.a)
o=q.e
n=q.c
p.sRN(new A.p2(o,n>0?n*0.57735+0.5:0))
o=b.cO(q.b)
n=q.d
this.yb(a,new A.B(o.a-n,o.b-n,o.c+n,o.d+n),p,c)}},
LK(a,b,c){return},
m(){this.Eh()},
ud(a,b,c){var s,r,q,p=this,o=c.e,n=b.a,m=b.b,l=new A.B(n,m,n+o.a,m+o.b),k=c.d
p.LL(a,l,k)
o=p.b
n=o.a
m=n==null
if(!m||!1){s=p.c
if(s!=null)r=!1
else r=!0
if(r){q=$.ak().b9()
if(!m)q.sad(0,n)
p.c=q
n=q}else n=s
n.toString
p.yb(a,l,n,k)}p.LK(a,l,c)
n=o.c
if(n!=null){m=o.d
m=m==null?null:m.T(k)
n.om(a,l,m,o.w,k)}},
k(a){return"BoxPainter for "+this.b.k(0)}}
A.fU.prototype={
ao(a,b){var s=this
return new A.fU(s.d*b,s.e,s.a,s.b.V(0,b),s.c*b)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.fU&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c===s.c&&b.d===s.d&&b.e===s.e},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,s.e,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this
return"BoxShadow("+s.a.k(0)+", "+s.b.k(0)+", "+A.eS(s.c)+", "+A.eS(s.d)+", "+s.e.k(0)+")"}}
A.cp.prototype={
ao(a,b){return new A.cp(this.b,this.a.ao(0,b))},
bF(a,b){var s,r
if(a instanceof A.cp){s=A.ad(a.a,this.a,b)
r=A.E(a.b,this.b,b)
r.toString
return new A.cp(A.T(r,0,1),s)}return this.iB(a,b)},
bG(a,b){var s,r
if(a instanceof A.cp){s=A.ad(this.a,a.a,b)
r=A.E(this.b,a.b,b)
r.toString
return new A.cp(A.T(r,0,1),s)}return this.iC(a,b)},
e1(a,b){var s=$.ak().d7()
s.NN(this.wh(a))
return s},
hX(a){var s=a==null?this.a:a
return new A.cp(this.b,s)},
f9(a,b,c){var s,r=this.a
switch(r.c.a){case 0:break
case 1:s=r.b*r.d
if(this.b===0)a.h8(b.gaK(),(b.gfh()+s)/2,r.fJ())
else a.nD(this.wh(b).cG(s/2),r.fJ())
break}},
wh(a){var s,r,q,p,o,n,m,l=this.b
if(l===0||a.c-a.a===a.d-a.b)return A.a23(a.gaK(),a.gfh()/2)
s=a.c
r=a.a
q=s-r
p=a.d
o=a.b
n=p-o
l=1-l
if(q<n){m=l*(n-q)/2
return new A.B(r,o+m,s,p-m)}else{m=l*(q-n)/2
return new A.B(r+m,o,s-m,p)}},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.cp&&b.a.j(0,this.a)&&b.b===this.b},
gt(a){return A.J(this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this.b
if(s!==0)return"CircleBorder("+this.a.k(0)+", eccentricity: "+A.h(s)+")"
return"CircleBorder("+this.a.k(0)+")"}}
A.IZ.prototype={
pN(a,b,c,d){var s=this
s.gb7(s).cp(0)
switch(b.a){case 0:break
case 1:a.$1(!1)
break
case 2:a.$1(!0)
break
case 3:a.$1(!0)
s.gb7(s).va(c,$.ak().b9())
break}d.$0()
if(b===B.dR)s.gb7(s).co(0)
s.gb7(s).co(0)},
Ol(a,b,c,d){this.pN(new A.J_(this,a),b,c,d)},
Om(a,b,c,d){this.pN(new A.J0(this,a),b,c,d)},
Oo(a,b,c,d){this.pN(new A.J1(this,a),b,c,d)}}
A.J_.prototype={
$1(a){var s=this.a
return s.gb7(s).A7(0,this.b,a)},
$S:18}
A.J0.prototype={
$1(a){var s=this.a
return s.gb7(s).A8(this.b,a)},
$S:18}
A.J1.prototype={
$1(a){var s=this.a
return s.gb7(s).On(this.b,a)},
$S:18}
A.hN.prototype={
i(a,b){return this.b.i(0,b)},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return s.Ei(0,b)&&A.t(s).h("hN<hN.T>").b(b)&&A.a0J(b.b,s.b)},
gt(a){return A.J(A.x(this),this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"ColorSwatch(primary value: "+this.Ej(0)+")"}}
A.f3.prototype={
bs(){return"Decoration"},
gdh(a){return B.b6},
gty(){return!1},
bF(a,b){return null},
bG(a,b){return null},
Bk(a,b,c){return!0}}
A.uZ.prototype={
m(){}}
A.C6.prototype={}
A.bY.prototype={
gBl(){var s=this
return s.gci(s)+s.gcj(s)+s.gd3(s)+s.gd4()},
F(a,b){var s=this
return new A.iI(s.gci(s)+b.gci(b),s.gcj(s)+b.gcj(b),s.gd3(s)+b.gd3(b),s.gd4()+b.gd4(),s.gc4(s)+b.gc4(b),s.gcg(s)+b.gcg(b))},
kJ(a,b,c){var s=this
return new A.iI(A.T(s.gci(s),b.a,c.a),A.T(s.gcj(s),b.c,c.b),A.T(s.gd3(s),0,c.c),A.T(s.gd4(),0,c.d),A.T(s.gc4(s),b.b,c.e),A.T(s.gcg(s),b.d,c.f))},
k(a){var s=this
if(s.gd3(s)===0&&s.gd4()===0){if(s.gci(s)===0&&s.gcj(s)===0&&s.gc4(s)===0&&s.gcg(s)===0)return"EdgeInsets.zero"
if(s.gci(s)===s.gcj(s)&&s.gcj(s)===s.gc4(s)&&s.gc4(s)===s.gcg(s))return"EdgeInsets.all("+B.d.P(s.gci(s),1)+")"
return"EdgeInsets("+B.d.P(s.gci(s),1)+", "+B.d.P(s.gc4(s),1)+", "+B.d.P(s.gcj(s),1)+", "+B.d.P(s.gcg(s),1)+")"}if(s.gci(s)===0&&s.gcj(s)===0)return"EdgeInsetsDirectional("+B.d.P(s.gd3(s),1)+", "+B.d.P(s.gc4(s),1)+", "+B.d.P(s.gd4(),1)+", "+B.d.P(s.gcg(s),1)+")"
return"EdgeInsets("+B.d.P(s.gci(s),1)+", "+B.d.P(s.gc4(s),1)+", "+B.d.P(s.gcj(s),1)+", "+B.d.P(s.gcg(s),1)+") + EdgeInsetsDirectional("+B.d.P(s.gd3(s),1)+", 0.0, "+B.d.P(s.gd4(),1)+", 0.0)"},
j(a,b){var s=this
if(b==null)return!1
return b instanceof A.bY&&b.gci(b)===s.gci(s)&&b.gcj(b)===s.gcj(s)&&b.gd3(b)===s.gd3(s)&&b.gd4()===s.gd4()&&b.gc4(b)===s.gc4(s)&&b.gcg(b)===s.gcg(s)},
gt(a){var s=this
return A.J(s.gci(s),s.gcj(s),s.gd3(s),s.gd4(),s.gc4(s),s.gcg(s),B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)}}
A.b8.prototype={
gci(a){return this.a},
gc4(a){return this.b},
gcj(a){return this.c},
gcg(a){return this.d},
gd3(a){return 0},
gd4(){return 0},
F(a,b){if(b instanceof A.b8)return this.U(0,b)
return this.vC(0,b)},
kJ(a,b,c){var s=this
return new A.b8(A.T(s.a,b.a,c.a),A.T(s.b,b.b,c.e),A.T(s.c,b.c,c.b),A.T(s.d,b.d,c.f))},
W(a,b){var s=this
return new A.b8(s.a-b.a,s.b-b.b,s.c-b.c,s.d-b.d)},
U(a,b){var s=this
return new A.b8(s.a+b.a,s.b+b.b,s.c+b.c,s.d+b.d)},
V(a,b){var s=this
return new A.b8(s.a*b,s.b*b,s.c*b,s.d*b)},
T(a){return this},
kP(a,b,c,d){var s=this,r=b==null?s.a:b,q=d==null?s.b:d,p=c==null?s.c:c
return new A.b8(r,q,p,a==null?s.d:a)},
rO(a){return this.kP(a,null,null,null)}}
A.dv.prototype={
gd3(a){return this.a},
gc4(a){return this.b},
gd4(){return this.c},
gcg(a){return this.d},
gci(a){return 0},
gcj(a){return 0},
F(a,b){if(b instanceof A.dv)return this.U(0,b)
return this.vC(0,b)},
W(a,b){var s=this
return new A.dv(s.a-b.a,s.b-b.b,s.c-b.c,s.d-b.d)},
U(a,b){var s=this
return new A.dv(s.a+b.a,s.b+b.b,s.c+b.c,s.d+b.d)},
V(a,b){var s=this
return new A.dv(s.a*b,s.b*b,s.c*b,s.d*b)},
T(a){var s=this
switch(a.a){case 0:return new A.b8(s.c,s.b,s.a,s.d)
case 1:return new A.b8(s.a,s.b,s.c,s.d)}}}
A.iI.prototype={
V(a,b){var s=this
return new A.iI(s.a*b,s.b*b,s.c*b,s.d*b,s.e*b,s.f*b)},
T(a){var s=this
switch(a.a){case 0:return new A.b8(s.d+s.a,s.e,s.c+s.b,s.f)
case 1:return new A.b8(s.c+s.a,s.e,s.d+s.b,s.f)}},
gci(a){return this.a},
gcj(a){return this.b},
gd3(a){return this.c},
gd4(){return this.d},
gc4(a){return this.e},
gcg(a){return this.f}}
A.Nt.prototype={
M(a){var s,r,q,p
for(s=this.b,r=s.gaF(s),r=new A.dw(J.an(r.a),r.b),q=A.t(r).z[1];r.q();){p=r.a;(p==null?q.a(p):p).m()}s.M(0)
for(s=this.a,r=s.gaF(s),r=new A.dw(J.an(r.a),r.b),q=A.t(r).z[1];r.q();){p=r.a
if(p==null)p=q.a(p)
p.a.I(0,p.b)}s.M(0)
this.f=0},
nF(a){var s,r,q,p=this,o=p.c.A(0,a)
if(o!=null){s=o.a
r=o.d
r===$&&A.f()
s.Co(r)
o.vZ()}q=p.a.A(0,a)
if(q!=null){q.a.I(0,q.b)
return!0}o=p.b.A(0,a)
if(o!=null){s=p.f
r=o.b
r.toString
p.f=s-r
o.m()
return!0}return!1},
zf(a,b,c){var s,r=this,q=b.b
if(q!=null&&q<=104857600&&!0){s=r.f
q.toString
r.f=s+q
r.b.l(0,a,b)
r.Hu(c)}else b.m()},
re(a,b,c){var s=this.c.bh(0,a,new A.Nv(this,b,a))
if(s.b==null)s.b=c},
Ch(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i=this,h=null,g={}
g.a=g.b=null
q=i.a
p=q.i(0,b)
o=p==null?h:p.a
g.c=o
if(o!=null)return o
p=i.b
n=p.A(0,b)
if(n!=null){g=n.a
i.re(b,g,n.b)
p.l(0,b,n)
return g}m=i.c.i(0,b)
if(m!=null){g=m.a
i.zf(b,new A.rf(g,m.b,g.tF()),h)
return g}try{o=g.c=c.$0()
i.re(b,o,h)
p=o}catch(l){s=A.ac(l)
r=A.ar(l)
d.$2(s,r)
return h}g.d=!1
k=A.bM("pendingImage")
j=new A.es(new A.Nw(g,i,b,!0,k),h,h)
k.b=new A.DZ(p,j)
q.l(0,b,k.b0())
g.c.Y(0,j)
return g.c},
Hu(a){var s,r,q,p,o,n=this,m=n.b,l=A.t(m).h("aS<1>")
while(!0){if(!(n.f>104857600||m.a>1000))break
s=new A.aS(m,l)
r=s.gO(s)
if(!r.q())A.U(A.bt())
q=r.gC(r)
p=m.i(0,q)
s=n.f
o=p.b
o.toString
n.f=s-o
p.m()
m.A(0,q)}}}
A.Nv.prototype={
$0(){return A.aeR(this.b,new A.Nu(this.a,this.c))},
$S:188}
A.Nu.prototype={
$0(){this.a.c.A(0,this.b)},
$S:0}
A.Nw.prototype={
$2(a,b){var s,r,q,p,o,n=this
if(a!=null){s=a.gDW()
a.m()}else s=null
r=n.a
q=r.c
p=new A.rf(q,s,q.tF())
q=n.b
o=n.c
q.re(o,r.c,s)
if(n.d)q.zf(o,p,r.a)
else p.m()
q.a.A(0,o)
if(!r.d){q=n.e.b0()
q.a.I(0,q.b)}r.d=!0},
$S:189}
A.Bw.prototype={
m(){$.cl.ax$.push(new A.WP(this))}}
A.WP.prototype={
$1(a){var s=this.a,r=s.c
if(r!=null)r.m()
s.c=null},
$S:3}
A.rf.prototype={}
A.mJ.prototype={
GO(a,b,c){var s=new A.Yg(this,b)
this.d=s
a.NM(s)},
k(a){return"<optimized out>#"+A.bW(this)}}
A.Yg.prototype={
$0(){var s,r
this.b.$0()
s=this.a
r=s.d
r===$&&A.f()
s.a.Co(r)
s.vZ()},
$S:0}
A.DZ.prototype={}
A.oA.prototype={
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.oA&&b.a==s.a&&b.b==s.b&&J.e(b.c,s.c)&&b.d==s.d&&J.e(b.e,s.e)&&b.f==s.f},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.e,s.f,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s,r=this,q=""+"ImageConfiguration(",p=r.a
if(p!=null){q+="bundle: "+p.k(0)
s=!0}else s=!1
p=r.b
if(p!=null){if(s)q+=", "
p=q+("devicePixelRatio: "+B.d.P(p,1))
q=p
s=!0}p=r.c
if(p!=null){if(s)q+=", "
p=q+("locale: "+p.k(0))
q=p
s=!0}p=r.d
if(p!=null){if(s)q+=", "
p=q+("textDirection: "+p.k(0))
q=p
s=!0}p=r.e
if(p!=null){if(s)q+=", "
p=q+("size: "+p.k(0))
q=p
s=!0}p=r.f
if(p!=null){if(s)q+=", "
p=q+("platform: "+p.b)
q=p}q+=")"
return q.charCodeAt(0)==0?q:q}}
A.es.prototype={
gt(a){return A.J(this.a,this.b,this.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.es&&J.e(b.a,s.a)&&J.e(b.b,s.b)&&J.e(b.c,s.c)},
S9(a,b){return this.a.$2(a,b)}}
A.HU.prototype={}
A.i1.prototype={
j(a,b){var s
if(b==null)return!1
if(b instanceof A.i1)if(b.a===this.a)if(b.b==this.b)s=A.cR(b.f,this.f)
else s=!1
else s=!1
else s=!1
return s},
gt(a){return A.J(this.a,this.b,this.c,!1,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"InlineSpanSemanticsInformation{text: "+this.a+", semanticsLabel: "+A.h(this.b)+", recognizer: "+A.h(this.c)+"}"}}
A.et.prototype={
Dm(a){var s={}
s.a=null
this.aO(new A.NO(s,a,new A.HU()))
return s.a},
j(a,b){if(b==null)return!1
if(this===b)return!0
if(J.L(b)!==A.x(this))return!1
return b instanceof A.et&&J.e(b.a,this.a)},
gt(a){return J.k(this.a)}}
A.NO.prototype={
$1(a){var s=a.Dn(this.b,this.c)
this.a.a=s
return s==null},
$S:51}
A.cj.prototype={
ao(a,b){var s=this.a.ao(0,b)
return new A.cj(this.b.V(0,b),s)},
bF(a,b){var s,r,q=this
if(a instanceof A.cj){s=A.ad(a.a,q.a,b)
r=A.eY(a.b,q.b,b)
r.toString
return new A.cj(r,s)}if(a instanceof A.cp){s=A.ad(a.a,q.a,b)
return new A.d1(q.b,1-b,a.b,s)}return q.iB(a,b)},
bG(a,b){var s,r,q=this
if(a instanceof A.cj){s=A.ad(q.a,a.a,b)
r=A.eY(q.b,a.b,b)
r.toString
return new A.cj(r,s)}if(a instanceof A.cp){s=A.ad(q.a,a.a,b)
return new A.d1(q.b,b,a.b,s)}return q.iC(a,b)},
hX(a){var s=a==null?this.a:a
return new A.cj(this.b,s)},
e1(a,b){var s=$.ak().d7()
s.eH(this.b.T(b).dj(a))
return s},
f9(a,b,c){var s,r,q,p,o=this.a
switch(o.c.a){case 0:break
case 1:s=this.b
if(o.b===0)a.cl(s.T(c).dj(b),o.fJ())
else{r=$.ak().b9()
r.sad(0,o.a)
q=s.T(c).dj(b)
p=q.cG(-o.gdm())
a.nC(q.cG(o.gvz()),p,r)}break}},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.cj&&b.a.j(0,this.a)&&b.b.j(0,this.b)},
gt(a){return A.J(this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"RoundedRectangleBorder("+this.a.k(0)+", "+this.b.k(0)+")"}}
A.d1.prototype={
ao(a,b){var s=this.a.ao(0,b)
return new A.d1(this.b.V(0,b),b,this.d,s)},
bF(a,b){var s,r,q,p=this
if(a instanceof A.cj){s=A.ad(a.a,p.a,b)
r=A.eY(a.b,p.b,b)
r.toString
return new A.d1(r,p.c*b,p.d,s)}if(a instanceof A.cp){s=A.ad(a.a,p.a,b)
r=p.c
return new A.d1(p.b,r+(1-r)*(1-b),a.b,s)}if(a instanceof A.d1){s=A.ad(a.a,p.a,b)
r=A.eY(a.b,p.b,b)
r.toString
q=A.E(a.c,p.c,b)
q.toString
return new A.d1(r,q,p.d,s)}return p.iB(a,b)},
bG(a,b){var s,r,q,p=this
if(a instanceof A.cj){s=A.ad(p.a,a.a,b)
r=A.eY(p.b,a.b,b)
r.toString
return new A.d1(r,p.c*(1-b),p.d,s)}if(a instanceof A.cp){s=A.ad(p.a,a.a,b)
r=p.c
return new A.d1(p.b,r+(1-r)*b,a.b,s)}if(a instanceof A.d1){s=A.ad(p.a,a.a,b)
r=A.eY(p.b,a.b,b)
r.toString
q=A.E(p.c,a.c,b)
q.toString
return new A.d1(r,q,p.d,s)}return p.iC(a,b)},
yD(a){var s,r,q,p,o,n,m,l,k=this.c
if(k===0||a.c-a.a===a.d-a.b)return a
s=a.c
r=a.a
q=s-r
p=a.d
o=a.b
n=p-o
m=1-this.d
if(q<n){l=k*((n-q)/2)*m
return new A.B(r,o+l,s,p-l)}else{l=k*((q-n)/2)*m
return new A.B(r+l,o,s-l,p)}},
wf(a,b){var s,r,q,p=this.b.T(b),o=this.c
if(o===0)return p
s=this.d
if(s!==0){r=a.c-a.a
q=a.d-a.b
s=0.5+s/2
if(r<q){o=A.kT(p,A.uV(new A.bc(r/2,s*q/2)),o)
o.toString
return o}else{o=A.kT(p,A.uV(new A.bc(s*r/2,q/2)),o)
o.toString
return o}}return A.kT(p,A.a3J(a.gfh()/2),o)},
e1(a,b){var s=$.ak().d7(),r=this.wf(a,b)
r.toString
s.eH(r.dj(this.yD(a)))
return s},
hX(a){var s=this,r=a==null?s.a:a
return new A.d1(s.b,s.c,s.d,r)},
f9(a,b,c){var s,r=this.a
switch(r.c.a){case 0:break
case 1:s=this.wf(b,c)
s.toString
a.cl(s.dj(this.yD(b)).cG(r.b*r.d/2),r.fJ())
break}},
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.d1&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c===s.c},
gt(a){return A.J(this.a,this.b,this.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this,r="RoundedRectangleBorder(",q=s.d
if(q!==0)return r+s.a.k(0)+", "+s.b.k(0)+", "+B.d.P(s.c*100,1)+u.n+B.d.P(q*100,1)+"% oval)"
return r+s.a.k(0)+", "+s.b.k(0)+", "+B.d.P(s.c*100,1)+"% of the way to being a CircleBorder)"}}
A.d8.prototype={
ao(a,b){return new A.d8(this.a.ao(0,b))},
bF(a,b){var s,r=this
if(a instanceof A.d8)return new A.d8(A.ad(a.a,r.a,b))
if(a instanceof A.cp){s=A.ad(a.a,r.a,b)
return new A.d2(1-b,a.b,s)}if(a instanceof A.cj){s=A.ad(a.a,r.a,b)
return new A.d3(a.b,1-b,s)}return r.iB(a,b)},
bG(a,b){var s,r=this
if(a instanceof A.d8)return new A.d8(A.ad(r.a,a.a,b))
if(a instanceof A.cp){s=A.ad(r.a,a.a,b)
return new A.d2(b,a.b,s)}if(a instanceof A.cj){s=A.ad(r.a,a.a,b)
return new A.d3(a.b,b,s)}return r.iC(a,b)},
hX(a){return new A.d8(a==null?this.a:a)},
e1(a,b){var s=a.gfh()/2,r=$.ak().d7()
r.eH(A.a5i(a,new A.bc(s,s)))
return r},
f9(a,b,c){var s,r=this.a
switch(r.c.a){case 0:break
case 1:s=b.gfh()/2
a.cl(A.a5i(b,new A.bc(s,s)).cG(r.b*r.d/2),r.fJ())
break}},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.d8&&b.a.j(0,this.a)},
gt(a){var s=this.a
return A.J(s.a,s.b,s.c,s.d,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"StadiumBorder("+this.a.k(0)+")"}}
A.d2.prototype={
ao(a,b){return new A.d2(b,this.c,this.a.ao(0,b))},
bF(a,b){var s,r,q,p=this
if(a instanceof A.d8)return new A.d2(p.b*b,p.c,A.ad(a.a,p.a,b))
if(a instanceof A.cp){s=A.ad(a.a,p.a,b)
r=p.b
return new A.d2(r+(1-r)*(1-b),a.b,s)}if(a instanceof A.d2){s=A.ad(a.a,p.a,b)
r=A.E(a.b,p.b,b)
r.toString
q=A.E(a.c,p.c,b)
q.toString
return new A.d2(r,q,s)}return p.iB(a,b)},
bG(a,b){var s,r,q,p=this
if(a instanceof A.d8)return new A.d2(p.b*(1-b),p.c,A.ad(p.a,a.a,b))
if(a instanceof A.cp){s=A.ad(p.a,a.a,b)
r=p.b
return new A.d2(r+(1-r)*b,a.b,s)}if(a instanceof A.d2){s=A.ad(p.a,a.a,b)
r=A.E(p.b,a.b,b)
r.toString
q=A.E(p.c,a.c,b)
q.toString
return new A.d2(r,q,s)}return p.iC(a,b)},
yX(a){var s,r,q,p,o,n,m,l,k=this.b
if(k===0||a.c-a.a===a.d-a.b)return a
s=a.c
r=a.a
q=s-r
p=a.d
o=a.b
n=p-o
m=1-this.c
if(q<n){l=k*((n-q)/2)*m
return new A.B(r,o+l,s,p-l)}else{l=k*((q-n)/2)*m
return new A.B(r+l,o,s-l,p)}},
kv(a){var s,r,q,p=A.a3J(a.gfh()/2),o=this.c
if(o!==0){s=a.c-a.a
r=a.d-a.b
q=this.b
o=0.5+o/2
if(s<r){o=A.kT(p,A.uV(new A.bc(s/2,o*r/2)),q)
o.toString
return o}else{o=A.kT(p,A.uV(new A.bc(o*s/2,r/2)),q)
o.toString
return o}}return p},
e1(a,b){var s=$.ak().d7()
s.eH(this.kv(a).dj(this.yX(a)))
return s},
hX(a){var s=a==null?this.a:a
return new A.d2(this.b,this.c,s)},
f9(a,b,c){var s=this.a
switch(s.c.a){case 0:break
case 1:a.cl(this.kv(b).dj(this.yX(b)).cG(s.b*s.d/2),s.fJ())
break}},
j(a,b){if(b==null)return!1
if(J.L(b)!==A.x(this))return!1
return b instanceof A.d2&&b.a.j(0,this.a)&&b.b===this.b},
gt(a){return A.J(this.a,this.b,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s=this,r=s.c
if(r!==0)return"StadiumBorder("+s.a.k(0)+", "+B.d.P(s.b*100,1)+u.n+B.d.P(r*100,1)+"% oval)"
return"StadiumBorder("+s.a.k(0)+", "+B.d.P(s.b*100,1)+"% of the way to being a CircleBorder)"}}
A.d3.prototype={
ao(a,b){var s=this.a.ao(0,b)
return new A.d3(this.b.V(0,b),b,s)},
bF(a,b){var s,r,q,p=this
if(a instanceof A.d8)return new A.d3(p.b,p.c*b,A.ad(a.a,p.a,b))
if(a instanceof A.cj){s=p.c
return new A.d3(p.b,s+(1-s)*(1-b),A.ad(a.a,p.a,b))}if(a instanceof A.d3){s=A.ad(a.a,p.a,b)
r=A.eY(a.b,p.b,b)
r.toString
q=A.E(a.c,p.c,b)
q.toString
return new A.d3(r,q,s)}return p.iB(a,b)},
bG(a,b){var s,r,q,p=this
if(a instanceof A.d8)return new A.d3(p.b,p.c*(1-b),A.ad(p.a,a.a,b))
if(a instanceof A.cj){s=p.c
return new A.d3(p.b,s+(1-s)*b,A.ad(p.a,a.a,b))}if(a instanceof A.d3){s=A.ad(p.a,a.a,b)
r=A.eY(p.b,a.b,b)
r.toString
q=A.E(p.c,a.c,b)
q.toString
return new A.d3(r,q,s)}return p.iC(a,b)},
kv(a){var s=a.gfh()/2
s=A.eY(this.b,A.uV(new A.bc(s,s)),1-this.c)
s.toString
return s},
e1(a,b){var s=$.ak().d7()
s.eH(this.kv(a).T(b).dj(a))
return s},
hX(a){var s=a==null?this.a:a
return new A.d3(this.b,this.c,s)},
f9(a,b,c){var s=this.a
switch(s.c.a){case 0:break
case 1:a.cl(this.kv(b).T(c).dj(b).cG(s.b*s.d/2),s.fJ())
break}},
j(a,b){var s=this
if(b==null)return!1
if(J.L(b)!==A.x(s))return!1
return b instanceof A.d3&&b.a.j(0,s.a)&&b.b.j(0,s.b)&&b.c===s.c},
gt(a){return A.J(this.a,this.b,this.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"StadiumBorder("+this.a.k(0)+", "+this.b.k(0)+", "+B.d.P(this.c*100,1)+"% of the way to being a RoundedRectangleBorder)"}}
A.qQ.prototype={
E(){return"TextOverflow."+this.b}}
A.jM.prototype={
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(b instanceof A.jM)if(b.a.j(0,r.a))if(b.b===r.b)s=b.c==r.c
else s=!1
else s=!1
else s=!1
return s},
gt(a){var s=this
return A.J(s.a,s.b,s.d,s.c,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){return"PlaceholderDimensions("+this.a.k(0)+", "+A.h(this.d)+")"}}
A.Ax.prototype={
E(){return"TextWidthBasis."+this.b}}
A.As.prototype={
a1(){var s=this,r=s.a
if(r!=null)r.m()
s.dy=s.dx=s.a=null},
soE(a,b){var s,r,q=this
if(J.e(q.d,b))return
s=q.d
s=s==null?null:s.a
if(!J.e(s,b.a)){s=q.CW
if(s!=null)s.m()
q.CW=null}s=q.d
s=s==null?null:s.aB(0,b)
r=s==null?B.bi:s
q.d=b
q.e=null
s=r.a
if(s>=3)q.a1()
else if(s>=2)q.b=!0},
suz(a,b){if(this.f===b)return
this.f=b
this.a1()},
sbI(a){var s,r=this
if(r.r===a)return
r.r=a
r.a1()
s=r.CW
if(s!=null)s.m()
r.CW=null},
suA(a){var s,r=this
if(r.w===a)return
r.w=a
r.a1()
s=r.CW
if(s!=null)s.m()
r.CW=null},
sPs(a){if(this.x==a)return
this.x=a
this.a1()},
stI(a,b){if(J.e(this.y,b))return
this.y=b
this.a1()},
stM(a){if(this.z==a)return
this.z=a
this.a1()},
suB(a){if(this.as===a)return
this.as=a
this.a1()},
pb(a){if(a==null||a.length===0||A.cR(a,this.ch))return
this.ch=a
this.a1()},
I4(a){var s,r,q,p,o,n,m,l,k,j,i,h,g=this,f=null,e=g.d.a
if(e==null)e=f
else{s=g.f
r=g.r
if(r==null)r=a
q=g.w
p=g.z
o=g.at
n=g.x
m=g.y
l=e.at
o=l==null?f:new A.Ap(l)
k=e.w
j=e.x
i=e.d
h=e.r
if(h==null)h=14
e=e.as
e=A.a1X(n,i,h*q,j,k,e,m,p,f,s,r,o)}if(e==null){e=g.f
s=g.r
if(s==null)s=a
r=g.w
q=g.z
p=g.at
p=A.a1X(g.x,f,14*r,f,f,f,g.y,q,f,e,s,p)
e=p}return e},
I3(){return this.I4(null)},
gbk(a){var s=this.as,r=this.a
s=s===B.Gt?r.gBM():r.gbk(r)
return Math.ceil(s)},
dw(a){var s
switch(a.a){case 0:s=this.a
return s.gnb(s)
case 1:s=this.a
return s.gQY(s)}},
wV(){var s,r,q=this,p=q.d
if(p==null)throw A.d(A.Y("TextPainter.text must be set to a non-null value before using the TextPainter."))
s=q.I3()
r=$.ak().Aq(s)
s=q.w
p.A3(r,q.ch,s)
q.ay=r.gSk()
q.a=r.aH()
q.b=!1},
xQ(a,b){var s,r,q=this
q.a.jt(new A.jJ(b))
if(a!==b){switch(q.as.a){case 1:s=Math.ceil(q.a.gBM())
break
case 0:s=Math.ceil(q.a.gRR())
break
default:s=null}s=A.T(s,a,b)
r=q.a
if(s!==Math.ceil(r.gbk(r)))q.a.jt(new A.jJ(s))}},
tG(a,b){var s=this,r=s.a==null
if(!r&&b===s.cx&&a===s.cy)return
if(s.b||r)s.wV()
s.cx=b
s.cy=a
s.dy=s.dx=null
s.xQ(b,a)
s.ax=s.a.oO()},
Rz(){return this.tG(1/0,0)},
aJ(a,b){var s,r=this,q=r.cx,p=r.cy
if(r.a==null||q==null||p==null)throw A.d(A.Y("TextPainter.paint called when text geometry was not yet calculated.\nPlease call layout() before paint() to position the text before painting it."))
if(r.b){r.wV()
r.xQ(q,p)}s=r.a
s.toString
a.i3(s,b)},
m(){var s=this,r=s.CW
if(r!=null)r.m()
s.CW=null
r=s.a
if(r!=null)r.m()
s.d=s.a=null}}
A.qS.prototype={
gAu(a){return this.e},
guS(){return!0},
hp(a,b){t.Y.b(a)},
A3(a,b,c){var s,r,q,p,o=this.a,n=o!=null
if(n)a.Cg(o.Do(c))
o=this.b
if(o!=null)try{a.rz(o)}catch(q){o=A.ac(q)
if(o instanceof A.ef){s=o
r=A.ar(q)
A.dd(new A.bm(s,r,"painting library",A.ba("while building a TextSpan"),null,!1))
a.rz("\ufffd")}else throw q}o=this.c
if(o!=null)for(p=0;p<1;++p)o[p].A3(a,b,c)
if(n)a.fa()},
aO(a){var s,r
if(this.b!=null)if(!a.$1(this))return!1
s=this.c
if(s!=null)for(r=0;r<1;++r)if(!s[r].aO(a))return!1
return!0},
Dn(a,b){var s,r,q,p,o=this.b
if(o==null)return null
s=a.b
r=a.a
q=b.a
p=q+o.length
if(!(q===r&&s===B.ap))if(!(q<r&&r<p))o=p===r&&s===B.cd
else o=!0
else o=!0
if(o)return this
b.a=p
return null},
Ad(a,b,c){var s,r,q=this.b
if(q!=null){s=A.b([],t.ve)
a.push(A.a4A(q,null,null,s))}q=this.c
if(q!=null)for(r=0;r<1;++r)q[r].Ad(a,b,!1)},
Oy(a){return this.Ad(a,null,!1)},
aB(a,b){var s,r,q,p,o,n=this
if(n===b)return B.c6
if(A.x(b)!==A.x(n))return B.bi
if(b.b==n.b){s=n.c==null?null:1
s=s!=(b.c==null?null:1)||n.a==null!==(b.a==null)}else s=!0
if(s)return B.bi
s=n.a
if(s!=null){r=b.a
r.toString
q=s.aB(0,r)
p=q.a>0?q:B.c6
if(p===B.bi)return p}else p=B.c6
s=n.c
if(s!=null)for(r=b.c,o=0;o<1;++o){q=s[o].aB(0,r[o])
if(q.a>p.a)p=q
if(p===B.bi)return p}return p},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
if(!s.EE(0,b))return!1
return b instanceof A.qS&&b.b==s.b&&s.e.j(0,b.e)&&A.cR(b.c,s.c)},
gt(a){var s=this,r=null,q=A.et.prototype.gt.call(s,s),p=s.c
p=p==null?r:A.cY(p)
return A.J(q,s.b,r,r,r,r,s.e,p,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
bs(){return"TextSpan"},
$iae:1,
$ih8:1,
gtY(){return null},
gtZ(){return null}}
A.n.prototype={
gi8(){return this.e},
giX(a){return this.d},
nn(a1,a2,a3,a4,a5,a6,a7,a8,a9,b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,c0,c1,c2,c3,c4,c5){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this,a0=a.ay
if(a0==null&&b6==null)s=a3==null?a.b:a3
else s=null
r=a.ch
if(r==null&&a1==null)q=a2==null?a.c:a2
else q=null
p=b2==null?a.r:b2
o=b5==null?a.w:b5
n=b9==null?a.y:b9
m=c5==null?a.z:c5
l=c4==null?a.Q:c4
k=b7==null?a.as:b7
j=b8==null?a.at:b8
a0=b6==null?a0:b6
r=a1==null?r:a1
i=c3==null?a.dy:c3
h=b4==null?a.fx:b4
g=a5==null?a.CW:a5
f=a6==null?a.cx:a6
e=a7==null?a.cy:a7
d=a8==null?a.db:a8
c=a9==null?a.giX(a):a9
b=b0==null?a.gi8():b0
return A.Au(r,q,s,null,g,f,e,d,c,b,a.fr,p,a.x,h,o,a0,k,a.a,j,n,a.ax,a.fy,a.f,i,l,m)},
eN(a){return this.nn(null,null,a,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)},
Am(a,b){return this.nn(null,null,a,null,null,null,null,null,null,null,null,b,null,null,null,null,null,null,null,null,null,null,null,null,null)},
ON(a){return this.nn(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,a,null,null,null,null,null,null)},
br(a4){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3
if(a4==null)return this
if(!a4.a)return a4
s=a4.b
r=a4.c
q=a4.r
p=a4.w
o=a4.x
n=a4.y
m=a4.z
l=a4.Q
k=a4.as
j=a4.at
i=a4.ax
h=a4.ay
g=a4.ch
f=a4.dy
e=a4.fr
d=a4.fx
c=a4.CW
b=a4.cx
a=a4.cy
a0=a4.db
a1=a4.giX(a4)
a2=a4.e
a3=a4.f
return this.nn(g,r,s,null,c,b,a,a0,a1,a2,e,q,o,d,p,h,k,j,n,i,a4.fy,a3,f,l,m)},
Do(a){var s,r,q=this,p=q.gi8(),o=q.r
o=o==null?null:o*a
s=q.ch
if(s==null){s=q.c
if(s!=null){r=$.ak().b9()
r.sad(0,s)
s=r}else s=null}return A.a5O(s,q.b,q.CW,q.cx,q.cy,q.db,q.d,p,q.fr,o,q.x,q.fx,q.w,q.ay,q.as,q.at,q.y,q.ax,q.dy,q.Q,q.z)},
aB(a,b){var s=this
if(s===b)return B.c6
if(s.a!==b.a||s.d!=b.d||s.r!=b.r||s.w!=b.w||s.y!=b.y||s.z!=b.z||s.Q!=b.Q||s.as!=b.as||s.at!=b.at||s.ay!=b.ay||s.ch!=b.ch||!A.cR(s.dy,b.dy)||!A.cR(s.fr,b.fr)||!A.cR(s.fx,b.fx)||!A.cR(s.gi8(),b.gi8())||!1)return B.bi
if(!J.e(s.b,b.b)||!J.e(s.c,b.c)||!J.e(s.CW,b.CW)||!J.e(s.cx,b.cx)||s.cy!=b.cy||s.db!=b.db)return B.B8
return B.c6},
j(a,b){var s,r=this
if(b==null)return!1
if(r===b)return!0
if(J.L(b)!==A.x(r))return!1
if(b instanceof A.n)if(b.a===r.a)if(J.e(b.b,r.b))if(J.e(b.c,r.c))if(b.r==r.r)if(b.w==r.w)if(b.y==r.y)if(b.z==r.z)if(b.Q==r.Q)if(b.as==r.as)if(b.at==r.at)if(b.ay==r.ay)if(b.ch==r.ch)if(A.cR(b.dy,r.dy))if(A.cR(b.fr,r.fr))if(A.cR(b.fx,r.fx))if(J.e(b.CW,r.CW))if(J.e(b.cx,r.cx))if(b.cy==r.cy)if(b.db==r.db)if(b.d==r.d)if(A.cR(b.gi8(),r.gi8()))s=!0
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
else s=!1
return s},
gt(a){var s,r=this,q=null,p=r.gi8(),o=p==null?q:A.cY(p),n=A.J(r.cy,r.db,r.d,o,r.f,r.fy,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a),m=r.dy,l=r.fx
o=m==null?q:A.cY(m)
s=l==null?q:A.cY(l)
return A.J(r.a,r.b,r.c,r.r,r.w,r.x,r.y,r.z,r.Q,r.as,r.at,r.ax,r.ay,r.ch,o,q,s,r.CW,r.cx,n)},
bs(){return"TextStyle"}}
A.FR.prototype={}
A.SG.prototype={
k(a){return"Simulation"}}
A.Vw.prototype={
k(a){return"Tolerance(distance: \xb1"+A.h(this.a)+", time: \xb10.001, velocity: \xb1"+A.h(this.c)+")"}}
A.lM.prototype={
tl(){var s=this,r=s.ry$
r===$&&A.f()
r=r.e
r.toString
r.srM(s.As())
if(s.ry$.e.v$!=null)s.Dv()},
tr(){},
tn(){},
As(){var s,r=$.cz(),q=r.w
if(q==null){s=self.window.devicePixelRatio
q=s===0?1:s}return new A.AY(r.gjy().cf(0,q),q)},
Kp(){var s,r=this
if($.as().a.c){if(r.to$==null){s=r.ry$
s===$&&A.f()
r.to$=s.AS()}}else{s=r.to$
if(s!=null)s.m()
r.to$=null}},
DM(a){var s,r=this
if(a){if(r.to$==null){s=r.ry$
s===$&&A.f()
r.to$=s.AS()}}else{s=r.to$
if(s!=null)s.m()
r.to$=null}},
KE(a){B.AI.kj("first-frame",null,!1,t.H)},
Kn(a,b,c){var s=this.ry$
s===$&&A.f()
s=s.as
if(s!=null)s.Sj(a,b,null)},
Kr(){var s,r=this.ry$
r===$&&A.f()
r=r.e
r.toString
s=t.O
s.a(A.F.prototype.gaW.call(r)).ay.F(0,r)
s.a(A.F.prototype.gaW.call(r)).jC()},
Kv(a){var s=this.ry$
s===$&&A.f()
s.e.toString
s=$.cF;(s==null?$.cF=A.hQ():s).Tt(a)},
Kt(){var s=this.ry$
s===$&&A.f()
s.e.kK()},
K0(a){this.t5()
this.MA()},
MA(){$.cl.ax$.push(new A.R6(this))},
zU(){--this.x2$
if(!this.xr$)this.ve()},
t5(){var s=this,r=s.ry$
r===$&&A.f()
r.PX()
s.ry$.PW()
s.ry$.PY()
if(s.xr$||s.x2$===0){s.ry$.e.Ow()
s.ry$.PZ()
s.xr$=!0}},
$iae:1,
$icN:1}
A.R6.prototype={
$1(a){var s=this.a,r=s.rx$
r.toString
s=s.ry$
s===$&&A.f()
r.Tq(s.e.gQV())},
$S:3}
A.aC.prototype={
kQ(a,b,c,d){var s=this,r=d==null?s.a:d,q=b==null?s.b:b,p=c==null?s.c:c
return new A.aC(r,q,p,a==null?s.d:a)},
OU(a,b){return this.kQ(null,null,a,b)},
OT(a,b){return this.kQ(null,a,null,b)},
OS(a,b){return this.kQ(a,null,b,null)},
Aj(a){return this.kQ(a,null,null,null)},
OO(a){return this.kQ(null,a,null,null)},
Ax(a){var s=this,r=a.gBl(),q=a.gc4(a)+a.gcg(a),p=Math.max(0,s.a-r),o=Math.max(0,s.c-q)
return new A.aC(p,Math.max(p,s.b-r),o,Math.max(o,s.d-q))},
la(a){var s=this,r=a.a,q=a.b,p=a.c,o=a.d
return new A.aC(A.T(s.a,r,q),A.T(s.b,r,q),A.T(s.c,p,o),A.T(s.d,p,o))},
CF(a,b){var s,r,q=this,p=b==null,o=q.a,n=p?o:A.T(b,o,q.b),m=q.b
p=p?m:A.T(b,o,m)
o=a==null
m=q.c
s=o?m:A.T(a,m,q.d)
r=q.d
return new A.aC(n,p,s,o?r:A.T(a,m,r))},
uD(a){return this.CF(null,a)},
uC(a){return this.CF(a,null)},
b8(a){var s=this
return new A.S(A.T(a.a,s.a,s.b),A.T(a.b,s.c,s.d))},
OA(a){var s,r,q,p,o,n=this,m=n.a,l=n.b
if(m>=l&&n.c>=n.d)return new A.S(A.T(0,m,l),A.T(0,n.c,n.d))
s=a.a
r=a.b
q=s/r
if(s>l){r=l/q
s=l}p=n.d
if(r>p){s=p*q
r=p}if(s<m){r=m/q
s=m}o=n.c
if(r<o){s=o*q
r=o}return new A.S(A.T(s,m,l),A.T(r,o,p))},
V(a,b){var s=this
return new A.aC(s.a*b,s.b*b,s.c*b,s.d*b)},
cf(a,b){var s=this
return new A.aC(s.a/b,s.b/b,s.c/b,s.d/b)},
gRp(){var s=this,r=s.a
if(r>=0)if(r<=s.b){r=s.c
r=r>=0&&r<=s.d}else r=!1
else r=!1
return r},
j(a,b){var s=this
if(b==null)return!1
if(s===b)return!0
if(J.L(b)!==A.x(s))return!1
return b instanceof A.aC&&b.a===s.a&&b.b===s.b&&b.c===s.c&&b.d===s.d},
gt(a){var s=this
return A.J(s.a,s.b,s.c,s.d,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a,B.a)},
k(a){var s,r=this,q=r.gRp()?"":"; NOT NORMALIZED",p=r.a
if(p===1/0&&r.c===1/0)return"BoxConstraints(biggest"+q+")"
if(p===0&&r.b===1/0&&r.c===0&&r.d===1/0)return"BoxConstraints(unconstrained"+q+")"
s=new A.Iz()
return"BoxConstraints("+s.$3(p,r.b,"w")+", "+s.$3(r.c,r.d,"h")+q+")"}}
A.Iz.prototype={
$3(a,b,c){if(a===b)return c+"="+B.d.P(a,1)
return B.d.P(a,1)+"<="+c+"<="+B.d.P(b,1)},
$S:193}
A.hL.prototype={
zS(a,b,c){if(c!=null){c=A.OI(A.a5c(c))
if(c==null)return!1}return this.rA(a,b,c)},
n8(a,b,c){var s,r=b==null,q=r?c:c.W(0,b)
r=!r
if(r)this.c.push(new A.DT(new A.z(-b.a,-b.b)))
s=a.$2(this,q)
if(r)this.C5()
return s},
rA(a,b,c){var s,r=c==null,q=r?b:A.fk(c,b)
r=!r
if(r)this.c.push(new A.Dp(c))
s=a.$2(this,q)
if(r)this.C5()
return s}}
A.kW.prototype={
k(a){return"<optimized out>#"+A.bW(this.a)+"@"+this.c.k(0)}}
A.ds.prototype={
k(a){return"offset="+this.a.k(0)}}
A.nL.prototype={}
A.H.prototype={
fQ(a){if(!(a.e instanceof A.ds))a.e=new A.ds(B.h)},
fM(a){var s,r=this.k1
if(r==null)r=this.k1=A.y(t.np,t.DB)
s=r.bh(0,a,new A.QK(this,a))
return s},
bC(a){return B.A},
giv(){var s=this.k3
return new A.B(0,0,0+s.a,0+s.b)},
oP(a,b){var s=null
try{s=this.hE(a)}finally{}if(s==null&&!b)return this.k3.b
return s},
Dc(a){return this.oP(a,!1)},
hE(a){var s=this,r=s.k4
if(r==null)r=s.k4=A.y(t.E7,t.u6)
r.bh(0,a,new A.QJ(s,a))
return s.k4.i(0,a)},
dw(a){return null},
HG(){var s,r=this,q=r.k4,p=q==null
if(!(!p&&q.a!==0)){s=r.id
if(!(s!=null&&s.a!==0)){s=r.k1
s=s!=null&&s.a!==0}else s=!0}else s=!0
if(s){if(!p)q.M(0)
q=r.id
if(q!=null)q.M(0)
q=r.k1
if(q!=null)q.M(0)
return!0}return!1},
a1(){var s=this
if(s.HG()&&s.c instanceof A.O){s.o5()
return}s.Fc()},
cU(a,b){var s,r=this
if(r.k3!=null)if(!a.j(0,A.O.prototype.gbl.call(r))){s=r.k4
s=s!=null&&s.a!==0}else s=!1
else s=!1
if(s){s=r.k4
if(s!=null)s.M(0)}r.Fb(a,b)},
jt(a){return this.cU(a,!1)},
or(){this.k3=this.bC(A.O.prototype.gbl.call(this))},
bA(){},
bj(a,b){var s=this
if(s.k3.B(0,b))if(s.cF(a,b)||s.hs(b)){a.F(0,new A.kW(b,s))
return!0}return!1},
hs(a){return!1},
cF(a,b){return!1},
eh(a,b){var s,r=a.e
r.toString
s=t.x.a(r).a
b.aA(0,s.a,s.b)},
Dp(a){var s,r,q,p,o,n=this.e2(0,null)
if(n.hW(n)===0)return B.h
s=new A.dE(new Float64Array(3))
s.e4(0,0,1)
r=new A.dE(new Float64Array(3))
r.e4(0,0,0)
q=n.fG(r)
r=new A.dE(new Float64Array(3))
r.e4(0,0,1)
p=n.fG(r).W(0,q)
r=new A.dE(new Float64Array(3))
r.e4(a.a,a.b,0)
o=n.fG(r)
r=o.W(0,p.Dt(s.AG(o)/s.AG(p))).a
return new A.z(r[0],r[1])},
gue(){var s=this.k3
return new A.B(0,0,0+s.a,0+s.b)},
hp(a,b){this.Fa(a,b)}}
A.QK.prototype={
$0(){return this.a.bC(this.b)},
$S:194}
A.QJ.prototype={
$0(){return this.a.dw(this.b)},
$S:195}
A.ct.prototype={
Pd(a){var s,r,q,p=this.aS$
for(s=A.t(this).h("ct.1?");p!=null;){r=s.a(p.e)
q=p.hE(a)
if(q!=null)return q+r.a.b
p=r.an$}return null},
Aw(a){var s,r,q,p,o=this.aS$
for(s=A.t(this).h("ct.1"),r=null;o!=null;){q=o.e
q.toString
s.a(q)
p=o.hE(a)
if(p!=null){p+=q.a.b
r=r!=null?Math.min(r,p):p}o=q.an$}return r},
rV(a,b){var s,r,q={},p=q.a=this.eU$
for(s=A.t(this).h("ct.1");p!=null;p=r){p=p.e
p.toString
s.a(p)
if(a.n8(new A.QI(q,b,p),p.a,b))return!0
r=p.dA$
q.a=r}return!1},
kV(a,b){var s,r,q,p,o,n=this.aS$
for(s=A.t(this).h("ct.1"),r=b.a,q=b.b;n!=null;){p=n.e
p.toString
s.a(p)
o=p.a
a.fF(n,new A.z(o.a+r,o.b+q))
n=p.an$}}}
A.QI.prototype={
$2(a,b){return this.a.a.bj(a,b)},
$S:16}
A.rn.prototype={
ab(a){this.EZ(0)}}
A.dV.prototype={
k(a){return this.md(0)+"; id="+A.h(this.e)}}
A.P6.prototype={
cH(a,b){var s,r=this.b.i(0,a)
r.cU(b,!0)
s=r.k3
s.toString
return s},
cW(a,b){var s=this.b.i(0,a).e
s.toString
t.wU.a(s).a=b},
Ho(a,b){var s,r,q,p,o,n,m=this,l=m.b
try{m.b=A.y(t.K,t.BS)
for(r=t.wU,q=b;q!=null;q=n){p=q.e
p.toString
s=r.a(p)
p=m.b
p.toString
o=s.e
o.toString
p.l(0,o,q)
n=s.an$}m.oq(a)}finally{m.b=l}},
k(a){return"MultiChildLayoutDelegate"}}
A.z_.prototype={
fQ(a){if(!(a.e instanceof A.dV))a.e=new A.dV(null,null,B.h)},
srX(a){var s=this,r=s.S
if(r===a)return
if(A.x(a)!==A.x(r)||a.jT(r))s.a1()
s.S=a
s.b!=null},
aw(a){this.FQ(a)},
ab(a){this.FR(0)},
bC(a){return a.b8(new A.S(A.T(1/0,a.a,a.b),A.T(1/0,a.c,a.d)))},
bA(){var s=this,r=A.O.prototype.gbl.call(s)
r=r.b8(new A.S(A.T(1/0,r.a,r.b),A.T(1/0,r.c,r.d)))
s.k3=r
s.S.Ho(r,s.aS$)},
aJ(a,b){this.kV(a,b)},
cF(a,b){return this.rV(a,b)}}
A.tb.prototype={
aw(a){var s,r,q
this.fl(a)
s=this.aS$
for(r=t.wU;s!=null;){s.aw(a)
q=s.e
q.toString
s=r.a(q).an$}},
ab(a){var s,r,q
this.e7(0)
s=this.aS$
for(r=t.wU;s!=null;){s.ab(0)
q=s.e
q.toString
s=r.a(q).an$}}}
A.EP.prototype={}
A.vt.prototype={
Y(a,b){var s=this.a
return s==null?null:s.Y(0,b)},
I(a,b){var s=this.a
return s==null?null:s.I(0,b)},
Bj(a){return null},
k(a){var s=A.bW(this),r=this.a
r=r==null?null:r.k(0)
if(r==null)r=""
return"<optimized out>#"+s+"("+r+")"}}
A.z0.prototype={
soo(a){var s=this.u
if(s==a)return
this.u=a
this.wZ(a,s)},
sB3(a){var s=this.N
if(s==a)return
this.N=a
this.wZ(a,s)},
wZ(a,b){var s=this,r=a==null
if(r)s.aa()
else if(b==null||A.x(a)!==A.x(b)||a.ix(b))s.aa()
if(s.b!=null){if(b!=null)b.I(0,s.gdg())
if(!r)a.Y(0,s.gdg())}if(r){if(s.b!=null)s.b5()}else if(b==null||A.x(a)!==A.x(b)||a.ix(b))s.b5()},
sSm(a){if(this.a9.j(0,a))return
this.a9=a
this.a1()},
aw(a){var s,r=this
r.k5(a)
s=r.u
if(s!=null)s.Y(0,r.gdg())
s=r.N
if(s!=null)s.Y(0,r.gdg())},
ab(a){var s=this,r=s.u
if(r!=null)r.I(0,s.gdg())
r=s.N
if(r!=null)r.I(0,s.gdg())
s.iE(0)},
cF(a,b){var s=this.N
if(s!=null){s=s.Bj(b)
s=s===!0}else s=!1
if(s)return!0
return this.pu(a,b)},
hs(a){var s=this.u
if(s!=null){s=s.Bj(a)
s=s!==!1}else s=!1
return s},
bA(){this.pv()
this.b5()},
kO(a){return a.b8(this.a9)},
yd(a,b,c){var s
A.bM("debugPreviousCanvasSaveCount")
a.cp(0)
if(!b.j(0,B.h))a.aA(0,b.a,b.b)
s=this.k3
s.toString
c.aJ(a,s)
a.co(0)},
aJ(a,b){var s,r,q=this
if(q.u!=null){s=a.gb7(a)
r=q.u
r.toString
q.yd(s,b,r)
q.yN(a)}q.fm(a,b)
if(q.N!=null){s=a.gb7(a)
r=q.N
r.toString
q.yd(s,b,r)
q.yN(a)}},
yN(a){},
eO(a){this.hH(a)
this.cb=null
this.eZ=null
a.a=!1},
nc(a,b,c){var s,r,q,p,o=this
o.ep=A.a5m(o.ep,B.kB)
o.fB=A.a5m(o.fB,B.kB)
s=o.ep
r=s!=null&&!s.gK(s)
s=o.fB
q=s!=null&&!s.gK(s)
s=A.b([],t.R)
if(r){p=o.ep
p.toString
B.b.H(s,p)}B.b.H(s,c)
if(q){p=o.fB
p.toString
B.b.H(s,p)}o.F9(a,b,s)},
kK(){this.vV()
this.fB=this.ep=null}}
A.Jo.prototype={}
A.z3.prototype={
GL(a){var s,r,q,p,o=this
try{r=o.S
if(r!==""){q=$.a8k()
s=$.ak().Aq(q)
s.Cg($.a8l())
s.rz(r)
r=s.aH()
o.v!==$&&A.uw()
o.v=r}else{o.v!==$&&A.uw()
o.v=null}}catch(p){}},
giz(){return!0},
hs(a){return!0},
bC(a){return a.b8(B.Cj)},
aJ(a,b){var s,r,q,p,o,n,m,l,k,j,i=this
try{p=a.gb7(a)
o=i.k3
n=b.a
m=b.b
l=o.a
o=o.b
k=$.ak().b9()
k.sad(0,$.a8j())
p.bS(new A.B(n,m,n+l,m+o),k)
p=i.v
p===$&&A.f()
if(p!=null){s=i.k3.a
r=0
q=0
if(s>328){s-=128
r+=64}p.jt(new A.jJ(s))
if(i.k3.b>96+p.gbe(p)+12)q+=96
a.gb7(a).i3(p,b.U(0,new A.z(r,q)))}}catch(j){}}}
A.Mc.prototype={
E(){return"FlexFit."+this.b}}
A.f8.prototype={
k(a){return this.md(0)+"; flex="+A.h(this.e)+"; fit="+A.h(this.f)}}
A.xu.prototype={
E(){return"MainAxisSize."+this.b}}
A.xt.prototype={
E(){return"MainAxisAlignment."+this.b}}
A.jb.prototype={
E(){return"CrossAxisAlignment."+this.b}}
A.z5.prototype={
fQ(a){if(!(a.e instanceof A.f8))a.e=new A.f8(null,null,B.h)},
dw(a){if(this.S===B.bp)return this.Aw(a)
return this.Pd(a)},
ms(a){switch(this.S.a){case 0:return a.b
case 1:return a.a}},
mu(a){switch(this.S.a){case 0:return a.a
case 1:return a.b}},
bC(a){var s
if(this.az===B.k7)return B.A
s=this.wP(a,A.HB())
switch(this.S.a){case 0:return a.b8(new A.S(s.a,s.b))
case 1:return a.b8(new A.S(s.b,s.a))}},
wP(a2,a3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c=this,b=null,a=c.S===B.bp?a2.b:a2.d,a0=a<1/0,a1=c.aS$
for(s=t.uc,r=a2.b,q=a2.d,p=b,o=0,n=0,m=0;a1!=null;){l=a1.e
l.toString
s.a(l)
k=l.e
if(k==null)k=0
if(k>0){o+=k
p=a1}else{if(c.az===B.k6)switch(c.S.a){case 0:j=A.kV(q,b)
break
case 1:j=A.kV(b,r)
break
default:j=b}else switch(c.S.a){case 0:j=new A.aC(0,1/0,0,q)
break
case 1:j=new A.aC(0,r,0,1/0)
break
default:j=b}i=a3.$2(a1,j)
m+=c.mu(i)
n=Math.max(n,A.kE(c.ms(i)))}a1=l.an$}h=Math.max(0,(a0?a:0)-m)
if(o>0){g=a0?h/o:0/0
a1=c.aS$
for(f=0;a1!=null;){l=a1.e
l.toString
k=s.a(l).e
if(k==null)k=0
if(k>0){if(a0)e=a1===p?h-f:g*k
else e=1/0
d=A.bM("minChildExtent")
l=a1.e
l.toString
l=s.a(l).f
switch((l==null?B.wo:l).a){case 0:if(d.b!==d)A.U(A.Op(d.a))
d.b=e
break
case 1:if(d.b!==d)A.U(A.Op(d.a))
d.b=0
break}if(c.az===B.k6)switch(c.S.a){case 0:l=d.b
if(l===d)A.U(A.fi(d.a))
j=new A.aC(l,e,q,q)
break
case 1:l=d.b
if(l===d)A.U(A.fi(d.a))
j=new A.aC(r,r,l,e)
break
default:j=b}else switch(c.S.a){case 0:l=d.b
if(l===d)A.U(A.fi(d.a))
j=new A.aC(l,e,0,q)
break
case 1:l=d.b
if(l===d)A.U(A.fi(d.a))
j=new A.aC(0,r,l,e)
break
default:j=b}i=a3.$2(a1,j)
m+=c.mu(i)
f+=e
n=Math.max(n,A.kE(c.ms(i)))}l=a1.e
l.toString
a1=s.a(l).an$}}return new A.Yb(a0&&c.a0===B.pw?a:m,n,m)},
bA(){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this,a0=A.O.prototype.gbl.call(a),a1=a.wP(a0,A.HC()),a2=a1.a,a3=a1.b
if(a.az===B.k7){s=a.aS$
for(r=t.uc,q=0,p=0,o=0;s!=null;){n=a.bv
n.toString
m=s.oP(n,!0)
if(m!=null){q=Math.max(q,m)
p=Math.max(m,p)
o=Math.max(s.k3.b-m,o)
a3=Math.max(p+o,a3)}n=s.e
n.toString
s=r.a(n).an$}}else q=0
switch(a.S.a){case 0:r=a.k3=a0.b8(new A.S(a2,a3))
a2=r.a
a3=r.b
break
case 1:r=a.k3=a0.b8(new A.S(a3,a2))
a2=r.b
a3=r.a
break}l=a2-a1.c
a.bU=Math.max(0,-l)
k=Math.max(0,l)
j=A.bM("leadingSpace")
i=A.bM("betweenSpace")
r=A.a79(a.S,a.aq,a.aM)
h=r===!1
switch(a.v.a){case 0:j.sc0(0)
i.sc0(0)
break
case 1:j.sc0(k)
i.sc0(0)
break
case 2:j.sc0(k/2)
i.sc0(0)
break
case 3:j.sc0(0)
r=a.da$
i.sc0(r>1?k/(r-1):0)
break
case 4:r=a.da$
i.sc0(r>0?k/r:0)
j.sc0(i.b0()/2)
break
case 5:r=a.da$
i.sc0(r>0?k/(r+1):0)
j.sc0(i.b0())
break}g=h?a2-j.b0():j.b0()
s=a.aS$
for(r=t.uc,n=a3/2,f=i.a;s!=null;){e=s.e
e.toString
r.a(e)
d=a.az
switch(d.a){case 0:case 1:if(A.a79(A.ahx(a.S),a.aq,a.aM)===(d===B.k4))c=0
else{d=s.k3
d.toString
c=a3-a.ms(d)}break
case 2:d=s.k3
d.toString
c=n-a.ms(d)/2
break
case 3:c=0
break
case 4:if(a.S===B.bp){d=a.bv
d.toString
m=s.oP(d,!0)
c=m!=null?q-m:0}else c=0
break
default:c=null}if(h){d=s.k3
d.toString
g-=a.mu(d)}switch(a.S.a){case 0:e.a=new A.z(g,c)
break
case 1:e.a=new A.z(c,g)
break}if(h){d=i.b
if(d===i)A.U(A.fi(f))
g-=d}else{d=s.k3
d.toString
d=a.mu(d)
b=i.b
if(b===i)A.U(A.fi(f))
g+=d+b}s=e.an$}},
cF(a,b){return this.rV(a,b)},
aJ(a,b){var s,r,q,p=this
if(!(p.bU>1e-10)){p.kV(a,b)
return}s=p.k3
if(s.gK(s))return
s=p.bV
r=p.cx
r===$&&A.f()
q=p.k3
s.saI(0,a.ot(r,b,new A.B(0,0,0+q.a,0+q.b),p.gPe(),p.c_,s.a))},
m(){this.bV.saI(0,null)
this.FS()},
kY(a){var s
switch(this.c_.a){case 0:return null
case 1:case 2:case 3:if(this.bU>1e-10){s=this.k3
s=new A.B(0,0,0+s.a,0+s.b)}else s=null
return s}},
bs(){var s=this.Fe()
return s}}
A.Yb.prototype={}
A.EQ.prototype={
aw(a){var s,r,q
this.fl(a)
s=this.aS$
for(r=t.uc;s!=null;){s.aw(a)
q=s.e
q.toString
s=r.a(q).an$}},
ab(a){var s,r,q
this.e7(0)
s=this.aS$
for(r=t.uc;s!=null;){s.ab(0)
q=s.e
q.toString
s=r.a(q).an$}}}
A.ER.prototype={}
A.tc.prototype={
m(){var s,r,q
for(s=this.PM$,r=s.length,q=0;q<r;++q)s[q].m()
this.hI()}}
A.nj.prototype={
k(a){return"AnnotationEntry(annotation: "+this.a.k(0)+", localPosition: "+this.b.k(0)+")"}}
A.uE.prototype={}
A.oQ.prototype={
fn(){},
n2(a){var s,r=this
r.e+=a
s=t.ow
if(s.a(A.F.prototype.gar.call(r,r))!=null)s.a(A.F.prototype.gar.call(r,r)).n2(a)},
kh(a){var s,r,q
for(s=this.d,s=A.at(s.gaF(s),!0,t.Q),r=s.length,q=0;q<r;++q)s[q].$0()},
m(){var s=this.z
if(s!=null)s.m()
this.z=null},
cV(){if(this.y)return
this.y=!0},
sfv(a){var s,r=this,q=r.z
if(q!=null)q.m()
r.z=a
q=t.ow
if(q.a(A.F.prototype.gar.call(r,r))!=null){q.a(A.F.prototype.gar.call(r,r)).toString
s=!0}else s=!1
if(s)q.a(A.F.prototype.gar.call(r,r)).cV()},
oK(){this.y=this.y||!1},
j5(a){var s
this.cV()
s=a.e
if(s!==0)this.n2(-s)
this.pj(a)},
jA(a){var s,r,q=this,p=t.ow.a(A.F.prototype.gar.call(q,q))
if(p!=null){s=q.as
r=q.Q
if(s==null)p.CW=r
else s.Q=r
r=q.Q
if(r==null)p.cx=s
else r.as=s
q.Q=q.as=null
p.j5(q)
q.w.saI(0,null)}},
dB(a,b,c){return!1},
B_(a,b,c){var s=A.b([],c.h("v<nj<0>>"))
this.dB(new A.uE(s,c.h("uE<0>")),b,!0,c)
return s.length===0?null:B.b.gG(s).a},
H1(a){var s,r=this
if(!r.y&&r.z!=null){s=r.z
s.toString
a.NR(s)
return}r.eI(a)
r.y=!1},
bs(){var s=this.Es()
return s+(this.b==null?" DETACHED":"")}}
A.xj.prototype={
saI(a,b){var s=this.a
if(b==null?s==null:b===s)return
if(s!=null)if(--s.x===0)s.m()
this.a=b
if(b!=null)++b.x},
k(a){var s=this.a
return"LayerHandle("+(s!=null?J.dq(s):"DISPOSED")+")"}}
A.yA.prototype={
sC3(a){var s
this.cV()
s=this.cx
if(s!=null)s.m()
this.cx=a},
m(){this.sC3(null)
this.vJ()},
eI(a){var s=this.cx
s.toString
a.NP(B.h,s,this.cy,this.db)},
dB(a,b,c){return!1}}
A.yt.prototype={
eI(a){a.NO(this.cx,this.CW)
a.DL(this.cy)
a.DE(!1)
a.DD(!1)},
dB(a,b,c){return!1}}
A.dt.prototype={
kh(a){var s
this.EM(a)
if(!a)return
s=this.CW
for(;s!=null;){s.kh(!0)
s=s.Q}},
O7(a){var s=this
s.oK()
s.eI(a)
if(s.e>0)s.kh(!0)
s.y=!1
return a.aH()},
m(){this.uu()
this.d.M(0)
this.vJ()},
oK(){var s,r=this
r.EN()
s=r.CW
for(;s!=null;){s.oK()
r.y=r.y||s.y
s=s.Q}},
dB(a,b,c,d){var s,r,q
for(s=this.cx,r=a.a;s!=null;s=s.as){if(s.dB(a,b,!0,d))return!0
q=r.length
if(q!==0)return!1}return!1},
aw(a){var s
this.pi(a)
s=this.CW
for(;s!=null;){s.aw(a)
s=s.Q}},
ab(a){var s
this.e7(0)
s=this.CW
for(;s!=null;){s.ab(0)
s=s.Q}this.kh(!1)},
eJ(a,b){var s,r=this
r.cV()
s=b.e
if(s!==0)r.n2(s)
r.vB(b)
s=b.as=r.cx
if(s!=null)s.Q=b
r.cx=b
if(r.CW==null)r.CW=b
b.w.saI(0,b)},
uu(){var s,r,q,p=this,o=p.CW
for(s=t.ow;o!=null;o=r){r=o.Q
o.Q=o.as=null
p.cV()
q=o.e
if(q!==0){q=-q
p.e+=q
if(s.a(A.F.prototype.gar.call(p,p))!=null)s.a(A.F.prototype.gar.call(p,p)).n2(q)}p.pj(o)
o.w.saI(0,null)}p.cx=p.CW=null},
eI(a){this.hN(a)},
hN(a){var s=this.CW
for(;s!=null;){s.H1(a)
s=s.Q}}}
A.fp.prototype={
sBW(a,b){if(!b.j(0,this.p1))this.cV()
this.p1=b},
dB(a,b,c,d){return this.jY(a,b.W(0,this.p1),!0,d)},
eI(a){var s=this,r=s.p1
s.sfv(a.Ce(r.a,r.b,t.cV.a(s.z)))
s.hN(a)
a.fa()}}
A.nF.prototype={
dB(a,b,c,d){if(!this.p1.B(0,b))return!1
return this.jY(a,b,!0,d)},
eI(a){var s=this,r=s.p1
r.toString
s.sfv(a.Su(r,s.p2,t.CW.a(s.z)))
s.hN(a)
a.fa()}}
A.nE.prototype={
dB(a,b,c,d){if(!this.p1.B(0,b))return!1
return this.jY(a,b,!0,d)},
eI(a){var s=this,r=s.p1
r.toString
s.sfv(a.Ss(r,s.p2,t.cB.a(s.z)))
s.hN(a)
a.fa()}}
A.nD.prototype={
dB(a,b,c,d){if(!this.p1.B(0,b))return!1
return this.jY(a,b,!0,d)},
eI(a){var s=this,r=s.p1
r.toString
s.sfv(a.Sr(r,s.p2,t.xS.a(s.z)))
s.hN(a)
a.fa()}}
A.qZ.prototype={
saQ(a,b){var s=this
if(b.j(0,s.a3))return
s.a3=b
s.ca=!0
s.cV()},
eI(a){var s,r,q=this
q.al=q.a3
if(!q.p1.j(0,B.h)){s=q.p1
s=A.a4R(s.a,s.b,0)
r=q.al
r.toString
s.ce(0,r)
q.al=s}q.sfv(a.Sw(q.al.a,t.Al.a(q.z)))
q.hN(a)
a.fa()},
N6(a){var s,r=this
if(r.ca){s=r.a3
s.toString
r.bM=A.OI(A.a5c(s))
r.ca=!1}s=r.bM
if(s==null)return null
return A.fk(s,a)},
dB(a,b,c,d){var s=this.N6(b)
if(s==null)return!1
return this.ES(a,s,!0,d)}}
A.y3.prototype={
szV(a,b){var s=this,r=s.a3
if(b!=r){if(b===255||r===255)s.sfv(null)
s.a3=b
s.cV()}},
eI(a){var s,r,q,p=this
if(p.CW==null){p.sfv(null)
return}s=p.a3
s.toString
r=p.p1
q=p.z
if(s<255)p.sfv(a.Sv(s,r,t.i6.a(q)))
else p.sfv(a.Ce(r.a,r.b,t.cV.a(q)))
p.hN(a)
a.fa()}}
A.ni.prototype={
dB(a,b,c,d){var s,r,q,p=this,o=p.jY(a,b,!0,d),n=a.a
if(n.length!==0&&!0)return o
s=p.p2
if(s!=null){r=p.p3
q=r.a
r=r.b
s=!new A.B(q,r,q+s.a,r+s.b).B(0,b)}else s=!1
if(s)return o
if(A.aW(p.$ti.c)===A.aW(d)){o=o||!1
n.push(new A.nj(d.a(p.p1),b.W(0,p.p3),d.h("nj<0>")))}return o}}
A.D9.prototype={}
A.DD.prototype={
SV(a){var s=this.a
this.a=a
return s},
k(a){var s="<optimized out>#",r=A.bW(this.b),q=this.a.a
return s+A.bW(this)+"("+("latestEvent: "+(s+r))+", "+("annotations: [list of "+q+"]")+")"}}
A.DE.prototype={
gft(a){var s=this.c
return s.gft(s)}}
A.xK.prototype={
xE(a){var s,r,q,p,o,n,m=t.mC,l=A.ib(null,null,m,t.rA)
for(s=a.a,r=s.length,q=0;q<s.length;s.length===r||(0,A.P)(s),++q){p=s[q]
o=p.a
if(m.b(o)){n=p.b
n.toString
l.l(0,o,n)}}return l},
ID(a,b){var s=a.b,r=s.gaX(s)
s=a.b
if(!this.b.X(0,s.gft(s)))return A.ib(null,null,t.mC,t.rA)
return this.xE(b.$1(r))},
xt(a){var s,r
A.acm(a)
s=a.b
r=A.t(s).h("aS<1>")
this.a.Q9(a.gft(a),a.d,A.lx(new A.aS(s,r),new A.P2(),r.h("p.E"),t.oR))},
Tw(a,b){var s,r,q,p,o
if(a.gcT(a)!==B.c5)return
if(t.zs.b(a))return
s=t.yg.b(a)?A.a4t():b.$0()
r=a.gft(a)
q=this.b
p=q.i(0,r)
if(!A.acn(p,a))return
o=q.a
new A.P5(this,p,a,r,s).$0()
if(o!==0!==(q.a!==0))this.bf()},
Tq(a){new A.P3(this,a).$0()}}
A.P2.prototype={
$1(a){return a.gAu(a)},
$S:196}
A.P5.prototype={
$0(){var s=this
new A.P4(s.a,s.b,s.c,s.d,s.e).$0()},
$S:0}
A.P4.prototype={
$0(){var s,r,q,p,o,n=this,m=null,l=n.b
if(l==null){s=n.c
if(t.yg.b(s))return
n.a.b.l(0,n.d,new A.DD(A.ib(m,m,t.mC,t.rA),s))}else{s=n.c
if(t.yg.b(s))n.a.b.A(0,s.gft(s))}r=n.a
q=r.b.i(0,n.d)
if(q==null){l.toString
q=l}p=q.b
q.b=s
o=t.yg.b(s)?A.ib(m,m,t.mC,t.rA):r.xE(n.e)
r.xt(new A.DE(q.SV(o),o,p,s))},
$S:0}
A.P3.prototype={
$0(){var s,r,q,p,o,n,m,l
for(s=this.a,r=s.b,r=r.gaF(r),r=new A.dw(J.an(r.a),r.b),q=this.b,p=A.t(r).z[1];r.q();){o=r.a
if(o==null)o=p.a(o)
n=o.b
m=s.ID(o,q)
l=o.a
o.a=m
s.xt(new A.DE(l,m,n,null))}},
$S:0}
A.P0.prototype={
$2(a,b){var s
if(!this.a.X(0,a))if(a.guS()&&a.gtZ(a)!=null){s=a.gtZ(a)
s.toString
s.$1(this.b.a8(this.c.i(0,a)))}},
$S:197}
A.P1.prototype={
$1(a){return!this.a.X(0,a)},
$S:198}
A.GP.prototype={}
A.cK.prototype={
ab(a){},
k(a){return"<none>"}}
A.lE.prototype={
fF(a,b){var s,r=this
if(a.gdf()){r.jX()
if(!a.cy){s=a.ay
s===$&&A.f()
s=!s}else s=!0
if(s)A.a54(a,null,!0)
else if(a.db)A.acD(a)
s=a.ch.a
s.toString
t.cY.a(s)
s.sBW(0,b)
r.rD(s)}else{s=a.ay
s===$&&A.f()
if(s){a.ch.saI(0,null)
a.qR(r,b)}else a.qR(r,b)}},
rD(a){a.jA(0)
this.a.eJ(0,a)},
gb7(a){var s,r,q=this
if(q.e==null){q.c=A.acG(q.b)
s=$.ak()
r=s.P1()
q.d=r
q.e=s.OX(r,null)
r=q.c
r.toString
q.a.eJ(0,r)}s=q.e
s.toString
return s},
jX(){var s,r=this
if(r.e==null)return
s=r.c
s.toString
s.sC3(r.d.Py())
r.e=r.d=r.c=null},
vl(){var s=this.c
if(s!=null)if(!s.cy){s.cy=!0
s.cV()}},
lM(a,b,c,d){var s,r=this
if(a.CW!=null)a.uu()
r.jX()
r.rD(a)
s=r.OY(a,d==null?r.b:d)
b.$2(s,c)
s.jX()},
Cc(a,b,c){return this.lM(a,b,c,null)},
OY(a,b){return new A.lE(a,b)},
ot(a,b,c,d,e,f){var s,r,q=this
if(e===B.F){d.$2(q,b)
return null}s=c.cO(b)
if(a){if(f==null){r=new A.nF(B.aD,A.y(t.S,t.Q),A.aj())
r.fn()}else r=f
if(!s.j(0,r.p1)){r.p1=s
r.cV()}if(e!==r.p2){r.p2=e
r.cV()}q.lM(r,d,b,s)
return r}else{q.Oo(s,e,s,new A.PG(q,d,b))
return null}},
St(a,b,c,d,e,f,g){var s,r,q,p=this
if(f===B.F){e.$2(p,b)
return null}s=c.cO(b)
r=d.cO(b)
if(a){if(g==null){q=new A.nE(B.jU,A.y(t.S,t.Q),A.aj())
q.fn()}else q=g
if(!r.j(0,q.p1)){q.p1=r
q.cV()}if(f!==q.p2){q.p2=f
q.cV()}p.lM(q,e,b,s)
return q}else{p.Om(r,f,s,new A.PF(p,e,b))
return null}},
Cb(a,b,c,d,e,f,g){var s,r,q,p=this
if(f===B.F){e.$2(p,b)
return null}s=c.cO(b)
r=d.cO(b)
if(a){if(g==null){q=new A.nD(B.jU,A.y(t.S,t.Q),A.aj())
q.fn()}else q=g
if(r!==q.p1){q.p1=r
q.cV()}if(f!==q.p2){q.p2=f
q.cV()}p.lM(q,e,b,s)
return q}else{p.Ol(r,f,s,new A.PE(p,e,b))
return null}},
ou(a,b,c,d,e){var s,r=this,q=b.a,p=b.b,o=A.a4R(q,p,0)
o.ce(0,c)
o.aA(0,-q,-p)
if(a){s=e==null?A.a5X(null):e
s.saQ(0,o)
r.lM(s,d,b,A.a4V(o,r.b))
return s}else{q=r.gb7(r)
q.cp(0)
q.a6(0,o.a)
d.$2(r,b)
r.gb7(r).co(0)
return null}},
Sx(a,b,c,d){return this.ou(a,b,c,d,null)},
Cf(a,b,c,d){var s=d==null?A.a53():d
s.szV(0,b)
s.sBW(0,a)
this.Cc(s,c,B.h)
return s},
k(a){return"PaintingContext#"+A.eB(this)+"(layer: "+this.a.k(0)+", canvas bounds: "+this.b.k(0)+")"}}
A.PG.prototype={
$0(){return this.b.$2(this.a,this.c)},
$S:0}
A.PF.prototype={
$0(){return this.b.$2(this.a,this.c)},
$S:0}
A.PE.prototype={
$0(){return this.b.$2(this.a,this.c)},
$S:0}
A.Je.prototype={}
A.Sn.prototype={
m(){var s,r=this.b
if(r!=null)this.a.as.I(0,r)
r=this.a
if(--r.at===0){s=r.as
s.b.M(0)
s.c.M(0)
s.d.M(0)
s.fS()
r.as=null
r.d.$0()}}}
A.yB.prototype={
jC(){this.a.$0()},
sT4(a){var s=this.e
if(s===a)return
if(s!=null)s.ab(0)
this.e=a
a.aw(this)},
PX(){var s,r,q,p,o,n,m,l,k,j,i,h=this
try{for(p=t.O,o=t.By;n=h.r,n.length!==0;){s=n
h.r=A.b([],o)
n=s
m=new A.PR()
if(!!n.immutable$list)A.U(A.N("sort"))
l=n.length-1
if(l-0<=32)A.A4(n,0,l,m)
else A.A3(n,0,l,m)
for(r=0;r<J.bA(s);++r){if(h.f){h.f=!1
n=h.r
if(n.length!==0){m=s
l=r
k=J.bA(s)
A.cC(l,k,J.bA(m))
j=A.aA(m)
i=new A.eJ(m,l,k,j.h("eJ<1>"))
i.py(m,l,k,j.c)
B.b.H(n,i)
break}}q=J.aX(s,r)
if(q.z){n=q
n=p.a(A.F.prototype.gaW.call(n))===h}else n=!1
if(n)q.L1()}h.f=!1}}finally{h.f=!1}},
PW(){var s,r,q,p,o=this.y
B.b.ex(o,new A.PQ())
for(s=o.length,r=t.O,q=0;q<o.length;o.length===s||(0,A.P)(o),++q){p=o[q]
if(p.CW&&r.a(A.F.prototype.gaW.call(p))===this)p.zo()}B.b.M(o)},
PY(){var s,r,q,p,o,n,m,l,k
try{s=this.z
this.z=A.b([],t.By)
for(q=s,J.aa0(q,new A.PS()),p=q.length,o=t.O,n=t.cY,m=0;m<q.length;q.length===p||(0,A.P)(q),++m){r=q[m]
if(r.cy||r.db){l=r
l=o.a(A.F.prototype.gaW.call(l))===this}else l=!1
if(l)if(r.ch.a.b!=null)if(r.cy)A.a54(r,null,!1)
else{l=r
k=l.ch.a
k.toString
l.lX(n.a(k))
l.db=!1}else r.MP()}}finally{}},
PA(a){var s,r=this
if(++r.at===1){s=t.ju
r.as=new A.qp(r.c,A.bb(s),A.y(t.S,s),A.bb(s),$.bN())
r.b.$0()}if(a!=null)r.as.Y(0,a)
return new A.Sn(r,a)},
AS(){return this.PA(null)},
PZ(){var s,r,q,p,o,n,m,l,k=this
if(k.as==null)return
try{q=k.ay
p=A.at(q,!0,A.t(q).c)
B.b.ex(p,new A.PT())
s=p
q.M(0)
for(q=s,o=q.length,n=t.O,m=0;m<q.length;q.length===o||(0,A.P)(q),++m){r=q[m]
if(r.dy){l=r
l=n.a(A.F.prototype.gaW.call(l))===k}else l=!1
if(l)r.No()}k.as.DC()}finally{}}}
A.PR.prototype={
$2(a,b){return a.a-b.a},
$S:27}
A.PQ.prototype={
$2(a,b){return a.a-b.a},
$S:27}
A.PS.prototype={
$2(a,b){return b.a-a.a},
$S:27}
A.PT.prototype={
$2(a,b){return a.a-b.a},
$S:27}
A.O.prototype={
am(){var s=this
s.cx=s.gdf()||s.gkF()
s.ay=s.gdf()},
m(){this.ch.saI(0,null)},
fQ(a){if(!(a.e instanceof A.cK))a.e=new A.cK()},
hO(a){var s=this
s.fQ(a)
s.a1()
s.lz()
s.b5()
s.vB(a)},
j5(a){var s=this
a.wB()
a.e.ab(0)
a.e=null
s.pj(a)
s.a1()
s.lz()
s.b5()},
aO(a){},
mR(a,b,c){A.dd(new A.bm(b,c,"rendering library",A.ba("during "+a+"()"),new A.QR(this),!1))},
aw(a){var s=this
s.pi(a)
if(s.z&&s.Q!=null){s.z=!1
s.a1()}if(s.CW){s.CW=!1
s.lz()}if(s.cy&&s.ch.a!=null){s.cy=!1
s.aa()}if(s.dy&&s.gr4().a){s.dy=!1
s.b5()}},
gbl(){var s=this.at
if(s==null)throw A.d(A.Y("A RenderObject does not have any constraints before it has been laid out."))
return s},
a1(){var s,r=this
if(r.z)return
s=r.Q
if(s==null){r.z=!0
if(r.c!=null)r.o5()
return}if(s!==r)r.o5()
else{r.z=!0
s=t.O
if(s.a(A.F.prototype.gaW.call(r))!=null){s.a(A.F.prototype.gaW.call(r)).r.push(r)
s.a(A.F.prototype.gaW.call(r)).jC()}}},
o5(){this.z=!0
var s=this.c
s.toString
t.d.a(s)
if(!this.as)s.a1()},
wB(){var s=this
if(s.Q!==s){s.Q=null
s.aO(A.a7N())}},
M9(){var s,r,q=this,p=q.Q
if(p===q)return
s=t.B2.a(q.c)
r=s==null?null:s.Q
if(r!=p){q.Q=r
q.aO(A.a7O())}},
L1(){var s,r,q,p=this
try{p.bA()
p.b5()}catch(q){s=A.ac(q)
r=A.ar(q)
p.mR("performLayout",s,r)}p.z=!1
p.aa()},
cU(a,b){var s,r,q,p,o,n,m,l,k=this
if(b)if(!k.giz()){o=a.a>=a.b&&a.c>=a.d||!(k.c instanceof A.O)
n=o}else n=!0
else n=!0
if(n)m=k
else{o=k.c
o.toString
o=t.d.a(o).Q
o.toString
m=o}if(!k.z&&a.j(0,k.at)){if(m!==k.Q){k.Q=m
k.aO(A.a7O())}return}k.at=a
o=k.Q
if(o!=null&&m!==o)k.aO(A.a7N())
k.Q=m
if(k.giz())try{k.or()}catch(l){s=A.ac(l)
r=A.ar(l)
k.mR("performResize",s,r)}try{k.bA()
k.b5()}catch(l){q=A.ac(l)
p=A.ar(l)
k.mR("performLayout",q,p)}k.z=!1
k.aa()},
giz(){return!1},
gdf(){return!1},
gkF(){return!1},
lX(a){return a==null?A.acz(B.h):a},
lz(){var s,r,q,p=this
if(p.CW)return
s=p.CW=!0
r=p.c
if(r instanceof A.O){if(r.CW)return
q=p.ay
q===$&&A.f()
if((q?!p.gdf():s)&&!r.gdf()){r.lz()
return}}s=t.O
if(s.a(A.F.prototype.gaW.call(p))!=null)s.a(A.F.prototype.gaW.call(p)).y.push(p)},
zo(){var s,r,q=this
if(!q.CW)return
s=q.cx
s===$&&A.f()
q.cx=!1
q.aO(new A.QS(q))
if(q.gdf()||q.gkF())q.cx=!0
if(!q.gdf()){r=q.ay
r===$&&A.f()}else r=!1
if(r){q.db=q.cy=!1
s=t.O.a(A.F.prototype.gaW.call(q))
if(s!=null)B.b.A(s.z,q)
q.CW=!1
q.aa()}else if(s!==q.cx){q.CW=!1
q.aa()}else q.CW=!1},
aa(){var s,r=this
if(r.cy)return
r.cy=!0
if(r.gdf()){s=r.ay
s===$&&A.f()}else s=!1
if(s){s=t.O
if(s.a(A.F.prototype.gaW.call(r))!=null){s.a(A.F.prototype.gaW.call(r)).z.push(r)
s.a(A.F.prototype.gaW.call(r)).jC()}}else{s=r.c
if(s instanceof A.O)s.aa()
else{s=t.O
if(s.a(A.F.prototype.gaW.call(r))!=null)s.a(A.F.prototype.gaW.call(r)).jC()}}},
RM(){var s,r=this
if(r.db||r.cy)return
r.db=!0
if(r.gdf()){s=r.ay
s===$&&A.f()}else s=!1
if(s){s=t.O
if(s.a(A.F.prototype.gaW.call(r))!=null){s.a(A.F.prototype.gaW.call(r)).z.push(r)
s.a(A.F.prototype.gaW.call(r)).jC()}}else r.aa()},
MP(){var s,r=this.c
for(;r instanceof A.O;){if(r.gdf()){s=r.ch.a
if(s==null)break
if(s.b!=null)break
r.cy=!0}r=r.c}},
qR(a,b){var s,r,q,p=this
if(p.z)return
p.db=p.cy=!1
p.ay=p.gdf()
try{p.aJ(a,b)}catch(q){s=A.ac(q)
r=A.ar(q)
p.mR("paint",s,r)}},
aJ(a,b){},
eh(a,b){},
uh(a){return!0},
e2(a,b){var s,r,q,p,o,n,m,l,k=b==null
if(k){s=t.O.a(A.F.prototype.gaW.call(this)).e
if(s instanceof A.O)b=s}r=A.b([],t.By)
q=t.d
p=this
while(p!==b){r.push(p)
o=p.c
o.toString
q.a(o)
p=o}if(!k){b.toString
r.push(b)}n=new A.aT(new Float64Array(16))
n.cM()
for(m=r.length-1;m>0;m=l){l=m-1
r[m].eh(r[l],n)}return n},
kY(a){return null},
eO(a){},
p5(a){var s
if(t.O.a(A.F.prototype.gaW.call(this)).as==null)return
s=this.fr
if(s!=null&&!s.as)s.DB(a)
else{s=this.c
if(s!=null)t.d.a(s).p5(a)}},
gr4(){var s,r=this
if(r.dx==null){s=A.lT()
r.dx=s
r.eO(s)}s=r.dx
s.toString
return s},
kK(){this.dy=!0
this.fr=null
this.aO(new A.QT())},
b5(){var s,r,q,p,o,n,m=this
if(m.b==null||t.O.a(A.F.prototype.gaW.call(m)).as==null){m.dx=null
return}if(m.fr!=null){s=m.dx
s=s==null?null:s.a
r=s===!0}else r=!1
m.dx=null
q=m.gr4().a&&r
s=t.d
p=m
while(!0){if(!(!q&&p.c instanceof A.O))break
if(p!==m&&p.dy)break
p.dy=!0
o=p.c
o.toString
s.a(o)
if(o.dx==null){n=A.lT()
o.dx=n
o.eO(n)}q=o.dx.a
if(q&&o.fr==null)return
p=o}if(p!==m&&m.fr!=null&&m.dy)t.O.a(A.F.prototype.gaW.call(m)).ay.A(0,m)
if(!p.dy){p.dy=!0
s=t.O
if(s.a(A.F.prototype.gaW.call(m))!=null){s.a(A.F.prototype.gaW.call(m)).ay.F(0,p)
s.a(A.F.prototype.gaW.call(m)).jC()}}},
No(){var s,r,q,p,o,n,m=this,l=null
if(m.z)return
s=m.fr
if(s==null)s=l
else{s=t.aa.a(A.F.prototype.gar.call(s,s))
if(s==null)s=l
else s=s.at||s.as}r=t.sP.a(m.xm(s===!0))
q=A.b([],t.R)
s=m.fr
p=s==null
o=p?l:s.x
n=p?l:s.y
s=p?l:s.z
r.kM(s==null?0:s,n,o,q)
B.b.gjU(q)},
xm(a){var s,r,q,p,o,n,m,l,k=this,j={},i=k.gr4()
j.a=i.c
s=!i.d&&!i.a
r=t.yj
q=A.b([],r)
p=A.bb(t.sP)
k.fL(new A.QQ(j,k,a||i.p2,q,p,i,s))
for(o=A.iG(p,p.r),n=A.t(o).c;o.q();){m=o.d;(m==null?n.a(m):m).tJ()}k.dy=!1
if(!(k.c instanceof A.O)){o=j.a
l=new A.F5(A.b([],r),A.b([k],t.By),o)}else{o=j.a
if(s)l=new A.WY(A.b([],r),o)
else{l=new A.FI(a,i,A.b([],r),A.b([k],t.By),o)
if(i.a)l.x=!0}}l.H(0,q)
return l},
fL(a){this.aO(a)},
nc(a,b,c){a.jI(0,t.d1.a(c),b)},
hp(a,b){},
bs(){var s=A.bW(this)
return"<optimized out>#"+s},
k(a){return this.bs()},
m8(a,b,c,d){var s=this.c
if(s instanceof A.O)s.m8(a,b==null?this:b,c,d)},
DU(){return this.m8(B.b2,null,B.x,null)},
vp(a,b){return this.m8(B.b2,a,B.x,b)},
$iae:1}
A.QR.prototype={
$0(){var s=A.b([],t.p),r=this.a
s.push(A.a1o("The following RenderObject was being processed when the exception was fired",B.vX,r))
s.push(A.a1o("RenderObject",B.vY,r))
return s},
$S:11}
A.QS.prototype={
$1(a){var s
a.zo()
s=a.cx
s===$&&A.f()
if(s)this.a.cx=!0},
$S:25}
A.QT.prototype={
$1(a){a.kK()},
$S:25}
A.QQ.prototype={
$1(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e=a.xm(f.c)
if(e.a){B.b.M(f.d)
f.e.M(0)
if(!f.f.a)f.a.a=!0}for(s=e.gBr(),r=s.length,q=f.d,p=f.e,o=f.f,n=f.b,m=f.r,l=0;l<s.length;s.length===r||(0,A.P)(s),++l){k=s[l]
q.push(k)
k.b.push(n)
k.NT(o.a3)
if(o.b||!(n.c instanceof A.O)){k.tJ()
continue}if(k.ghV()==null||m)continue
if(!o.BA(k.ghV()))p.F(0,k)
j=q.length-1
for(i=0;i<j;++i){h=q[i]
g=k.ghV()
g.toString
if(!g.BA(h.ghV())){p.F(0,k)
p.F(0,h)}}}},
$S:25}
A.aw.prototype={
saC(a){var s=this,r=s.v$
if(r!=null)s.j5(r)
s.v$=a
if(a!=null)s.hO(a)},
jz(){var s=this.v$
if(s!=null)this.us(s)},
aO(a){var s=this.v$
if(s!=null)a.$1(s)}}
A.ei.prototype={$icK:1}
A.bk.prototype={
gA6(){return this.da$},
xK(a,b){var s,r,q,p=this,o=a.e
o.toString
s=A.t(p).h("bk.1")
s.a(o);++p.da$
if(b==null){o=o.an$=p.aS$
if(o!=null){o=o.e
o.toString
s.a(o).dA$=a}p.aS$=a
if(p.eU$==null)p.eU$=a}else{r=b.e
r.toString
s.a(r)
q=r.an$
if(q==null){o.dA$=b
p.eU$=r.an$=a}else{o.an$=q
o.dA$=b
o=q.e
o.toString
s.a(o).dA$=r.an$=a}}},
H(a,b){},
yr(a){var s,r,q,p,o=this,n=a.e
n.toString
s=A.t(o).h("bk.1")
s.a(n)
r=n.dA$
q=n.an$
if(r==null)o.aS$=q
else{p=r.e
p.toString
s.a(p).an$=q}q=n.an$
if(q==null)o.eU$=r
else{q=q.e
q.toString
s.a(q).dA$=r}n.an$=n.dA$=null;--o.da$},
RZ(a,b){var s=this,r=a.e
r.toString
if(A.t(s).h("bk.1").a(r).dA$==b)return
s.yr(a)
s.xK(a,b)
s.a1()},
jz(){var s,r,q,p=this.aS$
for(s=A.t(this).h("bk.1");p!=null;){r=p.a
q=this.a
if(r<=q){p.a=q+1
p.jz()}r=p.e
r.toString
p=s.a(r).an$}},
aO(a){var s,r,q=this.aS$
for(s=A.t(this).h("bk.1");q!=null;){a.$1(q)
r=q.e
r.toString
q=s.a(r).an$}},
gPS(a){return this.aS$}}
A.yT.prototype={
px(){this.a1()}}
A.Zw.prototype={}
A.WY.prototype={
H(a,b){B.b.H(this.b,b)},
gBr(){return this.b}}
A.kt.prototype={
gBr(){return A.b([this],t.yj)},
NT(a){var s
if(a==null||a.a===0)return
s=this.c;(s==null?this.c=A.bb(t.xJ):s).H(0,a)}}
A.F5.prototype={
kM(a,b,c,d){var s,r,q,p,o,n=this.b,m=B.b.gG(n)
if(m.fr==null){s=B.b.gG(n).gvo()
r=B.b.gG(n)
r=t.O.a(A.F.prototype.gaW.call(r)).as
r.toString
q=$.a11()
q=new A.bu(null,0,s,B.I,q.p2,q.e,q.p3,q.f,q.al,q.p4,q.R8,q.RG,q.rx,q.ry,q.to,q.x2,q.xr,q.y1)
q.aw(r)
m.fr=q}m=B.b.gG(n).fr
m.toString
m.sag(0,B.b.gG(n).giv())
p=A.b([],t.R)
for(n=this.e,s=n.length,o=0;o<n.length;n.length===s||(0,A.P)(n),++o)n[o].kM(0,b,c,p)
m.jI(0,p,null)
d.push(m)},
ghV(){return null},
tJ(){},
H(a,b){B.b.H(this.e,b)}}
A.FI.prototype={
kM(a,b,c,d){var s,r,q,p,o,n,m,l,k,j,i,h=this,g=null
if(!h.x){s=h.b
B.b.gG(s).fr=null
for(r=h.w,q=r.length,p=A.ab(s),o=p.c,p=p.h("eJ<1>"),n=0;n<r.length;r.length===q||(0,A.P)(r),++n){m=r[n]
l=new A.eJ(s,1,g,p)
l.py(s,1,g,o)
B.b.H(m.b,l)
m.kM(a+h.f.x2,b,c,d)}return}s=h.b
if(s.length>1){k=new A.Zx()
k.HS(c,b,s)}else k=g
r=h.e
q=!r
if(q){if(k==null)p=g
else{p=k.d
p===$&&A.f()
if(!p.gK(p)){p=k.c
p===$&&A.f()
p=p.BI()}else p=!0}p=p===!0}else p=!1
if(p)return
p=B.b.gG(s)
if(p.fr==null)p.fr=A.a26(g,B.b.gG(s).gvo())
j=B.b.gG(s).fr
j.sRn(r)
j.dx=h.c
j.z=a
if(a!==0){h.x9()
r=h.f
r.seQ(0,r.x2+a)}if(k!=null){r=k.d
r===$&&A.f()
j.sag(0,r)
r=k.c
r===$&&A.f()
j.saQ(0,r)
j.x=k.b
j.y=k.a
if(q&&k.e){h.x9()
h.f.aG(B.iD,!0)}}i=A.b([],t.R)
for(r=h.w,q=r.length,n=0;n<r.length;r.length===q||(0,A.P)(r),++n){m=r[n]
p=j.x
m.kM(0,j.y,p,i)}r=h.f
if(r.a)B.b.gG(s).nc(j,h.f,i)
else j.jI(0,i,r)
d.push(j)},
ghV(){return this.x?null:this.f},
H(a,b){var s,r,q,p,o,n,m=this
for(s=b.length,r=m.w,q=0;q<b.length;b.length===s||(0,A.P)(b),++q){p=b[q]
r.push(p)
if(p.ghV()==null)continue
if(!m.r){m.f=m.f.OK()
m.r=!0}o=m.f
n=p.ghV()
n.toString
o.NE(n)}},
x9(){var s,r,q=this
if(!q.r){s=q.f
r=A.lT()
r.a=s.a
r.b=s.b
r.c=s.c
r.d=s.d
r.p2=s.p2
r.y1=s.y1
r.id=s.id
r.p4=s.p4
r.RG=s.RG
r.R8=s.R8
r.rx=s.rx
r.ry=s.ry
r.x1=s.x1
r.to=s.to
r.x2=s.x2
r.xr=s.xr
r.al=s.al
r.a3=s.a3
r.y2=s.y2
r.af=s.af
r.ah=s.ah
r.ac=s.ac
r.f=s.f
r.k1=s.k1
r.k3=s.k3
r.k2=s.k2
r.k4=s.k4
r.ok=s.ok
r.p1=s.p1
r.e.H(0,s.e)
r.p3.H(0,s.p3)
q.f=r
q.r=!0}},
tJ(){this.x=!0}}
A.Zx.prototype={
HS(a,b,c){var s,r,q,p,o,n,m=this,l=new A.aT(new Float64Array(16))
l.cM()
m.c=l
m.b=a
m.a=b
for(s=c.length-1;s>0;){r=c[s];--s
q=c[s]
m.b=A.af4(m.b,r.kY(q))
l=$.a8U()
l.cM()
A.af3(r,q,m.c,l)
m.b=A.a6i(m.b,l)
m.a=A.a6i(m.a,l)}p=B.b.gG(c)
l=m.b
l=l==null?p.giv():l.eq(p.giv())
m.d=l
o=m.a
if(o!=null){n=o.eq(l)
if(n.gK(n)){l=m.d
l=!l.gK(l)}else l=!1
m.e=l
if(!l)m.d=n}}}
A.EU.prototype={}
A.fy.prototype={
k(a){var s=A.b(["offset="+this.a.k(0)],t.s)
s.push(this.md(0))
return B.b.bb(s,"; ")}}
A.q2.prototype={
fQ(a){if(!(a.e instanceof A.fy))a.e=new A.fy(null,null,B.h)},
soE(a,b){var s=this,r=s.S
switch(r.d.aB(0,b).a){case 0:case 1:return
case 2:r.soE(0,b)
s.a0=s.v=null
s.qe(b)
s.aa()
s.b5()
break
case 3:r.soE(0,b)
s.a0=s.v=s.bd=null
s.qe(b)
s.a1()
s.yu()
s.Ih()
s.Nn()
break}},
sCm(a){return},
Nn(){return},
yu(){return},
Ih(){var s,r,q,p=this.az
if(p==null)return
for(s=p.length,r=0;r<p.length;p.length===s||(0,A.P)(p),++r){q=p[r]
q.y2$=$.bN()
q.y1$=0}this.az=null},
a1(){var s=this.az
if(s!=null)B.b.Z(s,new A.QY())
this.F6()},
m(){var s=this
s.yu()
s.az=null
s.S.m()
s.hI()},
qe(a){this.aM=A.b([],t.e9)
a.aO(new A.QV(this))},
suz(a,b){var s=this.S
if(s.f===b)return
s.suz(0,b)
this.aa()},
sbI(a){var s=this.S
if(s.r===a)return
s.sbI(a)
this.a1()},
sDZ(a){if(this.bv===a)return
this.bv=a
this.a1()},
sSh(a,b){var s,r=this
if(r.bU===b)return
r.bU=b
s=b===B.cf?"\u2026":null
r.S.sPs(s)
r.a1()},
suA(a){var s=this.S
if(s.w===a)return
s.suA(a)
this.bd=null
this.a1()},
stM(a){var s=this.S,r=s.z
if(r==null?a==null:r===a)return
s.stM(a)
this.bd=null
this.a1()},
stI(a,b){var s=this.S
if(J.e(s.y,b))return
s.stI(0,b)
this.bd=null
this.a1()},
sE6(a){return},
suB(a){var s=this.S
if(s.as===a)return
s.suB(a)
this.bd=null
this.a1()},
sCE(a){return},
sDz(a){var s,r=this
if(J.e(r.c_,a))return
r.c_=a
s=r.az
s=s==null?null:B.b.hQ(s,new A.R_())
if(s===!0)r.aa()},
dw(a){this.qE(A.O.prototype.gbl.call(this))
return this.S.dw(B.u)},
hs(a){return!0},
cF(a,b){var s,r,q,p,o,n,m,l,k,j={},i=this.S,h=i.a.oT(b),g=i.d.Dm(h)
if(g!=null&&!0){a.F(0,new A.h3(t.kZ.a(g),t.Cq))
s=!0}else s=!1
r=j.a=this.aS$
q=A.t(this).h("bk.1")
p=t.lO
o=0
while(!0){if(!(r!=null&&o<i.ax.length))break
r=r.e
r.toString
p.a(r)
n=r.a
m=new Float64Array(16)
l=new A.aT(m)
l.cM()
m[14]=0
m[13]=n.b
m[12]=n.a
n=r.e
l.fO(0,n,n,n)
if(a.zS(new A.QX(j,b,r),b,l))return!0
r=j.a.e
r.toString
k=q.a(r).an$
j.a=k;++o
r=k}return s},
xR(a,b){var s=this.bv||this.bU===B.cf?a:1/0
this.S.tG(s,b)},
px(){var s=this,r=$.cl,q=r.CW$
switch(q.a){case 0:case 4:if(s.en)return
s.en=!0
r.vd(new A.R0(s,q))
break
case 1:case 2:case 3:s.vT()
s.S.a1()
break}},
qE(a){this.S.pb(this.dW)
this.xR(a.b,a.a)},
xP(a,b){var s,r,q,p,o,n,m,l,k,j=this,i=j.da$
if(i===0)return A.b([],t.aE)
s=j.aS$
r=A.aQ(i,B.B_,!1,t.cP)
q=new A.aC(0,a.b,0,1/0).cf(0,j.S.w)
for(i=A.t(j).h("bk.1"),p=!b,o=0;s!=null;){if(p){s.cU(q,!0)
n=s.k3
n.toString
m=j.aM
m===$&&A.f()
switch(m[o].gdP()){case B.is:l=s.Dc(j.aM[o].gO_())
break
case B.it:case B.iu:case B.d0:case B.iw:case B.iv:l=null
break
default:l=null}k=n}else{k=s.fM(q)
l=null}n=j.aM
n===$&&A.f()
r[o]=new A.jM(k,n[o].gdP(),l,j.aM[o].gO_())
n=s.e
n.toString
s=i.a(n).an$;++o}return r},
L0(a){return this.xP(a,!1)},
MG(){var s,r,q=this.aS$,p=t.lO,o=this.S,n=A.t(this).h("bk.1"),m=0
while(!0){if(!(q!=null&&m<o.ax.length))break
s=q.e
s.toString
p.a(s)
r=o.ax[m]
s.a=new A.z(r.a,r.b)
s.e=o.ay[m]
q=n.a(s).an$;++m}},
Hq(){var s,r,q=this.aM
q===$&&A.f()
s=q.length
r=0
for(;r<q.length;q.length===s||(0,A.P)(q),++r)switch(q[r].gdP()){case B.is:case B.it:case B.iu:return!1
case B.iv:case B.iw:case B.d0:continue}return!0},
bC(a){var s,r,q=this
if(!q.Hq())return B.A
s=q.S
s.pb(q.xP(a,!0))
q.xR(a.b,a.a)
r=s.gbk(s)
s=s.a
return a.b8(new A.S(r,Math.ceil(s.gbe(s))))},
bA(){var s,r,q,p,o,n,m,l,k,j,i=this,h=null,g=A.O.prototype.gbl.call(i)
i.dW=i.L0(g)
i.qE(g)
i.MG()
s=i.S
r=s.gbk(s)
q=s.a
q=Math.ceil(q.gbe(q))
p=s.a.gPk()
o=i.k3=g.b8(new A.S(r,q))
n=o.b<q||p
m=o.a<r
if(m||n)switch(i.bU.a){case 3:i.bV=!1
i.bd=null
break
case 0:case 2:i.bV=!0
i.bd=null
break
case 1:i.bV=!0
r=A.Vp(h,s.d.a,"\u2026")
q=s.r
q.toString
o=s.w
l=A.a2e(h,s.y,h,h,r,B.aU,q,h,o,B.aq)
l.Rz()
if(m){switch(s.r.a){case 0:k=l.gbk(l)
j=0
break
case 1:j=i.k3.a
k=j-l.gbk(l)
break
default:k=h
j=k}i.bd=A.a4r(new A.z(k,0),new A.z(j,0),A.b([B.i,B.jW],t.bk),h,B.dj)}else{j=i.k3.b
s=l.a
i.bd=A.a4r(new A.z(0,j-Math.ceil(s.gbe(s))/2),new A.z(0,j),A.b([B.i,B.jW],t.bk),h,B.dj)}l.m()
break}else{i.bV=!1
i.bd=null}},
aJ(a,b){var s,r,q,p,o,n,m,l,k,j,i,h,g,f=this,e={}
f.qE(A.O.prototype.gbl.call(f))
if(f.bV){s=f.k3
r=b.a
q=b.b
p=new A.B(r,q,r+s.a,q+s.b)
if(f.bd!=null)a.gb7(a).va(p,$.ak().b9())
else a.gb7(a).cp(0)
a.gb7(a).j0(p)}s=f.S
s.aJ(a.gb7(a),b)
r=e.a=f.aS$
q=t.lO
o=b.a
n=b.b
m=A.t(f).h("bk.1")
l=0
while(!0){if(!(r!=null&&l<s.ax.length))break
r=r.e
r.toString
q.a(r)
k=r.e
k.toString
j=f.cx
j===$&&A.f()
r=r.a
a.Sx(j,new A.z(o+r.a,n+r.b),A.xA(k,k,k),new A.QZ(e))
k=e.a.e
k.toString
i=m.a(k).an$
e.a=i;++l
r=i}if(f.bV){if(f.bd!=null){a.gb7(a).aA(0,o,n)
h=$.ak().b9()
h.sO3(B.tM)
h.sDO(f.bd)
s=a.gb7(a)
r=f.k3
s.bS(new A.B(0,0,0+r.a,0+r.b),h)}a.gb7(a).co(0)}s=f.az
if(s!=null)for(r=s.length,g=0;g<s.length;s.length===r||(0,A.P)(s),++g)s[g].aJ(a,b)
f.Fd(a,b)},
eO(a){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d=this
d.hH(a)
s=d.S
r=s.d
r.toString
q=A.b([],t.lF)
r.Oy(q)
d.de=q
if(B.b.hQ(q,new A.QW()))a.a=a.b=!0
else{r=d.v
if(r==null){p=new A.bS("")
o=A.b([],t.ve)
for(r=d.de,n=r.length,m=0,l=0,k="";l<r.length;r.length===n||(0,A.P)(r),++l){j=r[l]
i=j.b
if(i==null)i=j.a
for(k=j.f,h=k.length,g=0;g<k.length;k.length===h||(0,A.P)(k),++g){f=k[g]
e=f.a
o.push(f.Ag(new A.fz(m+e.a,m+e.b)))}k=p.a+=i
m+=i.length}r=d.v=new A.bX(k.charCodeAt(0)==0?k:k,o)}a.p4=r
a.d=!0
s=s.r
s.toString
a.y1=s}},
nc(b1,b2,b3){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,a0,a1,a2,a3,a4,a5,a6=this,a7=null,a8=A.b([],t.R),a9=a6.S,b0=a9.r
b0.toString
s=A.ib(a7,a7,t.qI,t.ju)
r=a6.a0
if(r==null){r=a6.de
r.toString
r=a6.a0=A.ah9(r)}for(q=r.length,p=b0,o=0,n=0,m=0;m<r.length;r.length===q||(0,A.P)(r),++m,n=k){l=r[m]
b0=l.a
k=n+b0.length
j=n<k
i=j?n:k
j=j?k:n
h=A.O.prototype.gbl.call(a6)
a9.pb(a6.dW)
g=h.b
g=a6.bv||a6.bU===B.cf?g:1/0
a9.tG(g,h.a)
f=a9.a.D9(i,j,B.tY,B.u_)
if(f.length===0)continue
j=B.b.gG(f)
e=new A.B(j.a,j.b,j.c,j.d)
d=B.b.gG(f).e
for(j=A.ab(f),i=new A.eJ(f,1,a7,j.h("eJ<1>")),i.py(f,1,a7,j.c),i=new A.cI(i,i.gn(i)),j=A.t(i).c;i.q();){h=i.d
if(h==null)h=j.a(h)
e=e.AW(new A.B(h.a,h.b,h.c,h.d))
d=h.e}j=e.a
i=Math.max(0,j)
h=e.b
g=Math.max(0,h)
j=Math.min(e.c-j,A.O.prototype.gbl.call(a6).b)
h=Math.min(e.d-h,A.O.prototype.gbl.call(a6).d)
c=Math.floor(i)-4
b=Math.floor(g)-4
j=Math.ceil(i+j)+4
h=Math.ceil(g+h)+4
a=new A.B(c,b,j,h)
a0=A.lT()
a1=o+1
a0.id=new A.pv(o,a7)
a0.d=!0
a0.y1=p
g=l.b
b0=g==null?b0:g
a0.p4=new A.bX(b0,l.f)
b0=b1.y
if(b0!=null){a2=b0.eq(a)
if(a2.a>=a2.c||a2.b>=a2.d)b0=!(c>=j||b>=h)
else b0=!1
a0.aG(B.iD,b0)}a3=A.bM("newChild")
b0=a6.cC
j=b0==null?a7:b0.a!==0
if(j===!0){b0.toString
j=new A.aS(b0,A.t(b0).h("aS<1>"))
a4=j.gO(j)
if(!a4.q())A.U(A.bt())
b0=b0.A(0,a4.gC(a4))
b0.toString
if(a3.b!==a3)A.U(A.Op(a3.a))
a3.b=b0}else{a5=new A.r1()
b0=A.a26(a5,a6.I6(a5))
if(a3.b!==a3)A.U(A.Op(a3.a))
a3.b=b0}if(b0===a3)A.U(A.fi(a3.a))
J.aa5(b0,a0)
if(!b0.w.j(0,a)){b0.w=a
b0.fp()}b0=a3.b
if(b0===a3)A.U(A.fi(a3.a))
j=b0.d
j.toString
s.l(0,j,b0)
b0=a3.b
if(b0===a3)A.U(A.fi(a3.a))
a8.push(b0)
o=a1
p=d}a6.cC=s
b1.jI(0,a8,b2)},
I6(a){return new A.QU(this,a)},
kK(){this.vV()
this.cC=null}}
A.QY.prototype={
$1(a){return a.x=null},
$S:202}
A.QV.prototype={
$1(a){return!0},
$S:51}
A.R_.prototype={
$1(a){var s=a.w
s===$&&A.f()
return s.c!==B.Br},
$S:203}
A.QX.prototype={
$2(a,b){return this.a.a.bj(a,b)},
$S:16}
A.R0.prototype={
$1(a){var s=this.a
s.en=!1
if(s.b!=null){s.vT()
s.S.a1()}},
$S:3}
A.QZ.prototype={
$2(a,b){var s=this.a.a
s.toString
a.fF(s,b)},
$S:10}
A.QW.prototype={
$1(a){return!1},
$S:204}
A.QU.prototype={
$0(){var s=this.a,r=s.cC.i(0,this.b)
r.toString
s.vp(s,r.w)},
$S:0}
A.te.prototype={
aw(a){var s,r,q
this.fl(a)
s=this.aS$
for(r=t.lO;s!=null;){s.aw(a)
q=s.e
q.toString
s=r.a(q).an$}},
ab(a){var s,r,q
this.e7(0)
s=this.aS$
for(r=t.lO;s!=null;){s.ab(0)
q=s.e
q.toString
s=r.a(q).an$}}}
A.EV.prototype={}
A.EW.prototype={
aw(a){this.FT(a)
$.ey.td$.a.F(0,this.gw2())},
ab(a){$.ey.td$.a.A(0,this.gw2())
this.FU(0)}}
A.ze.prototype={
sSg(a){if(a===this.S)return
this.S=a
this.aa()},
sSA(a){if(a===this.v)return
this.v=a
this.aa()},
sOg(a){return},
sOf(a){return},
giz(){return!0},
gkF(){return!0},
gKU(){var s=this.S,r=(s|1)>>>0>0||(s|2)>>>0>0?80:0
return(s|4)>>>0>0||(s|8)>>>0>0?r+80:r},
bC(a){return a.b8(new A.S(1/0,this.gKU()))},
aJ(a,b){var s=b.a,r=b.b,q=this.k3
q=new A.yt(new A.B(s,r,s+q.a,r+q.b),this.S,this.v,!1,!1,A.y(t.S,t.Q),A.aj())
q.fn()
a.jX()
a.rD(q)}}
A.zj.prototype={}
A.dZ.prototype={
fQ(a){if(!(a.e instanceof A.cK))a.e=new A.cK()},
bC(a){var s=this.v$
if(s!=null)return s.fM(a)
return this.kO(a)},
bA(){var s=this,r=s.v$
if(r!=null){r.cU(A.O.prototype.gbl.call(s),!0)
r=s.v$.k3
r.toString
s.k3=r}else s.k3=s.kO(A.O.prototype.gbl.call(s))},
kO(a){return new A.S(A.T(0,a.a,a.b),A.T(0,a.c,a.d))},
cF(a,b){var s=this.v$
s=s==null?null:s.bj(a,b)
return s===!0},
eh(a,b){},
aJ(a,b){var s=this.v$
if(s!=null)a.fF(s,b)}}
A.ow.prototype={
E(){return"HitTestBehavior."+this.b}}
A.q3.prototype={
bj(a,b){var s,r=this
if(r.k3.B(0,b)){s=r.cF(a,b)||r.u===B.a6
if(s||r.u===B.cv)a.F(0,new A.kW(b,r))}else s=!1
return s},
hs(a){return this.u===B.a6}}
A.yZ.prototype={
szT(a){if(this.u.j(0,a))return
this.u=a
this.a1()},
bA(){var s=this,r=A.O.prototype.gbl.call(s),q=s.v$,p=s.u
if(q!=null){q.cU(p.la(r),!0)
q=s.v$.k3
q.toString
s.k3=q}else s.k3=p.la(r).b8(B.A)},
bC(a){var s=this.v$,r=this.u
if(s!=null)return s.fM(r.la(a))
else return r.la(a).b8(B.A)}}
A.z9.prototype={
sRS(a,b){if(this.u===b)return
this.u=b
this.a1()},
sRQ(a,b){if(this.N===b)return
this.N=b
this.a1()},
xS(a){var s,r,q=a.a,p=a.b
p=p<1/0?p:A.T(this.u,q,p)
s=a.c
r=a.d
return new A.aC(q,p,s,r<1/0?r:A.T(this.N,s,r))},
ym(a,b){var s=this.v$
if(s!=null)return a.b8(b.$2(s,this.xS(a)))
return this.xS(a).b8(B.A)},
bC(a){return this.ym(a,A.HB())},
bA(){this.k3=this.ym(A.O.prototype.gbl.call(this),A.HC())}}
A.q_.prototype={
gdf(){if(this.v$!=null){var s=this.tb$
s.toString}else s=!1
return s},
lX(a){var s=a==null?A.a53():a
s.szV(0,this.j9$)
return s},
soh(a,b){var s=this,r=s.ja$
if(r===b)return
if(s.b!=null&&r!=null)r.I(0,s.gn1())
s.ja$=b
if(s.b!=null)b.Y(0,s.gn1())
s.rh()},
szW(a){if(!1===this.tc$)return
this.tc$=!1
this.b5()},
rh(){var s,r=this,q=r.j9$,p=r.ja$
p=r.j9$=B.d.bW(A.a3_(p.gp(p),0,1)*255)
if(q!==p){s=r.tb$
p=p>0
r.tb$=p
if(r.v$!=null&&s!==p)r.lz()
r.RM()
if(q===0||r.j9$===0)r.b5()}},
uh(a){var s=this.ja$
return s.gp(s)>0},
fL(a){var s,r=this.v$
if(r!=null)if(this.j9$===0){s=this.tc$
s.toString}else s=!0
else s=!1
if(s){r.toString
a.$1(r)}}}
A.yV.prototype={}
A.nP.prototype={
Y(a,b){return null},
I(a,b){return null},
k(a){return"CustomClipper"}}
A.k3.prototype={
Da(a){return this.b.e1(new A.B(0,0,0+a.a,0+a.b),this.c)},
DT(a){if(A.x(a)!==B.H1)return!0
t.qm.a(a)
return!a.b.j(0,this.b)||a.c!=this.c}}
A.mR.prototype={
skL(a){var s,r=this,q=r.u
if(q==a)return
r.u=a
s=a==null
if(s||q==null||A.x(a)!==A.x(q)||a.DT(q))r.mE()
if(r.b!=null){if(q!=null)q.I(0,r.gmD())
if(!s)a.Y(0,r.gmD())}},
aw(a){var s
this.k5(a)
s=this.u
if(s!=null)s.Y(0,this.gmD())},
ab(a){var s=this.u
if(s!=null)s.I(0,this.gmD())
this.iE(0)},
mE(){this.N=null
this.aa()
this.b5()},
snj(a){if(a!==this.a9){this.a9=a
this.aa()}},
bA(){var s,r=this,q=r.k3
q=q!=null?q:null
r.pv()
s=r.k3
s.toString
if(!J.e(q,s))r.N=null},
h0(){var s,r,q=this
if(q.N==null){s=q.u
if(s==null)s=null
else{r=q.k3
r.toString
r=s.Da(r)
s=r}q.N=s==null?q.gmn():s}},
kY(a){var s,r=this
switch(r.a9.a){case 0:return null
case 1:case 2:case 3:if(r.u==null)s=null
else{s=r.k3
s=new A.B(0,0,0+s.a,0+s.b)}if(s==null){s=r.k3
s=new A.B(0,0,0+s.a,0+s.b)}return s}},
m(){this.cR=null
this.hI()}}
A.yY.prototype={
gmn(){var s=this.k3
return new A.B(0,0,0+s.a,0+s.b)},
bj(a,b){var s=this
if(s.u!=null){s.h0()
if(!s.N.B(0,b))return!1}return s.fk(a,b)},
aJ(a,b){var s,r,q=this,p=q.v$
if(p!=null){s=q.ch
if(q.a9!==B.F){q.h0()
p=q.cx
p===$&&A.f()
r=q.N
r.toString
s.saI(0,a.ot(p,b,r,A.dZ.prototype.glI.call(q),q.a9,t.iM.a(s.a)))}else{a.fF(p,b)
s.saI(0,null)}}else q.ch.saI(0,null)}}
A.yX.prototype={
gmn(){var s=$.ak().d7(),r=this.k3
s.rw(new A.B(0,0,0+r.a,0+r.b))
return s},
bj(a,b){var s=this
if(s.u!=null){s.h0()
if(!s.N.B(0,b))return!1}return s.fk(a,b)},
aJ(a,b){var s,r,q,p,o=this,n=o.v$
if(n!=null){s=o.ch
if(o.a9!==B.F){o.h0()
n=o.cx
n===$&&A.f()
r=o.k3
q=r.a
r=r.b
p=o.N
p.toString
s.saI(0,a.Cb(n,b,new A.B(0,0,0+q,0+r),p,A.dZ.prototype.glI.call(o),o.a9,t.n0.a(s.a)))}else{a.fF(n,b)
s.saI(0,null)}}else o.ch.saI(0,null)}}
A.tf.prototype={
seQ(a,b){if(this.bE===b)return
this.bE=b
this.aa()},
se5(a,b){if(this.dV.j(0,b))return
this.dV=b
this.aa()},
sad(a,b){if(this.em.j(0,b))return
this.em=b
this.aa()},
eO(a){this.hH(a)
a.seQ(0,this.bE)}}
A.zf.prototype={
scq(a,b){if(this.tf===b)return
this.tf=b
this.mE()},
sO5(a,b){if(J.e(this.tg,b))return
this.tg=b
this.mE()},
gmn(){var s,r,q=this.k3,p=0+q.a
q=0+q.b
switch(this.tf.a){case 0:s=this.tg
if(s==null)s=B.V
return s.dj(new A.B(0,0,p,q))
case 1:s=(p-0)/2
r=(q-0)/2
return new A.eC(0,0,p,q,s,r,s,r,s,r,s,r,s===r)}},
bj(a,b){var s=this
if(s.u!=null){s.h0()
if(!s.N.B(0,b))return!1}return s.fk(a,b)},
aJ(a,b){var s,r,q,p,o,n,m,l,k,j,i=this
if(i.v$==null){i.ch.saI(0,null)
return}i.h0()
s=i.N.cO(b)
r=$.ak()
q=r.d7()
q.eH(s)
p=a.gb7(a)
if(i.bE!==0&&!0){p.bS(new A.B(s.a,s.b,s.c,s.d).cG(20),$.a3z())
o=i.dV
n=i.bE
m=i.em
p.l7(q,o,n,(m.gp(m)>>>24&255)!==255)}l=i.a9===B.dR
if(!l){r=r.b9()
r.sad(0,i.em)
p.cl(s,r)}r=i.cx
r===$&&A.f()
o=i.k3
n=o.a
o=o.b
m=i.N
m.toString
k=i.ch
j=t.bG.a(k.a)
k.saI(0,a.St(r,b,new A.B(0,0,0+n,0+o),m,new A.R1(i,l),i.a9,j))}}
A.R1.prototype={
$2(a,b){var s,r
if(this.b){s=a.gb7(a)
r=$.ak().b9()
r.sad(0,this.a.em)
s.l6(r)}this.a.fm(a,b)},
$S:10}
A.zg.prototype={
gmn(){var s=$.ak().d7(),r=this.k3
s.rw(new A.B(0,0,0+r.a,0+r.b))
return s},
bj(a,b){var s=this
if(s.u!=null){s.h0()
if(!s.N.B(0,b))return!1}return s.fk(a,b)},
aJ(a,b){var s,r,q,p,o,n,m,l,k,j=this
if(j.v$==null){j.ch.saI(0,null)
return}j.h0()
s=j.k3
r=b.a
q=b.b
p=s.a
s=s.b
o=j.N.cO(b)
n=a.gb7(a)
if(j.bE!==0&&!0){n.bS(new A.B(r,q,r+p,q+s).cG(20),$.a3z())
s=j.dV
r=j.bE
q=j.em
n.l7(o,s,r,(q.gp(q)>>>24&255)!==255)}m=j.a9===B.dR
if(!m){s=$.ak().b9()
s.sad(0,j.em)
n.d9(o,s)}s=j.cx
s===$&&A.f()
r=j.k3
q=r.a
r=r.b
p=j.N
p.toString
l=j.ch
k=t.n0.a(l.a)
l.saI(0,a.Cb(s,b,new A.B(0,0,0+q,0+r),p,new A.R2(j,m),j.a9,k))}}
A.R2.prototype={
$2(a,b){var s,r
if(this.b){s=a.gb7(a)
r=$.ak().b9()
r.sad(0,this.a.em)
s.l6(r)}this.a.fm(a,b)},
$S:10}
A.vz.prototype={
E(){return"DecorationPosition."+this.b}}
A.z2.prototype={
sPb(a){var s,r=this
if(a.j(0,r.N))return
s=r.u
if(s!=null)s.m()
r.u=null
r.N=a
r.aa()},
saX(a,b){if(b===this.a9)return
this.a9=b
this.aa()},
srM(a){if(a.j(0,this.by))return
this.by=a
this.aa()},
ab(a){var s=this,r=s.u
if(r!=null)r.m()
s.u=null
s.iE(0)
s.aa()},
hs(a){var s=this.N,r=this.k3
r.toString
return s.Bk(r,a,this.by.d)},
aJ(a,b){var s,r,q,p=this,o=p.u
if(o==null)o=p.u=p.N.Ao(p.gdg())
s=p.by
r=p.k3
r.toString
q=new A.oA(s.a,s.b,s.c,s.d,r,s.f)
if(p.a9===B.dW){o.ud(a.gb7(a),b,q)
if(p.N.gty())a.vl()}p.fm(a,b)
if(p.a9===B.vT){o=p.u
o.toString
o.ud(a.gb7(a),b,q)
if(p.N.gty())a.vl()}}}
A.zn.prototype={
sBZ(a,b){return},
sdP(a){var s=this
if(J.e(s.N,a))return
s.N=a
s.aa()
s.b5()},
sbI(a){var s=this
if(s.a9==a)return
s.a9=a
s.aa()
s.b5()},
gkF(){return!1},
saQ(a,b){var s,r=this
if(J.e(r.cR,b))return
s=new A.aT(new Float64Array(16))
s.aE(b)
r.cR=s
r.aa()
r.b5()},
sjl(a){return},
gq9(){var s,r,q,p,o,n,m=this,l=m.N
if(l==null)l=null
if(l==null)return m.cR
s=new A.aT(new Float64Array(16))
s.cM()
r=m.k3
q=r.a/2
p=r.b/2
r=q+l.a*q
o=p+l.b*p
n=new A.z(r,o)
s.aA(0,r,o)
r=m.cR
r.toString
s.ce(0,r)
s.aA(0,-n.a,-n.b)
return s},
bj(a,b){return this.cF(a,b)},
cF(a,b){var s=this.by?this.gq9():null
return a.zS(new A.R5(this),b,s)},
aJ(a0,a1){var s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a=this
if(a.v$!=null){s=a.gq9()
s.toString
r=A.a1Q(s)
if(r==null){q=s.a
p=q[0]
o=q[5]
n=q[1]
m=q[4]
l=p*o-n*m
k=q[6]
j=q[2]
i=p*k-j*m
h=q[7]
g=q[3]
f=p*h-g*m
e=n*k-j*o
d=n*h-g*o
c=j*h-g*k
k=q[8]
g=q[9]
h=q[10]
j=q[11]
b=-(g*c-h*d+j*e)*q[12]+(k*c-h*f+j*i)*q[13]-(k*d-g*f+j*l)*q[14]+(k*e-g*i+h*l)*q[15]
if(b===0||!isFinite(b)){a.ch.saI(0,null)
return}q=a.cx
q===$&&A.f()
p=A.dZ.prototype.glI.call(a)
o=a.ch
n=o.a
o.saI(0,a0.ou(q,a1,s,p,n instanceof A.qZ?n:null))}else{a.fm(a0,a1.U(0,r))
a.ch.saI(0,null)}}},
eh(a,b){var s=this.gq9()
s.toString
b.ce(0,s)}}
A.R5.prototype={
$2(a,b){return this.a.pu(a,b)},
$S:16}
A.z6.prototype={
sTn(a){var s=this
if(s.u.j(0,a))return
s.u=a
s.aa()
s.b5()},
bj(a,b){return this.cF(a,b)},
cF(a,b){var s,r,q=this
if(q.N){s=q.u
r=q.k3
r=new A.z(s.a*r.a,s.b*r.b)
s=r}else s=null
return a.n8(new A.QL(q),s,b)},
aJ(a,b){var s,r,q=this
if(q.v$!=null){s=q.u
r=q.k3
q.fm(a,new A.z(b.a+s.a*r.a,b.b+s.b*r.b))}},
eh(a,b){var s=this.u,r=this.k3
b.aA(0,s.a*r.a,s.b*r.b)}}
A.QL.prototype={
$2(a,b){return this.a.pu(a,b)},
$S:16}
A.zh.prototype={
kO(a){return new A.S(A.T(1/0,a.a,a.b),A.T(1/0,a.c,a.d))},
hp(a,b){var s,r=this,q=null
if(t.Y.b(a)){s=r.aL.$1(a)
return s}if(t.U.b(a))return q
if(t.E.b(a)){s=r.bD
return s==null?q:s.$1(a)}if(t.hV.b(a))return q
if(t.v.b(a)){s=r.bE
return s==null?q:s.$1(a)}if(t.EL.b(a)){s=r.dV
return s==null?q:s.$1(a)}if(t._.b(a))return q
if(t.zv.b(a))return q
if(t.zs.b(a))return q}}
A.zb.prototype={
bj(a,b){return this.Fh(a,b)&&!0},
hp(a,b){},
gAu(a){return this.bE},
guS(){return this.dV},
aw(a){this.k5(a)
this.dV=!0},
ab(a){this.dV=!1
this.iE(0)},
kO(a){return new A.S(A.T(1/0,a.a,a.b),A.T(1/0,a.c,a.d))},
$ih8:1,
gtY(a){return this.bT},
gtZ(a){return this.c7}}
A.zk.prototype={
gdf(){return!0}}
A.z7.prototype={
sQZ(a){var s,r=this
if(a===r.u)return
r.u=a
s=r.N
if(s==null||!s)r.b5()},
stt(a){var s=this,r=s.N
if(a==r)return
if(r==null)r=s.u
s.N=a
if(r!==(a==null?s.u:a))s.b5()},
bj(a,b){return!this.u&&this.fk(a,b)},
fL(a){var s,r=this.v$
if(r!=null){s=this.N
s=!(s==null?this.u:s)}else s=!1
if(s){r.toString
a.$1(r)}}}
A.zc.prototype={
sob(a){var s=this
if(a===s.u)return
s.u=a
s.a1()
s.o5()},
dw(a){if(this.u)return null
return this.w0(a)},
giz(){return this.u},
bC(a){if(this.u)return new A.S(A.T(0,a.a,a.b),A.T(0,a.c,a.d))
return this.Fg(a)},
or(){this.F7()},
bA(){var s,r=this
if(r.u){s=r.v$
if(s!=null)s.jt(A.O.prototype.gbl.call(r))}else r.pv()},
bj(a,b){return!this.u&&this.fk(a,b)},
uh(a){return!this.u},
aJ(a,b){if(this.u)return
this.fm(a,b)},
fL(a){if(this.u)return
this.ps(a)}}
A.pZ.prototype={
szM(a){if(this.u===a)return
this.u=a
this.b5()},
stt(a){return},
bj(a,b){return this.u?this.k3.B(0,b):this.fk(a,b)},
fL(a){var s,r,q=this.v$
if(q!=null){s=this.N
r=this.u
s=!r}else s=!1
if(s){q.toString
a.$1(q)}}}
A.jZ.prototype={
shy(a){var s,r=this
if(J.e(r.bT,a))return
s=r.bT
r.bT=a
if(a!=null!==(s!=null))r.b5()},
sil(a){var s,r=this
if(J.e(r.bD,a))return
s=r.bD
r.bD=a
if(a!=null!==(s!=null))r.b5()},
sS8(a){var s,r=this
if(J.e(r.c7,a))return
s=r.c7
r.c7=a
if(a!=null!==(s!=null))r.b5()},
sSe(a){var s,r=this
if(J.e(r.bE,a))return
s=r.bE
r.bE=a
if(a!=null!==(s!=null))r.b5()},
eO(a){var s,r,q=this
q.hH(a)
s=q.bT
if(s!=null)r=!0
else r=!1
if(r)a.shy(s)
s=q.bD
if(s!=null)r=!0
else r=!1
if(r)a.sil(s)
if(q.c7!=null){a.sof(q.gLW())
a.soe(q.gLU())}if(q.bE!=null){a.sog(q.gLY())
a.sod(q.gLS())}},
LV(){var s,r,q=this.c7
if(q!=null){s=this.k3
r=s.a*-0.8
s=s.eK(B.h)
s=A.fk(this.e2(0,null),s)
q.$1(new A.h0(new A.z(r,0),r,s))}},
LX(){var s,r,q=this.c7
if(q!=null){s=this.k3
r=s.a*0.8
s=s.eK(B.h)
s=A.fk(this.e2(0,null),s)
q.$1(new A.h0(new A.z(r,0),r,s))}},
LZ(){var s,r,q=this.bE
if(q!=null){s=this.k3
r=s.b*-0.8
s=s.eK(B.h)
s=A.fk(this.e2(0,null),s)
q.$1(new A.h0(new A.z(0,r),r,s))}},
LT(){var s,r,q=this.bE
if(q!=null){s=this.k3
r=s.b*0.8
s=s.eK(B.h)
s=A.fk(this.e2(0,null),s)
q.$1(new A.h0(new A.z(0,r),r,s))}}}
A.q4.prototype={
sCa(a){var s=this
if(s.u===a)return
s.u=a
s.zm(a)
s.b5()},
sOB(a){if(this.N===a)return
this.N=a
this.b5()},
sPJ(a){if(this.a9===a)return
this.a9=a
this.b5()},
sPH(a){return},
zm(a){var s=this,r=a.fy
r=a.fx
r=r==null?null:new A.bX(r,B.N)
s.cR=r
s.cb=null
s.eZ=null
s.ep=null
s.fB=null},
sbI(a){if(this.hm==a)return
this.hm=a
this.b5()},
fL(a){this.ps(a)},
eO(a){var s,r,q=this
q.hH(a)
a.a=q.N
a.b=