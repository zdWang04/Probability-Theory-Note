#import "@preview/theorion:0.6.0": *
#import cosmos.fancy: *

= 测度论

== 概率空间

#definition[概率空间][
  概率空间是一个三元组——$(Omega, cal(F), P)$，其中
  - $Omega$是结果的集合
  - $cal(F)$是事件的集合
  - $P : cal(F) -> [0, 1]$是一个函数，为每个事件分配概率
]<def:probability-space>

#definition[$sigma$-代数/域][
  $sigma$-代数是$Omega$的子集组成的非空集合，满足：
  + $A in cal(F) => A^c in cal(F)$
  + $forall i in I, A_i in cal(F) => union.big_(i in I) A_i in cal(F)$，其中$I$为可数集合（有限与可数无限）
]<def:sigma-field>

#tip-block[
  由 @def:sigma-field，可以有
  $
    forall i in I, A_i in cal(F) & => A_i^c in cal(F) \
                                 & => union.big_(i in I) A_i^c in cal(F) \
                                 & => (union.big_(i in I) A_i^c)^c = inter.big_(i in I)A_i in cal(F)
  $
  这说明了$sigma$-代数对可数交封闭
]



#note-block[
  $sigma$-代数的定义是一个验证性的定义，类似于一个筛子，从$Omega$的幂集筛选出符合条件的子集，这些子集组成了$sigma$-代数，如果尝试显式的构造定义，会陷入循环论证
]

#definition[可测空间][


  + @def:probability-space 中去除$P$，剩下的是一个可测空间$(Omega, cal(F))$
  + 测度是一个函数$mu : cal(F) -> RR$，满足：
    + 非负性：$forall A in cal(F), mu(A) >= mu(emptyset) = 0$
    + 可数可加性：如果$(A_i)_(i in I)$是可数的不相交集合序列，那么有
      $
        mu(union.big_(i in I)A_i) = sum_(i in I) mu(A_i)
      $
  + 满足(2)的基础上，进一步满足
    $ mu(Omega) = 1 $则称$mu$为概率测度，一般记作$P$

]<def:measurable-space>

#note-block[如无特殊说明，总假设谈论的集合在$cal(F)$中]

#remark[
  对于集合$A$和集合$A_i, i in ZZ^+$，有以下记号
  + 如果$A_1 subset.eq A_2 subset.eq ... and union.big_(i in ZZ^+)A_i = A$则记作$A_i arrow.t A$
  + 如果$A_1 supset.eq A_2 supset.eq ... and inter.big_(i in ZZ^+)A_i = A$则记作$A_i arrow.t A$
]

#theorem[测度基本性质][
  令$mu$为可测空间$(Omega, cal(F))$上的一个测度
  + $A subset.eq B => mu(A) <= mu(B)$
  + $A subset.eq union.big_(m=1)^infinity A_m => mu(A) <= sum_(m=1)^infinity mu(A_m)$
  + $A_i arrow.t A => mu(A_i) <= mu(A)$
  + $A_i arrow.b A and mu(A_1) < +infinity => mu(A_i) arrow.b mu(A)$
]<the:basic-measure-property>

#proof[证明 @the:basic-measure-property][
  + 由于$A subset.eq B$，那么$B = A union (B without A)$，易知$A inter (B without A) = emptyset$，所以有
    $ mu(B) = mu(A) + mu(B without A) >= mu(A) + 0 = mu(A) $
]

#pagebreak()
